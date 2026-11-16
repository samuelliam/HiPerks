# HiPerks

HiPerks is a multi-platform loyalty and customer-engagement application for local businesses and their customers. Businesses can set up store profiles, loyalty cards, rewards, vouchers, team members, and catalog items. Customers can discover stores, collect and redeem points, access vouchers, place catalog orders, communicate with stores, and receive notifications.

The app is built with FlutterFlow and Flutter and targets Android, iOS, macOS, and the web.

## What it includes

### Customer experience

- Browse and search stores
- View store details, loyalty cards, catalog items, and redeemable rewards
- Scan QR codes to identify vouchers and loyalty activity
- Track cards, vouchers, and transaction history
- Chat with participating businesses
- Receive push notifications

### Business experience

- Create and customise store pages, branches, cards, and catalog entries
- Manage redeemable rewards, vouchers, and customer orders
- Add and manage team members and access roles
- Review customer activity and transaction details
- Share store links and QR codes
- Use subscription-gated business plans through RevenueCat

## Technology

| Area | Implementation |
| --- | --- |
| Client | Flutter, Dart, FlutterFlow-generated UI, Provider, GoRouter |
| Identity | Firebase Authentication, including email, Google, Apple, GitHub, anonymous, and JWT flows |
| Data | Cloud Firestore and Firebase Storage |
| Server capabilities | Firebase Cloud Functions for FCM token registration and push delivery |
| Reliability | Firebase App Check, Crashlytics, Analytics, Performance Monitoring, and Remote Config |
| Commerce | RevenueCat subscriptions |
| Device features | Camera/QR scanning, image selection, notifications, maps, and local secure features |

## Repository layout

```text
lib/
  main.dart              App startup, Firebase, RevenueCat, and routing setup
  authentication_pages/  Sign-in and onboarding flows
  store_*/               Store discovery, details, customisation, and catalogue flows
  backend/               Firestore models, authentication, API, cloud-function client code
  custom_code/           QR, places, RevenueCat, and workflow-specific actions
  flutter_flow/          FlutterFlow framework and generated shared UI utilities
firebase/
  firestore.rules        Firestore access rules
  storage.rules          Storage access rules
  functions/             Node.js Firebase Cloud Functions
assets/                  Application images, fonts, and animations
android/, ios/, macos/, web/  Platform projects and configuration
```

## Prerequisites

- Flutter stable SDK. This project was configured for Flutter `3.47.6` through FVM; a compatible Flutter stable version is required.
- Xcode for iOS/macOS builds and Android Studio plus the Android SDK for Android builds.
- A Firebase project with Authentication, Firestore, Storage, Cloud Messaging, App Check, Crashlytics, Analytics, Performance Monitoring, and Remote Config enabled.
- Node.js 20 and Firebase CLI if you need to work with the Cloud Functions or deploy Firebase rules.
- A RevenueCat project and platform API keys for subscription features.

## Run locally

1. Clone the repository and enter the project folder.

   ```bash
   git clone https://github.com/samuelliam/HiPerks.git
   cd HiPerks
   ```

2. Install Dart and Flutter dependencies.

   ```bash
   flutter pub get
   ```

3. Select a connected device or simulator, then run the app.

   ```bash
   flutter run
   ```

4. For web development:

   ```bash
   flutter run -d chrome
   ```

The project uses Firebase platform configuration files for native builds and Firebase options in `lib/backend/firebase/firebase_config.dart` for web. Use a Firebase project you are authorised to access; do not point a development build at production data unless you intend to.

## Firebase and Cloud Functions

The Firebase configuration is under `firebase/`.

```bash
cd firebase/functions
npm install
npm run lint
cd ..
firebase deploy --only firestore:rules,storage,functions
```

The included functions register authenticated device tokens and deliver Firebase Cloud Messaging notifications when push-notification documents are created. Deployment requires access to the configured Firebase project and the Firebase CLI.

## Security and configuration notes

- Do not commit `.env` files, private keys, service-account JSON, or signing credentials.
- Client Firebase identifiers and mobile client API keys are not treated as secrets by Firebase, but must be protected with appropriate Firebase Security Rules, App Check, and Google Cloud API restrictions.
- The project contains Firebase configuration and service identifiers from its existing setup. Before deploying a fork, create or connect your own Firebase and RevenueCat projects, restrict the relevant API keys, and review the Firestore and Storage rules for your intended access model.
- Review `firebase/firestore.rules` before production deployment. The current rules permit several public reads and broad authenticated writes to support the existing app flows.

## Useful commands

```bash
# Analyze the Dart code
flutter analyze

# Run widget tests
flutter test

# Build a web release
flutter build web

# Build Android or iOS artifacts
flutter build apk
flutter build ios
```

Generated directories such as `.dart_tool/`, `build/`, `node_modules/`, editor metadata, and platform build output are excluded from version control. Recreate them with the commands above rather than committing them.

## Current limitations

This repository is an exported FlutterFlow project. Changes to generated FlutterFlow files can be overwritten by a later export, so keep custom behaviour isolated in `lib/custom_code/` where possible and document manual changes before re-exporting.

## License

No license has been specified. Treat the source as proprietary unless the repository owner adds an explicit license.
