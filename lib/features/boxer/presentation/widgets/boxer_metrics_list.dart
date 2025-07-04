import 'package:flutter/material.dart';

class BoxerMetricsList extends StatelessWidget {
  const BoxerMetricsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
