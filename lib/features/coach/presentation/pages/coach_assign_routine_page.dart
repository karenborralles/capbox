import 'package:flutter/material.dart';
import 'package:capbox/features/coach/presentation/widgets/coach_header.dart';
import 'package:capbox/features/coach/presentation/widgets/coach_navbar.dart';

class CoachAssignRoutinePage extends StatefulWidget {
  final String nivel;

  const CoachAssignRoutinePage({super.key, required this.nivel});

  @override
  State<CoachAssignRoutinePage> createState() => _CoachAssignRoutinePageState();
}

class _CoachAssignRoutinePageState extends State<CoachAssignRoutinePage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> rutinas = [
    {
      'titulo': 'Rutina para mejorar velocidad',
      'duracion': '25:00',
      'nivel': 'Principiante',
      'ejercicios': 4,
      'detalle': [
        {'etapa': 'Calentamiento', 'ejercicio': 'Saco pesado', 'cantidad': '10 minutos'},
        {'etapa': 'Calentamiento', 'ejercicio': 'Manoplas', 'cantidad': '5 minutos'},
        {'etapa': 'Calentamiento', 'ejercicio': 'Reflejos', 'cantidad': '10 minutos'},
      ],
    },
    {
      'titulo': 'Rutina golpes y saltos',
      'duracion': '25:00',
      'nivel': 'Principiante',
      'ejercicios': 4,
    },
    {
      'titulo': 'Rutina de golpes rápidos',
      'duracion': '1:00:00',
      'nivel': 'Principiante',
      'ejercicios': 10,
    },
    {
      'titulo': 'Esquiveo',
      'duracion': '1:40:00',
      'nivel': 'Principiante',
      'ejercicios': 15,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const CoachNavBar(currentIndex: 1),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/fondo.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: CoachHeader(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Asignar rutinas - ${widget.nivel.toLowerCase()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: rutinas.length,
                    itemBuilder: (context, index) {
                      final rutina = rutinas[index];
                      return _RoutineCard(
                        titulo: rutina['titulo'],
                        duracion: rutina['duracion'],
                        nivel: rutina['nivel'],
                        ejercicios: rutina['ejercicios'],
                        detalles: rutina['detalle'],
                        isExpanded: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            selectedIndex = selectedIndex == index ? -1 : index;
                          });
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _RoutineCard extends StatelessWidget {
  final String titulo;
  final String duracion;
  final int ejercicios;
  final String nivel;
  final List<Map<String, String>>? detalles;
  final bool isExpanded;
  final VoidCallback onTap;

  const _RoutineCard({
    required this.titulo,
    required this.duracion,
    required this.ejercicios,
    required this.nivel,
    this.detalles,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.grey, size: 18),
                const SizedBox(width: 6),
                Text(duracion, style: const TextStyle(color: Colors.white70)),
                const Spacer(),
                Text('$ejercicios ejercicios', style: const TextStyle(color: Colors.red)),
              ],
            ),
            const SizedBox(height: 4),
            Text(nivel.toLowerCase(), style: const TextStyle(color: Colors.red)),
            if (isExpanded && detalles != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Ejercicio', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        Text('Cantidad', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...detalles!.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e['ejercicio']!, style: const TextStyle(color: Colors.white)),
                            Text(e['cantidad']!, style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Asignar'),
              )
            ]
          ],
        ),
      ),
    );
  }
}