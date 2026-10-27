import 'package:flutter/material.dart';

/// Макет 3 (сложный): Secrets of Atlantis.
class AtlantisScreen extends StatelessWidget {
  const AtlantisScreen({super.key});

  static const Color purple = Color(0xFF3D2A7A);
  static const Color darkPurple = Color(0xFF1E0F5C);
  static const Color orange = Color(0xFFF2711C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            const SizedBox(height: 48),
            const Text(
              'Secrets of Atlantis',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: orange,
                side: const BorderSide(color: orange),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: const Text('Follow'),
            ),
            const SizedBox(height: 18),
            _hostCard(),
            const SizedBox(height: 20),
            _inviteBanner(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Верхняя часть: градиентный фон, кнопка назад, круглая кнопка Play.
  Widget _header(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 330,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF00BFFF), Color(0xFF7C83F2)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
          child: const Center(
            child: Icon(Icons.water, size: 120, color: Colors.white54),
          ),
        ),
        Positioned(
          top: 48,
          left: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        Positioned(
          bottom: -36,
          child: Container(
            width: 76,
            height: 76,
            decoration: const BoxDecoration(color: orange, shape: BoxShape.circle),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 44),
          ),
        ),
      ],
    );
  }

  Widget _hostCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: purple,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFFE8A0BF),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    const Text('Codin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      color: Colors.black38,
                      child: const Text('Host', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'The Secrets of Atlantis podcast is designed for all fantasy enthusiasts, everything from debunking underwat... see more',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFF2B1B66),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                const Text('4.8', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const Icon(Icons.star_border, color: Colors.white, size: 16),
                const Text(' (10)', style: TextStyle(color: Colors.white54)),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.black38,
                  child: const Text('Fantasy', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const Spacer(),
                const Icon(Icons.notifications_none, color: Colors.white),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: darkPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                SizedBox(
                  width: 130,
                  height: 36,
                  child: Stack(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Positioned(
                          left: i * 22.0,
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.primaries[i * 3],
                            child: const Icon(Icons.person, size: 16, color: Colors.white),
                          ),
                        ),
                      const Positioned(
                        left: 92,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: orange,
                          child: Text('+10', style: TextStyle(fontSize: 11, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(Icons.sensors, color: orange, size: 18),
                const SizedBox(width: 4),
                const Text('Live', style: TextStyle(color: orange, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _inviteBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFF9D90F),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(color: orange, shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Text(
              'Invite your friends to join',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          const Icon(Icons.share, size: 22),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
