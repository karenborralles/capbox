import 'package:flutter/material.dart';

class BoxerEventsList extends StatelessWidget {
  const BoxerEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEventCard(
          context,
          'assets/images/event1.png',
          'Guadalajara',
          '7 - 10 de octubre 2025',
          '\$1500',
          'Este evento tiene como lapso máximo a pagar el 1 de octubre del año en curso, el alojamiento se encuentra a 10 minutos del lugar del evento.',
        ),
        const SizedBox(height: 16),
        _buildInvitationCard(
          context,
          'assets/images/event2.png',
          'Tuxtla Gutierrez',
          '23 - 25 de febrero 2025',
          'Gratuito',
          'El evento se llevará a cabo los 3 días de 6:00am a 10:00pm, al lugar solo asistirán entrenadores y boxeadores, quedará restringida la entrada a padres de familia.',
        ),
      ],
    );
  }

  Widget _buildEventCard(BuildContext context, String img, String lugar, String fecha, String costo, String desc) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(img, height: 80),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lugar: $lugar', style: const TextStyle(color: Colors.red)),
                    Text('Fecha: $fecha', style: const TextStyle(color: Colors.red)),
                    Text('Costo total de asistencia: $costo', style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 4),
                    Text(desc, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: const Text('Cancelar asistencia'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade700,
                ),
                onPressed: () {},
                child: const Text('Pago pendiente'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInvitationCard(BuildContext context, String img, String lugar, String fecha, String costo, String desc) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(img, height: 80),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lugar: $lugar', style: const TextStyle(color: Colors.red)),
                    Text('Fecha: $fecha', style: const TextStyle(color: Colors.red)),
                    Text('Costo total de asistencia: $costo', style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 4),
                    Text(desc, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
            ),
            onPressed: () {},
            child: const Text('Ver invitación'),
          )
        ],
      ),
    );
  }
}
