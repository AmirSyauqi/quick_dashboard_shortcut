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
      home: const MyHomePage(title: 'Quick Dashboard Shortcut Example'),
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
          SizedBox(height: 26),
          QuickDashboardShortcut(
            iconSize: 36,
            title: 'Recommended',
            crossAxisCount: 4,
            spacing: 0,
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
                title: 'Savings',
                icon: Icons.settings_outlined,
                imagePath: 'assets/icons/ringgit.png',
                // alertMessage: 'Huat!',
                // /alertPosition: BadgePosition.bottomRight,
                //alertOffset: Offset(-6, -2),
                iconColor: Colors.green,
                onTap: () => debugPrint('Savings tapped'),
              ),
              QuickShortcutItems(
                title: 'E-Angpou',
                imagePath: 'assets/icons/money.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('E-Angpou tapped'),
              ),
              QuickShortcutItems(
                title: 'Shopping',
                imagePath: 'assets/icons/shopping.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('Shopping tapped'),
              ),

              QuickShortcutItems(
                title: 'Bills',
                imagePath: 'assets/icons/bills.png',
                iconColor: Colors.amber,
                onTap: () => debugPrint('Bills tapped'),
              ),
              QuickShortcutItems(
                title: 'Invest',
                imagePath: 'assets/icons/invest.png',
                alertMessage: '3.00%',
                alertPosition: BadgePosition.topRight,
                alertOffset: const Offset(-10, 4),
                iconColor: Colors.amber,
                onTap: () => debugPrint('Invest tapped'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
