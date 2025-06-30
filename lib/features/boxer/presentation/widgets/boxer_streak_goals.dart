import 'package:flutter/material.dart';

class BoxerStreakGoals extends StatelessWidget {
  const BoxerStreakGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/icons/fire.png', height: 120),
            Column(
              children: const [
                ImageIcon(
                  AssetImage('assets/icons/fire_card.png'),
                  size: 24,
                  color: Colors.red,
                ),
                SizedBox(height: 4),
                Text(
                  '5 Días de racha',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('🏁 Metas', style: TextStyle(color: Colors.white, fontFamily: 'Inter')),
                SizedBox(height: 4),
                Text('- 5km en 25 min', style: TextStyle(color: Colors.white70)),
                Text('- 5kg abajo', style: TextStyle(color: Colors.white70)),
                Text('- Mejorar guardia derecha', style: TextStyle(color: Colors.white70)),
                Text('- Tratamiento lesion mano derecha', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}