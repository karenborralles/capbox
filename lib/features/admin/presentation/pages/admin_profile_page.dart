import 'package:capbox/features/admin/presentation/widgets/admin_navbar.dart';
import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil del administrador')),
      body: const Center(child: Text('Aquí va el perfil del administrador')),
      bottomNavigationBar: const AdminNavBar(currentIndex: 2),
    );
  }
}