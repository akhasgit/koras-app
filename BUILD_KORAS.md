# BUILD_KORAS.md — how to build the Koras Flutter app

This is the **build guide** for this Flutter project. It turns the full specification in
`all_docs/mobile/` into an ordered, do-this-next plan you can execute feature by feature.

- **You are here:** `mobileapp/koras/` — the Flutter app (a `flutter create` skeleton).
- **The spec:** `all_docs/mobile/` at the repo root (from this file: `../../all_docs/mobile/`).
  30 docs, numbered `00`–`27` + `00.5` + `README`. **It is the source of truth — read the relevant doc before writing code.**
- **Goal:** a faithful Flutter (iOS + Android) port of the `koras-web` Next.js app, reusing every
  backend unchanged (Supabase + RLS, Cloudflare R2, Modal, ElevenLabs).

## Golden rules (read once, follow always)

1. **Read the doc before you build the thing.** Each feature has a numbered doc with the models,
   providers, edge-function contracts, and gotchas. Don't improvise what's already specified.
2. **Canon docs win.** Names, enums, and tokens have ONE home: enums + conventions →
   `27-glossary-and-conventions.md`; theme tokens → `11-design-system.md`; models + drift →
   `07-data-schema.md`; edge-function wire contracts → `08-api-clients.md`; project tree →
   `01-architecture.md`. Never re-declare or rename these per feature.
3. **Snippets are real code.** The Dart in the docs is the intended implementation — short, with
   `// …` you fill from the cited `koras-web/src/...` source. Match signatures exactly.
4. **Run codegen after every model/provider change:**
   `dart run build_runner build --delete-conflicting-outputs`. Commit the generated files.
5. **RLS is the security boundary.** The app ships only the Supabase anon key (this is fine).
   Anything privileged goes through an **edge function** — never put service-role keys, R2 keys,
   `ELEVENLABS_API_KEY`, or `RESEND_API_KEY` in the app.
6. **Edge functions are a backend prerequisite.** They are *called* by name (see `08`) but built
   and deployed separately. If a screen depends on a function that isn't deployed yet, build the
   client + a mock and move on — don't mistake a missing function for a client bug.
7. **Stay in V1 scope.** Build the learner experience + org-admin + class-manager (teacher)
   dashboards. The **super-admin panel and marketing pages are web-only** (`18`). V1 uses polling
   (not Realtime) and **no push** (FCM is V1.1+); light theme only.
8. **Don't invent server logic on-device** (e.g. the daily plan is server-owned — `16`). New
   shared logic belongs in an edge function.

## Before you start: values you must supply

Fill the **"Values you must supply"** table in `03-environment-setup.md`: app bundle id, URL
scheme, universal-link host, `SUPABASE_URL` / `SUPABASE_ANON_KEY` (staging + prod), `MODAL_BASE_URL`,
Apple Team ID, and the font `.ttf` files (`11`). Signing material (Fastlane `match`, Play
service-account, keystore) is needed only at release (`24`). `ELEVENLABS_AGENT_ID` and all secrets
live in the edge-function workspace, not here.

## Per-feature workflow (the loop you repeat)

```
1. Open the feature's doc in all_docs/mobile/ (+ its "Source of truth" web files for detail).
2. Add/adjust models in the doc's Code-map paths (freezed) → run build_runner.
3. Write the repository (data/) — call Supabase directly or an edge function per doc 08.
4. Write the Riverpod notifier/providers (presentation/) — generated, autoDispose.
5. Build the screen + widgets (10), wired to the provider; use context.koras.* tokens (11).
6. flutter analyze --fatal-infos && flutter test ; verify against the doc's gate.
```

## Build order

Follow the six phases from `26-build-roadmap.md`. Each phase below lists **read → do → done-when**.
Don't start a phase whose edge functions aren't deployed (see the phase→EF map in `26`).

### Phase 1 — Foundation
- **Read:** `00.5` (scaffold), `01` (tree), `03` (env/platform), `02` (pubspec), `27` (enums),
  `11` (theme), `08` (clients + `AppError`), `07` (models + drift).
- **Do:** create the `lib/` tree + placeholder files (`00.5`); set `pubspec.yaml` (`02`) and run
  `pub get` + codegen; wire `main.dart` (Supabase PKCE init, audio session) and `app.dart`
  (`MaterialApp.router` + `ProviderScope` + `buildKorasTheme()`); add the service clients and
  `enums.dart`; set up CI (`24`).
- **Done when:** the app boots to a themed, signed-out login screen; `analyze` + `test` pass.

### Phase 2 — Auth, onboarding, dashboard shell
- **Read:** `04` (router/guards), `05` (auth), `06` (tenancy), `19` (onboarding), `20` (dashboards),
  `09` (screens), `10` (widgets).
- **Do:** `go_router` with `_topLevelRedirect`; `AuthRepository` + Google/**Apple** sign-in;
  `currentProfileProvider`; onboarding flows (port the quiz const from `19`); role-aware home shells
  + bottom nav / sub-nav (port role normalisation from `20`).
- **Needs EF:** `invitations-accept`.
- **Done when:** sign up → onboarding → correct role home, end to end.

### Phase 3 — Recording primitives
- **Read:** `12` (voice pipeline), `21` (R2 keys), `23` (program access).
- **Do:** `VoiceRecorder` (`record` + `audio_session`) + `Waveform`; presign → `http.put` → Modal
  `/analyze` → `voice_assessments` insert; `just_audio` playback; program gating + `LockedScreen`
  (`kPrograms` catalogue from `23`).
- **Needs EF:** `recordings-presign-put`, `recordings-presign-get`.
- **Done when:** record 30s → upload → analyze → assessment row + playback works.

### Phase 4 — Programs live
- **Read:** `13` (AI Tutor), `16` (daily plan), `17` (insights), `14` (IELTS), `15` (Interview Prep).
- **Do:** AI Tutor state machine + ElevenLabs WebSocket; daily-plan card (server-owned, lazy);
  insights `ProgressCard` + sparkline; IELTS block runtime + scoring (port `scoreToBand` verbatim);
  Interview async practice + drift resume + concurrency-aware analysis.
- **Needs EF:** `ai-tutor-start/-signed-url/-end`, `daily-plan-generate/-complete-item`,
  `ielts-attempt-submit`, `interview-prep-analyze/-generate-questions`.
- **Done when:** a full AI Tutor session yields a report + refreshed insights; an IELTS attempt and
  an Interview answer each grade end-to-end; the dashboard shows a generated daily plan.

### Phase 5 — Org admin & class manager + polish
- **Read:** `20` (manager/org-admin depth), `06` (invitations), `22` (deep links), `25` (integrations audit).
- **Do:** teacher home (`ClassCard` + invite sheet) + student detail (read-only insights/plan);
  org-admin sub-nav + user/group management; deep-link/email intercepts.
- **Needs EF:** `invitations-send`, `org-users-actions`.
- **Done when:** a manager invites a student and views their insights + plan; an org admin manages
  a user and org settings.

### Phase 6 — Beta / GA
- **Read:** `24` (release), `11` (bundle fonts), `25` (Sentry, optional).
- **Do:** Fastlane lanes → TestFlight / Play internal; swap `google_fonts` → bundled fonts.
- **Done when:** a signed build installs from a beta track and passes a full smoke test on a
  physical device (mic, deep links, all three programs).

## Definition of done (every PR)

- The relevant `all_docs/mobile/` doc was followed; names/enums/tokens match canon.
- `dart run build_runner build` produces no diff (generated files committed).
- `dart format` clean; `flutter analyze --fatal-infos` clean; `flutter test` green.
- No secret beyond the Supabase anon key + public Modal URL is present in the app.

## Quick reference

| Need | Doc |
|---|---|
| Folder tree, layers | `01` |
| pubspec / packages | `02` |
| Env vars, iOS/Android config, run commands | `03` |
| Enums, naming, Riverpod conventions | `27` |
| Theme tokens + `KorasTheme` | `11` |
| Models + drift | `07` |
| Edge-function contracts + `AppError` | `08` |
| Routing + guards | `04` |
| Phases + which EFs each needs | `26` |
