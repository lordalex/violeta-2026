# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Violeta is a Flutter mobile app (v3.0.3+29) built with **FlutterFlow** and exported for manual development. It is a Spanish-language safety/support app targeting women, with features including emergency contacts, location tracking, a "violentometro" (violence assessment tool), service directories, chat, and an "acompaname" (accompany me) timed safety feature.

## Build & Run Commands

```bash
flutter pub get                    # Install dependencies
flutter run                        # Run on connected device/emulator
flutter run -d chrome              # Run on web (web target exists)
flutter build apk                  # Build Android APK
flutter build ios                  # Build iOS
flutter test                       # Run tests (minimal - single smoke test)
flutter test test/widget_test.dart # Run single test
```

**SDK requirement:** Dart >=3.0.0 <4.0.0 (Flutter stable channel)

## Architecture

### FlutterFlow Code Generation Pattern

This is a FlutterFlow-exported project. Each page/component follows a strict Model + Widget pair pattern:

- `*_model.dart` — State fields, local state, child component models. Extends `FlutterFlowModel<T>`.
- `*_widget.dart` — UI and lifecycle. References `_model` for state. Uses `safeSetState()` instead of `setState()`.

Pages define static `routeName` and `routePath` fields used by the router.

### Key Directories

- **`lib/flutter_flow/`** — FlutterFlow framework code (theme, nav, utils, animations, widgets). Generally **do not modify** these files directly.
- **`lib/custom_code/actions/`** — Custom Dart actions (business logic callable from FlutterFlow pages). Exported via `index.dart`.
- **`lib/custom_code/widgets/`** — Custom widgets (e.g., `custom_clender.dart`). Exported via `index.dart`.
- **`lib/components/`** — Reusable UI components (model + widget pairs).
- **`lib/auth/`** — Auth pages (login, registration, password reset) + Supabase auth integration.
- **`lib/backend/`** — Supabase client, API calls, database table definitions, schema structs.

### Backend

- **Supabase** is the sole backend (auth, database, storage, edge functions).
- `SupaFlow` singleton in `lib/backend/supabase/supabase.dart` initializes the Supabase client.
- API endpoints are Supabase edge functions at `/functions/v1/api/` (profile CRUD, location, tests).
- Constants/URLs are centralized in `lib/app_constants.dart` (`FFAppConstants`).
- Database tables extend `SupabaseTable<T>` / `SupabaseDataRow` in `lib/backend/supabase/database/`.

### State Management

- **`FFAppState`** (`lib/app_state.dart`) — Global app state singleton using `ChangeNotifier` + `Provider`. Persisted fields use `FlutterSecureStorage` (with CSV serialization for lists).
- **Page-level state** — Managed in each page's `*_model.dart`.
- Key persisted state: `firstTime`, `PerfilCreado`, `ContactosDeEmergencia`, `walktroughCompleted`, `profile`, `message`, emergency timer fields (`startedDateTimeAcompaname`, `counterAcompaname`, etc.).

### Navigation

- **GoRouter** configured in `lib/flutter_flow/nav/nav.dart` via `FFRoute` wrappers.
- All page routes are registered in `createRouter()`. Route definitions reference each widget's static `routeName`/`routePath`.
- Auth redirect: unauthenticated users are sent to `/loginPage`. Post-login redirect is managed by `AppStateNotifier`.
- `lib/index.dart` re-exports all page widgets.

### Internationalization

- App is **Spanish-only** (`Locale('es')`). Translations are in `lib/flutter_flow/internationalization.dart`.

## Important Conventions

- **Analyzer exclusions:** `lib/custom_code/**` and `lib/flutter_flow/custom_functions.dart` are excluded from analysis (`analysis_options.yaml`). These files may have lint warnings by design.
- Custom actions are standalone async functions that receive `BuildContext` and return values. They are registered in `lib/custom_code/actions/index.dart`.
- Theme colors: primary `#200030` (dark purple), secondary `#D04870` (pink), tertiary `#EAE3EB` (light lavender). Fonts: Inter Tight (headings), Inter (body).
- The app uses `FlutterSecureStorage` (not SharedPreferences) for sensitive persisted state.
