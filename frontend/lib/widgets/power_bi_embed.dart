import 'package:flutter/material.dart';

class PowerBIEmbedWidget extends StatelessWidget {
  final String title;
  final List<double>? dataPoints; // Normalized 0.0 to 1.0

  const PowerBIEmbedWidget({
    super.key,
    this.title = "Analytics",
    this.dataPoints,
  });

  @override
  Widget build(BuildContext context) {
    // Use provided data or default mock data
    final data = dataPoints ?? [0.3, 0.5, 0.2, 0.6, 0.4];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.bar_chart,
                  color: Color(0xFFF2C811),
                ), // Power BI Yellow
              ],
            ),
          ),
          // Mobile Aspect Ratio
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: const Color(0xFFFAF9F8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.analytics_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Power BI Embedded",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        "(Azure Integrated)",
                        style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  // Dynamic Chart Visual
                  Positioned(
                    bottom: 0,
                    left: 16,
                    right: 16,
                    height: 60, // Increased height for better visibility
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: data.map((val) => _bar(val * 60)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar(double h) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: h,
          decoration: const BoxDecoration(
            color: Color(0xFF0078D4),
            borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
          ),
        ),
      ),
    );
  }
}
