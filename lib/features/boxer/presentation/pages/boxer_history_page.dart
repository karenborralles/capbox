import 'package:flutter/material.dart';
import '../widgets/boxer_navbar.dart';

class BoxerHistoryPage extends StatelessWidget {
  const BoxerHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BoxerNavBar(currentIndex: 0), 
      body: const Center(
        child: Text('Historial',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
