import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/boxer_header.dart';
import '../widgets/boxer_navbar.dart';

class BoxerMetricsPage extends StatefulWidget {
  const BoxerMetricsPage({super.key});

  @override
  State<BoxerMetricsPage> createState() => _BoxerMetricsPageState();
}

class _BoxerMetricsPageState extends State<BoxerMetricsPage> {
  bool showChart = false;

  final Map<String, double> metrics = {
    'Resistencia': 8.9,
    'Velocidad': 7.5,
    'Técnica': 9.0,
    'Fuerza': 5.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BoxerNavBar(currentIndex: 2),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/fondo.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoxerHeader(),
                  const SizedBox(height: 18),
                  const Text(
                    'Gráficas de datos obtenidos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Alumno:',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  _studentCard(),
                  const SizedBox(height: 16),
                  const Text(
                    'Datos capturados:',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showChart = false;
                            });
                          },
                          child: _pillButton('Calificación', !showChart),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showChart = true;
                            });
                          },
                          child: _pillButton('Gráficos', showChart),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _bigAction('Ver vista detallada'),
                  const SizedBox(height: 20),
                  showChart ? _radarChart() : _metricsTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _studentCard() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFC31A7B),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text('J',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Juan Juanito Jimenez Mendoza',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    'Principiante',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                  Text(
                    '20 años │ 70 kg │ 1.70m',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _pillButton(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        gradient: active
            ? const LinearGradient(
                colors: [Color(0xFF0478AE), Color(0xFF023E5C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : LinearGradient(
                colors: [Colors.grey.withOpacity(0.5), Colors.grey.withOpacity(0.5)],
              ),
        borderRadius: BorderRadius.circular(14),
        border: active
            ? Border.all(color: Colors.blueAccent, width: 2)
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }

  Widget _bigAction(String text) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget _metricsTable() {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                'Atributo',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            Text(
              '(0 - 10)',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _metricRow('Resistencia', '8.9', Colors.green),
        const SizedBox(height: 10),
        _metricRow('Velocidad', '7.5', Colors.yellow),
        const SizedBox(height: 10),
        _metricRow('Técnica', '9', Colors.green),
        const SizedBox(height: 10),
        _metricRow('Fuerza', '5', Colors.red),
      ],
    );
  }

  Widget _metricRow(String attribute, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              attribute,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _radarChart() {
    return SizedBox(
      height: 300,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 12),
          getTitle: (index, angle) {
            return RadarChartTitle(
              text: metrics.keys.elementAt(index),
            );
          },
          dataSets: [
            RadarDataSet(
              dataEntries: metrics.values
                  .map((value) => RadarEntry(value: value))
                  .toList(),
              borderColor: Colors.blueAccent,
              fillColor: Colors.blueAccent.withOpacity(0.3),
            ),
          ],
          tickCount: 5,
          radarBorderData: const BorderSide(color: Colors.white70),
          gridBorderData: const BorderSide(color: Colors.white24),
        ),
      ),
    );
  }
}
