# quick_dashboard_shortcut

A Flutter widget to quickly build a dashboard "shortcut" section with a title and a grid of actions (icon or asset image), with optional alert badges.

<!--
Screenshot
1) Add a screenshot at `doc/screenshot.png`
2) Uncomment the line below
![Quick dashboard shortcut screenshot](doc/screenshot.png)
-->

## Features

- Section title + actions grid
- Control items per row (`crossAxisCount`)
- Control spacing (`spacing`) and tile aspect ratio (`childAspectRatio`)
- Per-item icon or asset image (`icon` / `imagePath`)
- Optional alert badge (`alertMessage`) with custom color + position + offset
- Theme-friendly defaults (uses `colorScheme.onSurface` as fallback)

## Usage

```dart
QuickDashboardShortcut(
  title: 'Recommended',
  crossAxisCount: 4,
  spacing: 8,
  childAspectRatio: 1,
  iconSize: 36,
  actions: const [
    QuickShortcutItems(title: 'Mission', icon: Icons.flag_outlined),
    QuickShortcutItems(
      title: 'Settings',
      icon: Icons.settings_outlined,
      alertMessage: 'New!',
      alertColor: Colors.red,
      alertPosition: BadgePosition.topRight,
      alertOffset: Offset(0, 2),
    ),
  ],
)
```

### Using images

If you use `imagePath`, the asset must be declared in your app's `pubspec.yaml` under `flutter/assets` and the path must match exactly.

```dart
QuickShortcutItems(
  title: 'Savings',
  imagePath: 'assets/icons/savings.png',
  onTap: () {},
)
```

If the image lives in a *package* (not your app), pass `imagePackage: 'package_name'` and make sure that package includes the asset in its own `pubspec.yaml`.

```dart
QuickShortcutItems(
  title: 'Shopping',
  imagePath: 'assets/icons/cart.png',
  imagePackage: 'some_dependency',
)
```

If an asset fails to load, the widget falls back to a placeholder icon (and prints a debug message in debug builds).

## Notes

- This widget renders a non-scrollable `GridView` (`shrinkWrap: true`, `NeverScrollableScrollPhysics`). If you have many actions, place the whole page inside a `SingleChildScrollView` or `CustomScrollView`.
- If you provide both `imagePath` and `icon`, `imagePath` takes precedence.

## Contributing

PRs and issues are welcome (add `repository` in `pubspec.yaml` so pub.dev can link to it).
