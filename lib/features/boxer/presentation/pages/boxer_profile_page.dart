// lib/features/boxer/presentation/pages/boxer_profile_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/boxer_header.dart';         
import '../widgets/boxer_navbar.dart';

class BoxerProfilePage extends StatelessWidget {
  const BoxerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BoxerNavBar(currentIndex: 2),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/fondo.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(.6)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoxerHeader(),
                  const SizedBox(height: 18),
                  const Text(
                    'Perfil de alumno',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _studentCard(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _pillButton('5 días de racha', [Color(0xFF701300), Color(0xFF121212)])),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.go('/ficha-tecnica');
                          },
                          child: _pillButton('Ver ficha técnica', [Color(0xFF0478AE), Color(0xFF023E5C)]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  _bigAction('Ver métricas de rendimiento'),
                  const SizedBox(height: 16),
                  _bigAction('Historial de peleas'),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _studentCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _avatarBig(),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Juan  Jimenez',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                  Text('Algortmico Jimenez',
                      style:
                          TextStyle(color: Colors.white70, fontSize: 13)),
                  SizedBox(height: 4),
                  Text('Principiante',
                      style: TextStyle(color: Colors.red, fontSize: 13)),
                  SizedBox(height: 8),
                  Text('20 años │ 70 kg │ 1.70 m',
                      style:
                          TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _avatarBig() => Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          color: const Color(0xFFC31A7B),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: const Text('J',
            style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold)),
      );

  Widget _pillButton(String text, List<Color> gradientColors) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _bigAction(String text) => Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),  // 🟢 Mismo color que tus exercise cards
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}