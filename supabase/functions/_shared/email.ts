// Minimal best-effort transactional email via Resend, used by
// invitations-send. If RESEND_API_KEY is absent the invite is still
// created and the function returns success — the email is non-critical
// for the mobile flow (the invitation id is the contract).

export async function sendInviteEmail(params: {
  to: string;
  inviteUrl: string;
  organizationName: string;
  inviterName: string | null;
  role: string;
  groupName: string | null;
}): Promise<{ ok: boolean; error?: string }> {
  const apiKey = Deno.env.get("RESEND_API_KEY");
  const from = Deno.env.get("INVITE_EMAIL_FROM") || "Koras <noreply@koras.app>";
  if (!apiKey) return { ok: false, error: "email_not_configured" };

  const roleLabel = params.role.replace(/^org_/, "").replace(/_/g, " ");
  const subject = `You've been invited to ${params.organizationName} on Koras`;
  const intro = params.inviterName
    ? `${params.inviterName} invited you`
    : "You've been invited";
  const groupLine = params.groupName ? ` to the class “${params.groupName}”` : "";
  const html = `
    <div style="font-family:system-ui,sans-serif;max-width:480px;margin:0 auto">
      <h2>Join ${params.organizationName} on Koras</h2>
      <p>${intro}${groupLine} as a ${roleLabel}.</p>
      <p><a href="${params.inviteUrl}" style="display:inline-block;padding:12px 20px;background:#111;color:#fff;border-radius:8px;text-decoration:none">Accept invitation</a></p>
      <p style="color:#666;font-size:13px">Or paste this link into your browser:<br>${params.inviteUrl}</p>
    </div>`;
  const text = `${intro}${groupLine} as a ${roleLabel}.\n\nAccept: ${params.inviteUrl}`;

  try {
    const res = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${apiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ from, to: params.to, subject, html, text }),
    });
    if (!res.ok) {
      const detail = await res.text().catch(() => "");
      return { ok: false, error: `resend_${res.status}: ${detail.slice(0, 200)}` };
    }
    return { ok: true };
  } catch (err) {
    return { ok: false, error: err instanceof Error ? err.message : "send_failed" };
  }
}
