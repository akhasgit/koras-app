# Cursor master prompt

Paste the block below into Cursor (Composer / Agent mode) with this repo open. It's the standing
instruction set for building the app. After pasting, your first message can just be:
**"Start Phase 1."**

---

```
You are building the Koras mobile app: a Flutter (iOS + Android) port of the existing
`koras-web` Next.js app. It reuses every backend unchanged (Supabase + Postgres RLS,
Cloudflare R2, Modal, ElevenLabs).

SPEC AND PLAN — read these first, and keep them open:
- The build guide:  mobileapp/koras/BUILD_KORAS.md  (the ordered, phase-by-phase plan)
- The full spec:    all_docs/mobile/                (30 docs, 00–27 + 00.5 + README)
- You are working inside the Flutter project at: mobileapp/koras/

HOW TO WORK:
1. Read the relevant numbered doc in all_docs/mobile/ BEFORE writing any code for that area.
   The docs contain the models, providers, edge-function contracts, and gotchas. Don't improvise
   what's already specified. The Dart snippets are the intended real code — match their names and
   signatures; fill any `// …` from the cited `koras-web/src/...` source.
2. Canon has ONE home — never re-declare or rename across features:
   - enums + naming + Riverpod conventions → 27-glossary-and-conventions.md
   - theme tokens (ember/emberPressed/emberSoft/ink900/…/cream/paper/paperWarm/line) → 11
   - models + the drift schema → 07
   - edge-function wire contracts → 08
   - project/folder tree → 01
3. Stack: Riverpod 2 (generated, @riverpod), go_router, freezed + json_serializable, drift, record
   + audio_session + just_audio. After ANY model/provider change run:
   `dart run build_runner build --delete-conflicting-outputs` and commit the generated files.
4. Security: the app ships ONLY the Supabase anon key + the public Modal URL. RLS is the boundary.
   Anything privileged is called as a named Supabase Edge Function (see doc 08). NEVER put a
   service-role key, R2 key, ELEVENLABS_API_KEY, or RESEND_API_KEY in the app.
5. Edge functions are a BACKEND PREREQUISITE — you call them by name but they're built/deployed
   separately. If one isn't deployed yet, build the client + a mock and continue; don't treat a
   missing function as a client bug. Doc 26 lists which functions each phase needs.
6. SCOPE (V1): build the learner experience + org-admin + class-manager (teacher) dashboards.
   The global super-admin panel and all marketing pages are WEB-ONLY (doc 18). Use polling (not
   Realtime) for async status; NO push notifications (FCM is later); light theme only.
7. Don't invent server-owned logic on-device (e.g. the daily plan is generated server-side, doc 16).

WORKFLOW PER FEATURE:
  open the feature doc → add/adjust freezed models (run codegen) → write the repository (data/) →
  write the Riverpod notifier/providers → build the screen + widgets (doc 10, use context.koras.*
  tokens) → `flutter analyze --fatal-infos && flutter test` → verify against the doc's gate.

BUILD ORDER: follow the phases in BUILD_KORAS.md exactly:
  Phase 1 Foundation → 2 Auth/onboarding/shell → 3 Recording → 4 Programs → 5 Org & manager → 6 Beta.
  Finish and verify a phase's "done when" before starting the next. Work in small, reviewable PRs.

BEFORE PHASE 1: if any "Values you must supply" (doc 03 — bundle id, URL scheme, universal-link
host, SUPABASE_URL / SUPABASE_ANON_KEY, MODAL_BASE_URL, Apple Team ID, font files) are unknown,
ASK me for them rather than guessing. Then create env/dev.json and env/prod.json.

When you start a phase, first restate its scope, the docs you'll read, and the edge functions it
needs; then proceed. Keep going phase by phase, pausing at each "done when" gate for me to verify.
```

---

## Tips

- If Cursor drifts from a doc, reply: *"Re-read `all_docs/mobile/<doc>` and align to it."*
- Build the **edge functions** in parallel (separately) — they gate Phases 2–5. See `all_docs/mobile/08-api-clients.md` for every contract and `all_docs/transition/` for the Deno drafts.
- Keep PRs to one feature/phase-slice so the verification gates stay meaningful.
