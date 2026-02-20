import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:quick_dashboard_shortcut/quick_dashboard_shortcut.dart';

void main() {
  testWidgets('renders title and actions', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuickDashboardShortcut(
            title: 'Recommended',
            actions: const [
              QuickShortcutItems(title: 'Mission', icon: Icons.flag_outlined),
              QuickShortcutItems(
                title: 'Settings',
                icon: Icons.settings_outlined,
                alertMessage: 'New!',
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Recommended'), findsOneWidget);
    expect(find.text('Mission'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('New!'), findsOneWidget);
  });
}
