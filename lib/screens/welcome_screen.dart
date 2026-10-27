import 'package:flutter/material.dart';

/// Макет 1 (простой): экран Welcome / medinow.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color teal = Color(0xFF05A0A0);

  Widget _button(String text, Color bg, Color fg) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 56),
              const Text(
                'medinow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Meditate With Us!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 40),
              _button('Sign in with Apple', Colors.white, Colors.black),
              const SizedBox(height: 14),
              _button('Continue with Email or Phone', const Color(0xFFBFF3F0), Colors.black),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Continue With Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Spacer(),
              const Icon(Icons.self_improvement, size: 230, color: Colors.white70),
              const SizedBox(height: 24),
              Container(
                width: 130,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
