import 'package:capbox/features/admin/presentation/widgets/admin_navbar.dart';
import 'package:flutter/material.dart';

class AdminHistoryPage extends StatelessWidget {
  const AdminHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial del administrador')),
      body: const Center(child: Text('Aquí va el historial del administrador')),
      bottomNavigationBar: const AdminNavBar(currentIndex: 0),
    );
  }
}
