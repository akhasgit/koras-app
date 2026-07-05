// invitations-accept — link the signed-in caller to the org/group/role
// carried by an invitation token. Body: { token } → { ok }
// Mobile callers are always authenticated, so this is the existing-user
// path from `koras-web/.../invitations/accept/route.ts`.

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: { token?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid request body.", 400);
  }
  const token = (body.token ?? "").trim();
  if (token.length < 16) return error("Invalid token.", 400);

  const admin = getAdminClient();
  const { data: invite } = await admin
    .from("org_invitations")
    .select("id, email, role, org_id, group_id, accepted, expires_at")
    .eq("token", token)
    .maybeSingle();

  if (!invite) return error("Invitation not found.", 404);
  if (invite.accepted) return error("This invitation has already been accepted.", 410);
  if (new Date(invite.expires_at).getTime() < Date.now()) {
    return error("This invitation has expired.", 410);
  }

  if ((auth.user.email ?? "").toLowerCase() !== invite.email.toLowerCase()) {
    return error(
      "You're signed in with a different email than this invitation.",
      409,
    );
  }

  const { error: profileError } = await admin
    .from("profiles")
    .update({
      role: invite.role,
      org_id: invite.org_id,
      group_id: invite.group_id,
    })
    .eq("id", auth.user.id);
  if (profileError) {
    console.error("[invitations-accept] profile update", profileError);
    return error("Could not link your account to the organization.", 500);
  }

  // Managers take ownership of their (still-unowned) group.
  if (invite.role === "org_manager" && invite.group_id) {
    await admin
      .from("groups")
      .update({ manager_id: auth.user.id })
      .eq("id", invite.group_id)
      .is("manager_id", null);
  }

  const { error: inviteError } = await admin
    .from("org_invitations")
    .update({
      accepted: true,
      accepted_at: new Date().toISOString(),
      accepted_by: auth.user.id,
    })
    .eq("id", invite.id);
  if (inviteError) {
    console.error("[invitations-accept] invite update", inviteError);
  }

  return json({ ok: true, role: invite.role });
});
