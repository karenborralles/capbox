import 'package:flutter/material.dart';
import '../widgets/coach_header.dart';
import '../widgets/coach_navbar.dart';

class CoachRoutinesPage extends StatelessWidget {
  const CoachRoutinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const CoachNavBar(currentIndex: 1),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondo.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoachHeader(),
                  SizedBox(height: 24),
                  Text(
                    'Asignar rutinas',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  _RoutineButton(text: 'Asignar a avanzados'),
                  SizedBox(height: 12),
                  _RoutineButton(text: 'Asignar a intermedios'),
                  SizedBox(height: 12),
                  _RoutineButton(text: 'Asignar a principiantes'),
                  SizedBox(height: 12),
                  _RoutineButton(text: 'Asignar rutina general'),
                  SizedBox(height: 36), // ← Ajusta esta altura si lo quieres más arriba o abajo
                  _RoutineButton(text: 'Gestionar rutinas', color: Color(0xFF006F38)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoutineButton extends StatelessWidget {
  final String text;
  final Color color;

  const _RoutineButton({
    required this.text,
    this.color = const Color.fromRGBO(113, 113, 113, 0.5),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          // Lógica de navegación aquí si se desea
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}