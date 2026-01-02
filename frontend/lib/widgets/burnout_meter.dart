import 'package:flutter/material.dart';

class BurnoutMeter extends StatelessWidget {
  final int score;

  const BurnoutMeter({super.key, required this.score});

  Color _getColor(int score) {
    if (score < 40) return const Color(0xFF107C10); // Green
    if (score < 70) return const Color(0xFFFFB900); // Yellow
    return const Color(0xFFD83B01); // Red
  }

  String _getStatus(int score) {
    if (score < 40) return "Low Risk";
    if (score < 70) return "Moderate Risk";
    return "High Risk";
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(score);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(
                value: score / 100,
                strokeWidth: 20,
                backgroundColor: Colors.grey.shade200,
                color: color,
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              children: [
                Text(
                  "$score",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  "/ 100",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Text(
            _getStatus(score),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
