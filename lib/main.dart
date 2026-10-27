import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/meditate_screen.dart';
import 'screens/atlantis_screen.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Figma layouts',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF05A0A0),
      ),
      home: const MenuScreen(),
    );
  }
}

/// Стартовый экран со списком всех макетов.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItem>[
      _MenuItem('1. Welcome (простой)', const WelcomeScreen()),
      _MenuItem('2. Meditate - Mind Deep Relax (простой)', const MeditateScreen()),
      _MenuItem('3. Secrets of Atlantis (сложный)', const AtlantisScreen()),
      _MenuItem('4. Weekly Tasks (сложный)', const TasksScreen()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Макеты Figma')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text(items[i].title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => items[i].screen),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final Widget screen;
  _MenuItem(this.title, this.screen);
}
