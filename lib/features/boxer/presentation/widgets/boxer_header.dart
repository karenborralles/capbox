import 'package:flutter/material.dart';

class BoxerHeader extends StatelessWidget {
  const BoxerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.red.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('J', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 8),
              const Text(
                'Juan Jimenez',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/logo.png',
          height: 36,
        ),
      ],
    );
  }
}