// invitations-send — create an org/group invitation (org-admin/manager).
// Body: { email, role, groupId? } → { invitationId }
// RBAC mirrors `koras-web/.../invitations/send/route.ts`.

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";
import { sendInviteEmail } from "../_shared/email.ts";

/** Accept both wire (org_member) and Dart enum (orgMember) role spellings. */
function normalizeRole(raw: string): "org_admin" | "org_manager" | "org_member" | null {
  const v = raw.trim();
  switch (v) {
    case "org_admin":
    case "orgAdmin":
      return "org_admin";
    case "org_manager":
    case "orgManager":
      return "org_manager";
    case "org_member":
    case "orgMember":
      return "org_member";
    default:
      return null;
  }
}

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: { email?: string; role?: string; groupId?: string; orgId?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid request body.", 400);
  }

  const email = (body.email ?? "").trim().toLowerCase();
  const role = normalizeRole(body.role ?? "");
  if (!email || !/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) {
    return error("Invalid email.", 400);
  }
  if (!role) return error("Invalid role.", 400);

  const { data: profile } = await auth.supabase
    .from("profiles")
    .select("role, org_id, full_name, email")
    .eq("id", auth.user.id)
    .maybeSingle();
  if (!profile) return error("Profile not found.", 403);

  // Resolve target org + permission, mirroring the web RBAC.
  let orgId: string | null = null;
  if (profile.role === "super_admin") {
    orgId = body.orgId ?? null;
    if (!orgId) return error("Super admins must supply orgId.", 400);
  } else if (profile.role === "org_admin" && role !== "org_admin" && profile.org_id) {
    orgId = profile.org_id;
  } else if (profile.role === "org_manager" && role === "org_member" && profile.org_id) {
    orgId = profile.org_id;
  } else {
    return error("You don't have permission to send this invitation.", 403);
  }

  const groupId = body.groupId ?? null;
  if (profile.role === "org_manager") {
    if (!groupId) return error("You must specify a class to invite students into.", 400);
    const { data: ownedGroup } = await auth.supabase
      .from("groups")
      .select("id")
      .eq("id", groupId)
      .eq("manager_id", auth.user.id)
      .maybeSingle();
    if (!ownedGroup) return error("You don't manage that class.", 403);
  }
  if (role === "org_member" && !groupId) {
    return error("Members must be invited into a group.", 400);
  }

  // Insert via the RLS-scoped client so org policies still apply.
  const { data: inserted, error: insertError } = await auth.supabase
    .from("org_invitations")
    .insert({
      org_id: orgId,
      group_id: groupId,
      email,
      role,
      invited_by: auth.user.id,
    })
    .select("id, token")
    .single();

  if (insertError || !inserted) {
    console.error("[invitations-send] insert", insertError);
    const msg = insertError?.message?.includes("duplicate key")
      ? "Already invited."
      : "Could not create invitation.";
    return error(msg, 409);
  }

  // Best-effort email (non-blocking on the contract).
  const admin = getAdminClient();
  const { data: org } = await admin
    .from("organizations")
    .select("name")
    .eq("id", orgId)
    .maybeSingle();
  const { data: group } = groupId
    ? await admin.from("groups").select("name").eq("id", groupId).maybeSingle()
    : { data: null };
  const inviteBase = Deno.env.get("INVITE_URL_BASE") || "https://koras.vercel.app";
  await sendInviteEmail({
    to: email,
    inviteUrl: `${inviteBase.replace(/\/$/, "")}/invite/${inserted.token}`,
    organizationName: org?.name ?? "your organization",
    inviterName: profile.full_name ?? profile.email ?? null,
    role,
    groupName: group?.name ?? null,
  }).catch(() => {});

  return json({ invitationId: inserted.id });
});
