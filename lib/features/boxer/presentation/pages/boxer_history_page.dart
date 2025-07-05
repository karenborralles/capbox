import 'package:flutter/material.dart';
import '../widgets/boxer_header.dart';
import '../widgets/boxer_navbar.dart';

class BoxerHistoryPage extends StatefulWidget {
  const BoxerHistoryPage({super.key});

  @override
  State<BoxerHistoryPage> createState() => _BoxerHistoryPageState();
}

class _BoxerHistoryPageState extends State<BoxerHistoryPage> {
  // Controla el estado de expansión de cada pelea
  final List<bool> _expanded = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BoxerNavBar(currentIndex: 0),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/fondo.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoxerHeader(),
                  const SizedBox(height: 16),
                  const Text(
                    'Historial de peleas',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Ordenar por: Fecha más reciente',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  _buildFightCard(
                    index: 0,
                    title: 'Evento: Demostración',
                    place: 'Lugar: Gimnasio Zikar',
                    result: 'Resultado: Victoria',
                    date: '25/02/2025',
                    details: '''
Datos del contrincante
Nombre: Arturo Amizaday Jimenez Ojendis
Edad: 15 años  Peso: 55kg
Gimnasio: Surimbox
Lugar del gimnasio: Suchiapa

Observaciones del entrenador:
Se cometieron 2 faltas y se realizaron 2 conteos, Juan no realizó ningún consejo dado en las esquinas
''',
                  ),
                  const SizedBox(height: 12),
                  _buildFightCard(
                    index: 1,
                    title: 'Evento: Populares juvenil',
                    place: 'Lugar: Guadalajara',
                    result: 'Resultado: Victoria',
                    date: '25/02/2025',
                    details: '''
Datos del contrincante
Nombre: Pedro Lopez
Edad: 17 años  Peso: 60kg
Gimnasio: BoxStar
Lugar del gimnasio: Zapopan

Observaciones del entrenador:
Juan aplicó buenas técnicas y logró una victoria clara.
''',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFightCard({
    required int index,
    required String title,
    required String place,
    required String result,
    required String date,
    required String details,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
                    Text(place, style: const TextStyle(color: Colors.white, fontSize: 14)),
                    Text(result, style: const TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
              ),
              Text(date, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
          if (_expanded[index]) ...[
            const SizedBox(height: 8),
            Text(details, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _expanded[index] = !_expanded[index];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _expanded[index] ? 'Ver menos' : 'Ver más',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
