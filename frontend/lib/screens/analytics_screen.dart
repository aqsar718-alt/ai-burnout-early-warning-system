import 'package:flutter/material.dart';
import '../widgets/power_bi_embed.dart';

class AnalyticsScreen extends StatelessWidget {
  final List<double>? studyData;
  final List<double>? sleepData;
  final List<double>? burnoutData;

  const AnalyticsScreen({
    super.key,
    this.studyData,
    this.sleepData,
    this.burnoutData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analytics")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Filter Dropdown Mockup
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today, size: 16),
                  label: const Text("This Week"),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.school, size: 16),
                  label: const Text("All Subjects"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          PowerBIEmbedWidget(
            title: "Burnout Risk Trends",
            dataPoints: burnoutData,
          ),
          PowerBIEmbedWidget(
            title: "Study Hours vs Sleep",
            dataPoints: studyData,
          ), // Just showing study data for now
          PowerBIEmbedWidget(title: "Assignment Load", dataPoints: sleepData),
        ],
      ),
    );
  }
}
