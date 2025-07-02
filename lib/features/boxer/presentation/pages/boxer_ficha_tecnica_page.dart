import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/boxer_header.dart';
import '../widgets/boxer_navbar.dart';

class BoxerFichaTecnicaPage extends StatelessWidget {
  const BoxerFichaTecnicaPage({super.key});

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
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoxerHeader(),
                  const SizedBox(height: 12),
                  const Text(
                    'Ficha técnica',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _fichaCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fichaCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/boxer_sample.png',
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    context.go('/perfil');
                  },
                  child: const Icon(Icons.close, color: Colors.red, size: 20),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Juan Juanito Jimenez Mendoza',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _infoRow('Edad:', '16 años'),
          _infoRow('Peso:', '60kg'),
          _infoRow('Estatura:', '1.65 m'),
          _infoRow('Peleas:', '25'),
          _infoRow('Victorias:', '20'),
          const Divider(color: Colors.white24),
          _infoRow('Nivel:', 'Principiante'),
          _infoRow('Guardia:', 'Derecha'),
          const Divider(color: Colors.white24),
          _infoRow('Gimnasio:', 'Zikar Palenque de campeones'),
          _infoRow('Entrenador:', 'Fernando Dinamita'),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
