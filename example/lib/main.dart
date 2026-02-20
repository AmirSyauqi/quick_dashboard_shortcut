import 'package:flutter/material.dart';
import 'package:quick_dashboard_shortcut/quick_dashboard_shortcut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          QuickDashboardShortcut(
            iconSize: 36,
            title: 'Recommended',
            crossAxisCount: 4,
            childAspectRatio: 1,
            actions: [
              QuickShortcutItems(
                title: 'Mission ',
                imagePath: 'assets/icons/goals.png',
                //iconColor: Colors.blue,
                alertMessage: 'New!',
                alertOffset: const Offset(0, 2),
                onTap: () => debugPrint('Mission tapped'),
              ),
              QuickShortcutItems(
                title: 'Settings',
                icon: Icons.settings_outlined,
                imagePath: 'assets/icons/ringgit.png',
                // alertMessage: 'Huat!',
                // /alertPosition: BadgePosition.bottomRight,
                //alertOffset: Offset(-6, -2),
                iconColor: Colors.green,
                onTap: () => debugPrint('Settings tapped'),
              ),
              QuickShortcutItems(
                title: 'Settings',
                imagePath: 'assets/icons/goals.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('Settings tapped'),
              ),
              QuickShortcutItems(
                title: 'Settings',
                imagePath: 'assets/icons/goals.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('Settings tapped'),
              ),
              QuickShortcutItems(
                title: 'Settings',
                imagePath: 'assets/icons/goals.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('Settings tapped'),
              ),
              QuickShortcutItems(
                title: 'Settings',
                imagePath: 'assets/icons/goals.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('Settings tapped'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
