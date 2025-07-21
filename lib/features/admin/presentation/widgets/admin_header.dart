import 'package:flutter/material.dart';

class AdminHeader extends StatelessWidget {
  const AdminHeader({super.key, required String name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              'assets/icons/nombre_card.png',
              height: 90,
              width: 260,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46, bottom: 11), 
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
          ],
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Image.asset(
            'assets/images/logo.png',
            height: 56,
          ),
        ),
      ],
    );
  }
}