# TravelTek

A Flutter travel and booking app with splash screen, home feed, and tabbed navigation.

## Features

- **Splash Screen** – Animated gradient logo with wave transition
- **Home** – Category chips, search form, Recent Search, Hot & Trending, Life Experience®, Flash Deals, promo banners
- **My Trips** – Placeholder for trip management
- **Wishlist** – Placeholder for saved items
- **Account** – Placeholder for user account

## Requirements

- Flutter SDK ^3.7.2
- Dart ^3.7.2

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Build

- **Debug:** `flutter run`
- **Release (Android):** `flutter build apk`
- **Release (iOS):** `flutter build ios`
- **Release (Web):** `flutter build web`

## Project Structure

```
lib/
├── app/
│   ├── core/
│   │   └── theme/          # Colors, styles, constants
│   ├── modules/
│   │   ├── home/           # Home view, controller, binding
│   │   └── splash/         # Splash view, controller, binding
│   └── routes/             # App routing
└── main.dart
```

## Dependencies

- **getX** – State management and routing
- **flutter_svg** – SVG asset rendering
- **google_fonts** – Custom typography
