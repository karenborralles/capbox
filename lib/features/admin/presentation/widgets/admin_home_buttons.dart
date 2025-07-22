import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'admin_button.dart';

class AdminHomeButtons extends StatelessWidget {
  const AdminHomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdminButton(
          label: 'Lista de asistencia',
          color: const Color(0xFF008E76),
          onPressed: () {
            context.go('/admin-attendance');
          },
        ),
        const SizedBox(height: 16),
        const Divider(color: Color.fromARGB(255, 110, 109, 109)),
        const SizedBox(height: 16),
        AdminButton(
          label: 'Gestionar alumnos',
          color: const Color(0xFF0076AD),
          onPressed: () {
            context.go('/admin-manage-students');
          },
        ),
        const SizedBox(height: 16),
        AdminButton(
          label: 'Generar clave de registro',
          color: Colors.grey.shade700,
          onPressed: () {
            _mostrarDialogoClave(context); 
          },
        ),
      ],
    );
  }
  
  void _mostrarDialogoClave(BuildContext context) {
    final random = DateTime.now().millisecondsSinceEpoch.remainder(100000000);
    final clave = 'CBX-${random.toString().padLeft(8, '0')}';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Clave de registro', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Comparte esta clave con el alumno:',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 12),
            SelectableText(
              clave,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // para guardar la clave en el back
              print('Clave generada y lista para guardar: $clave');
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar', style: TextStyle(color: Colors.greenAccent)),
          ),
        ],
      ),
    );
  }
}