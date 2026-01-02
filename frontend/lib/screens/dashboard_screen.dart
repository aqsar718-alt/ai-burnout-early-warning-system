import 'package:flutter/material.dart';
import '../widgets/burnout_meter.dart';
import '../widgets/power_bi_embed.dart';

class DashboardScreen extends StatelessWidget {
  final String username;
  final int burnoutScore;
  final String aiSuggestion;

  const DashboardScreen({
    super.key,
    required this.username,
    this.burnoutScore = 68,
    this.aiSuggestion = "Analyzing your daily patterns...",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burnout Monitor"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                "Hi, $username",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // AI Recommendation Card (highlighted)
          Card(
            color: const Color(0xFFE3F2FD), // Light blue tint
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: Color(0xFF0078D4),
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "AI Suggestion",
                          style: TextStyle(
                            color: Color(0xFF0078D4),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          aiSuggestion,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Burnout Meter
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: BurnoutMeter(score: burnoutScore),
            ),
          ),
          const SizedBox(height: 16),

          // Weekly Trend Preview
          const PowerBIEmbedWidget(title: "This Week's Load"),
        ],
      ),
    );
  }
}
