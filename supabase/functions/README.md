# Koras mobile edge functions

Deno (Supabase Edge Functions) ports of the privileged operations the mobile
app needs. They reproduce the behaviour of the `koras-web` route handlers in
`koras-web/src/app/api/**` without touching the web project. The authoritative
wire contracts are in `all_docs/mobile/08-api-clients.md`.

## Functions

| Function | Request | Response |
|---|---|---|
| `recordings-presign-put` | `{ scope, ownerId?, id?, contentType }` | `{ uploadUrl, objectKey }` |
| `recordings-presign-get` | `{ objectKey }` | `{ url }` (410 if expired) |
| `ai-tutor-start` | `{ mode }` | `{ sessionId }` |
| `ai-tutor-signed-url` | `{ sessionId }` | `{ signedUrl }` |
| `ai-tutor-end` | `{ sessionId, durationSeconds?, audioObjectKey?, recordingUploadStatus?, elevenlabsConversationId? }` | `{ report }` |
| `ielts-attempt-submit` | `{ attemptId, lessonId, part, audioObjectKey, prompt? }` | `{ report }` |
| `ielts-mock-start` | – | `{ mockTestId }` |
| `ielts-mock-complete` | `{ mockTestId }` | `{ mockTest }` |
| `interview-prep-generate-questions` | `{ scenarioId, jobDescription? }` | `{ questions, extractedContext?, warning? }` |
| `interview-prep-analyze` | `{ attemptId }` | `{ attempt }` (409 when 2 already in flight) |
| `daily-plan-generate` | `{ source? }` | `{ plan }` |
| `daily-plan-complete-item` | `{ itemId, status, planId? }` | `{ plan }` |
| `invitations-send` | `{ email, role, groupId? }` | `{ invitationId }` |
| `invitations-accept` | `{ token }` | `{ ok }` |

`_shared/` holds the cross-function helpers (auth, R2 presigning via
`aws4fetch`, Modal/ElevenLabs clients, the daily-plan engine, the interview
analyze pipeline, and the learner-insights refresh).

## Required secrets

Set these on the Supabase project (`supabase secrets set KEY=value …`).
`SUPABASE_URL`, `SUPABASE_ANON_KEY`, and `SUPABASE_SERVICE_ROLE_KEY` are
injected automatically by the Edge runtime — you do not set them manually.

| Secret | Used by | Notes |
|---|---|---|
| `R2_ACCOUNT_ID` | presign, analyze | Cloudflare R2 account id |
| `R2_ACCESS_KEY_ID` | presign, analyze | R2 S3 access key |
| `R2_SECRET_ACCESS_KEY` | presign, analyze | R2 S3 secret |
| `R2_BUCKET_NAME` | presign, analyze | R2 bucket |
| `MODAL_AI_TUTOR_API_URL` | ai-tutor-end, ielts, interview, daily-plan | Modal base URL |
| `MODAL_DAILY_PLAN_API_URL` | daily-plan-generate | optional; falls back to the AI tutor URL |
| `ELEVENLABS_API_KEY` | ai-tutor-signed-url | ConvAI key |
| `ELEVENLABS_AGENT_ID` | ai-tutor-signed-url | ConvAI agent id |
| `ELEVENLABS_BRANCH_ID` | ai-tutor-signed-url | optional |
| `RESEND_API_KEY` | invitations-send | optional; invite still created without it |
| `INVITE_EMAIL_FROM` | invitations-send | optional sender, e.g. `Koras <noreply@koras.app>` |
| `INVITE_URL_BASE` | invitations-send | optional, default `https://koras.vercel.app` |

## Deploy

```bash
cd mobileapp/koras/supabase
supabase link --project-ref <project-ref>
supabase functions deploy            # all functions
# or one at a time:
supabase functions deploy ai-tutor-end --project-ref <project-ref>
```

## Local type-check

```bash
deno check mobileapp/koras/supabase/functions/**/index.ts
```
