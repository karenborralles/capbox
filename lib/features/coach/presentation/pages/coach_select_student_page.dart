import 'package:flutter/material.dart';
import 'package:capbox/features/coach/presentation/widgets/coach_header.dart';
import 'package:capbox/features/coach/presentation/widgets/coach_navbar.dart';

class CoachSelectStudentPage extends StatelessWidget {
  final List<String> students = [
    'Ana Karen Álvarez Borralles',
    'Arturo Amizaday Jimenez Ojendis',
    'Jonathan Dzul Mendoza',
    'Juan Jimenez',
    'Nuricumbo Jimenez Pedregal',
  ];

  CoachSelectStudentPage({super.key});

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
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CoachHeader(),
                  const SizedBox(height: 20),
                  const Text(
                    'Asignar meta personal a:',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Buscar alumno',
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      // Filtro para buscar alumnos
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ordenar por: Orden alfabetico',
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: Colors.pink,
                                child: Text('J', style: TextStyle(color: Colors.white)),
                              ),
                              title: Text(
                                student,
                                style: const TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                // para seleccionar estudiante
                                Navigator.pop(context, student); // para que regrese el nombre
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}