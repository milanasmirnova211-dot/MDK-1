import 'package:flutter/material.dart';

/// Макет 2 (простой): Meditate - Mind Deep Relax.
class MeditateScreen extends StatelessWidget {
  const MeditateScreen({super.key});

  static const Color teal = Color(0xFF05A0A0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Картинка-заглушка
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2C94C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.landscape, size: 90, color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Text('Peter Mach', style: TextStyle(fontSize: 11, color: Colors.grey)),
              const SizedBox(height: 4),
              const Text(
                'Mind Deep Relax',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happinies session across the World.',
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_outlined),
                  label: const Text('Play Next Session'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const _SessionTile(
                title: 'Sweet Memories',
                subtitle: 'December 29 Pre-Launch',
                color: Color(0xFF2F80ED),
              ),
              const Divider(),
              const _SessionTile(
                title: 'A Day Dream',
                subtitle: 'December 29 Pre-Launch',
                color: teal,
              ),
              const Divider(),
              const _SessionTile(
                title: 'Mind Explore',
                subtitle: 'December 29 Pre-Launch',
                color: Color(0xFFF2994A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _SessionTile({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.play_arrow_outlined, color: Colors.white),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.more_horiz, color: Colors.grey),
    );
  }
}
