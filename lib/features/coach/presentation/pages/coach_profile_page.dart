import 'package:flutter/material.dart';
import '../widgets/coach_navbar.dart';

class CoachProfilePage extends StatelessWidget {
  const CoachProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil del Entrenador')),
      body: const Center(child: Text('Aquí va el perfil del entrenador')),
      bottomNavigationBar: const CoachNavBar(currentIndex: 2),
    );
  }
}
