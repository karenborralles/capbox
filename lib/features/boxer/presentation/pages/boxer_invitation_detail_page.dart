import 'package:capbox/features/boxer/presentation/widgets/boxer_header.dart';
import 'package:capbox/features/boxer/presentation/widgets/boxer_invitation_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoxerInvitationDetailPage extends StatelessWidget {
  const BoxerInvitationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/fondo.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoxerHeader(), // ✅ Reutilizamos el header correcto
                  const SizedBox(height: 16),
                  const Text(
                    'Eventos para ti',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const BoxerInvitationCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
