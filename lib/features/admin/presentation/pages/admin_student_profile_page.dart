import 'package:flutter/material.dart';
import 'package:capbox/features/coach/domain/entities/student_model.dart';
import '../widgets/admin_header.dart';
import '../widgets/admin_navbar.dart';

class AdminStudentProfilePage extends StatelessWidget {
  final Student student;

  const AdminStudentProfilePage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AdminNavBar(currentIndex: 2),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/fondo.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdminHeader(name: 'Gym Zikar'),
                  const SizedBox(height: 16),
                  Text(
                    'Perfil de alumno',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.pink,
                          child: Text(
                            student.name[0],
                            style: const TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(student.name, style: const TextStyle(color: Colors.white)),
                              const SizedBox(height: 4),
                              const Text('Algorítmico Jimenez', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                              const Text('Principiante', style: TextStyle(color: Colors.red, fontSize: 12)),
                              const Text('20 años | 70kg | 1.70m', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}