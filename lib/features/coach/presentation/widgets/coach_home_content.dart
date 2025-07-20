import 'package:flutter/material.dart';
import 'package:capbox/features/coach/presentation/widgets/coach_header.dart';
import 'package:go_router/go_router.dart';

class CoachHomeContent extends StatelessWidget {
  final int pendingRequests;
  const CoachHomeContent({super.key, this.pendingRequests = 2});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CoachHeader(),
          const SizedBox(height: 24),
          const Text(
            'Hola Carlos :)',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),

          // primera fila horizontal
          Row(
            children: [
              Expanded(
                child: _buildStyledButton(
                  context,
                  'Lista de asistencia',
                  const Color(0xFF006F38),
                  route: '/coach-attendance',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStyledButton(
                  context,
                  'Rutinas',
                  const Color(0xFF006F38),
                  route: '/coach-routines',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Lista vertical
          _buildStyledButton(
            context,
            'Asignar metas individuales',
            const Color(0xFF006F38),
            route: '/coach/assign-goals',
          ),
          const SizedBox(height: 12),
          _buildStyledButton(
            context,
            'Gestionar alumnos',
            const Color(0xFF0076AD),
            route: '/coach-manage-students',
          ),
          const SizedBox(height: 12),

          Stack(
            children: [
              _buildStyledButton(
                context,
                'Captura de datos de alumno',
                const Color.fromRGBO(113, 113, 113, 0.5),
                route: '/coach-request-capture',
              ),
              if (pendingRequests > 0)
                Positioned(
                  right: 16,
                  top: 8,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Text(
                      '$pendingRequests',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          _buildStyledButton(
            context,
            'Realizar toma de pruebas',
            const Color.fromRGBO(113, 113, 113, 0.5),
            route: '/coach-select-student-for-test',
          ),
          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () => _mostrarDialogoClave(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(113, 113, 113, 0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                'Generar clave de registro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
          _buildStyledButton(
            context,
            'HERRAMIENTAS DE IA',
            const Color.fromRGBO(246, 255, 0, 0.34),
            route: '/coach-ai-tools',
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildStyledButton(BuildContext context, String text, Color color, {String? route}) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          if (route != null) {
            context.go(route);
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
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
              style: const TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              print(' Clave guardada: $clave');
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar', style: TextStyle(color: Colors.greenAccent)),
          )
        ],
      ),
    );
  }
}