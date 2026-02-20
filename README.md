# quick_dashboard_shortcut

A small Flutter widget to render a grid of “quick actions” (icon or asset image) with an optional badge.

## Features

- Grid layout via `GridView.builder`
- Icon or `Image.asset` support
- Optional badge (`alertMessage`) with configurable position + offset

## Usage

```dart
QuickDashboardShortcut(
  title: 'Recommended',
  crossAxisCount: 4,
  actions: const [
    QuickShortcutItems(title: 'Mission', icon: Icons.flag_outlined),
    QuickShortcutItems(
      title: 'Settings',
      icon: Icons.settings_outlined,
      alertMessage: 'New!',
    ),
  ],
)
```

### Using images

If you use `imagePath`, the asset must be declared in your app’s `pubspec.yaml` under `flutter/assets`.

If the image lives in a *package* (not your app), pass `imagePackage: 'package_name'` and make sure that package includes the asset.

## Contributing

PRs and issues are welcome (add `repository` in `pubspec.yaml` so pub.dev can link to it).
