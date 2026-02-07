<p align="center">
  <img src="assets/images/app_launcher_icon.png" alt="Violeta" width="120" height="120" style="border-radius: 24px;" />
</p>

<h1 align="center">Violeta</h1>

<p align="center">
  <strong>Seguridad y apoyo para mujeres en Venezuela</strong><br/>
  <em>Safety & support app for women</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-3.0.3-D04870?style=flat-square" alt="Version" />
  <img src="https://img.shields.io/badge/flutter-%E2%89%A53.0.0-02569B?style=flat-square&logo=flutter" alt="Flutter" />
  <img src="https://img.shields.io/badge/backend-Supabase-3ECF8E?style=flat-square&logo=supabase" alt="Supabase" />
  <img src="https://img.shields.io/badge/platform-iOS%20%7C%20Android%20%7C%20Web-200030?style=flat-square" alt="Platforms" />
</p>

---

## About

**Violeta** is a mobile application designed to protect and support women facing gender-based violence in Venezuela. The app provides immediate access to emergency tools, educational resources, service directories, and safety features — all in Spanish.

Built with Flutter and powered by Supabase, Violeta runs on iOS, Android, and Web.

## Features

### Emergency Tools
- **Emergency Button** — One-tap alert that notifies pre-configured emergency contacts with your real-time location
- **Accompany Me** (*Acompaname*) — Timed safety companion that triggers an automatic alert if you don't check in within your set timeframe
- **Emergency Contacts** — Manage trusted contacts who receive alerts and location data during emergencies

### Violence Assessment
- **Violentometro** — Interactive violence assessment tool to help identify warning signs and levels of violence in a relationship
- **Interactive Questionnaire** (*Cuestionario Interactivo*) — Guided self-assessment to evaluate personal safety situations
- **Trivia** — Educational trivia to raise awareness about gender-based violence

### Information & Resources
- **Service Directory** (*Directorio*) — Searchable directory of support services filtered by state and municipality across Venezuela
- **Help Lines** (*Lineas de Atencion*) — Quick access to national and regional emergency phone numbers and hotlines
- **Routes of Care** (*Rutas de Atencion*) — Step-by-step guidance on how to seek help and navigate institutional support
- **Educational Articles** — In-depth content on topics including reproductive rights, types of violence, legislation, and prevention

### Communication
- **In-App Chat** — Secure messaging within the app
- **Notifications** — Stay informed with relevant alerts and updates

### User Experience
- **Guided Onboarding** — Walkthrough that helps new users configure the app and understand its features
- **User Profile** — Personal profile with settings and preferences
- **Location Services** — GPS integration for emergency location sharing

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter 3.x (Dart >=3.0.0) |
| **UI Builder** | FlutterFlow (exported for manual development) |
| **Backend** | Supabase (Auth, Database, Storage, Edge Functions) |
| **Auth** | Supabase Auth + Sign in with Apple |
| **State** | Provider + ChangeNotifier with FlutterSecureStorage |
| **Navigation** | GoRouter |
| **Storage** | FlutterSecureStorage (sensitive data), Hive (cache) |

## Getting Started

### Prerequisites

- Flutter SDK (stable channel, Dart >=3.0.0 <4.0.0)
- Xcode (for iOS builds)
- Android Studio (for Android builds)
- A connected device or emulator

### Installation

```bash
# Clone the repository
git clone git@github.com:lordalex/violeta-2026.git
cd violeta-2026

# Install dependencies
flutter pub get

# Run on a connected device
flutter run

# Run on iOS Simulator
flutter run -d iPhone

# Run on Chrome (web)
flutter run -d chrome
```

### Build

```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Run tests
flutter test
```

## Project Structure

```
lib/
├── auth/                  # Authentication pages (login, registration, password reset)
├── backend/               # Supabase client, API calls, database schemas
│   └── supabase/
│       └── database/      # Table definitions (SupabaseTable/SupabaseDataRow)
├── chat/                  # In-app messaging
├── components/            # Reusable UI components (model + widget pairs)
├── custom_code/
│   ├── actions/           # Custom business logic actions
│   └── widgets/           # Custom widget implementations
├── directorio/            # Service directory pages
├── flutter_flow/          # FlutterFlow framework (theme, nav, utils, animations)
├── home/                  # Home, emergency button, accompany me, help lines
├── onboarding/            # Guided setup flow
├── perfil/                # User profile & settings
├── violentometro/         # Violence assessment tools
├── app_constants.dart     # Centralized URLs and configuration
├── app_state.dart         # Global app state (FFAppState)
├── index.dart             # Page exports
└── main.dart              # App entry point
```

## Design

Violeta uses a carefully chosen color palette that conveys safety, trust, and empowerment:

| Role | Color | Hex |
|------|-------|-----|
| **Primary** | Dark Purple | `#200030` |
| **Secondary** | Pink | `#D04870` |
| **Tertiary** | Light Lavender | `#EAE3EB` |

**Typography:** Inter Tight (headings) / Inter (body)

## Contributing

Violeta is an open-source project with a social mission. Contributions are welcome.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -m 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

## License

This project is developed for social impact. Contact the maintainers for licensing details.

---

<p align="center">
  <strong>Violeta</strong> — Porque ninguna mujer deberia enfrentar la violencia sola.<br/>
  <em>Because no woman should face violence alone.</em>
</p>
