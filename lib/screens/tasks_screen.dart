import 'package:flutter/material.dart';

/// Макет 4 (сложный): My Weekly Tasks / Today's Tasks.
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  static const Color blue = Color(0xFF4F6BED);
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _topBar(),
            const SizedBox(height: 24),
            _sectionHeader('My Weekly Tasks'),
            const SizedBox(height: 12),
            SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _WeeklyCard(
                    tag1: 'UI/UX Design',
                    tag2: 'High',
                    tag1Color: Color(0xFFEDE9FE),
                    tag2Color: Color(0xFFFDE8E8),
                    title: 'Create a\nLanding Page',
                    extra: '3+',
                    date: 'Mon, 12 July 2022',
                  ),
                  SizedBox(width: 14),
                  _WeeklyCard(
                    tag1: 'Development',
                    tag2: 'Low',
                    tag1Color: Color(0xFFFFF3E0),
                    tag2Color: Color(0xFFE6F6EC),
                    title: 'Develop a\nWebsite',
                    extra: '2+',
                    date: 'Mon, 30 July 2022',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _sectionHeader("Today's Tasks"),
            const SizedBox(height: 12),
            _todayCard(
              title: 'Design 2 App Screens',
              subtitle: 'Crypto Wallet App',
              date: 'Mon, 10 July 2022',
              done: true,
            ),
            const SizedBox(height: 12),
            _todayCard(
              title: 'Design Homepage',
              subtitle: 'Water Company Website',
              date: 'Tue, 11 July 2022',
              done: false,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blue,
        unselectedItemColor: Colors.black87,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: 'Members'),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFFD7B8A0),
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Evening!', style: TextStyle(fontSize: 11, color: Colors.grey)),
            Text('Dan Smith', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          ],
        ),
        const Spacer(),
        _roundIcon(Icons.search),
        const SizedBox(width: 10),
        _roundIcon(Icons.notifications_none),
      ],
    );
  }

  Widget _roundIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12),
      ),
      child: Icon(icon, size: 20),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              const Text('18 Tasks Pending', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ),
        const Icon(Icons.tune),
        const SizedBox(width: 12),
        const Icon(Icons.add),
      ],
    );
  }

  Widget _todayCard({
    required String title,
    required String subtitle,
    required String date,
    required bool done,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: done ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              if (done)
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: blue,
                  child: Icon(Icons.check, size: 18, color: Colors.white),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 18),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 16),
              const SizedBox(width: 8),
              Text(date, style: const TextStyle(fontSize: 12)),
              const Spacer(),
              const _AvatarStack(extra: '1+'),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeeklyCard extends StatelessWidget {
  final String tag1;
  final String tag2;
  final Color tag1Color;
  final Color tag2Color;
  final String title;
  final String extra;
  final String date;

  const _WeeklyCard({
    required this.tag1,
    required this.tag2,
    required this.tag1Color,
    required this.tag2Color,
    required this.title,
    required this.extra,
    required this.date,
  });

  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: const TextStyle(fontSize: 10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [_tag(tag1, tag1Color), const SizedBox(width: 6), _tag(tag2, tag2Color)]),
          const SizedBox(height: 14),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          _AvatarStack(extra: extra),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 14),
              const SizedBox(width: 6),
              Text(date, style: const TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

class _AvatarStack extends StatelessWidget {
  final String extra;
  const _AvatarStack({required this.extra});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 30,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            child: CircleAvatar(radius: 15, backgroundColor: Color(0xFF6D8B74), child: Icon(Icons.person, size: 14, color: Colors.white)),
          ),
          const Positioned(
            left: 20,
            child: CircleAvatar(radius: 15, backgroundColor: Color(0xFFB08968), child: Icon(Icons.person, size: 14, color: Colors.white)),
          ),
          Positioned(
            left: 42,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: const Color(0xFFF2A33A),
              child: Text(extra, style: const TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
