import 'package:flutter/material.dart';
import '../widgets/coach_navbar.dart';

class CoachHistoryPage extends StatelessWidget {
  const CoachHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial del Entrenador')),
      body: const Center(child: Text('Aquí va el historial del entrenador')),
      bottomNavigationBar: const CoachNavBar(currentIndex: 0),
    );
  }
}
