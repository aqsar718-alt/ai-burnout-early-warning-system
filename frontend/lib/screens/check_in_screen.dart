import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  final Function(double sleep, double study, int mood)? onCheckIn;
  const CheckInScreen({super.key, this.onCheckIn});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  double _sleep = 7.0;
  double _study = 5.0;
  int _mood = 3; // 0-4 index

  final List<String> _emojis = ["😫", "😕", "😐", "🙂", "😁"];
  final List<String> _moodLabels = [
    "Exhausted",
    "Stressed",
    "Okay",
    "Good",
    "Energized",
  ];

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Check-in saved successfully! Check your Dashboard."),
        backgroundColor: Colors.green,
      ),
    );
    // Mimic API call
    if (widget.onCheckIn != null) {
      widget.onCheckIn!(_sleep, _study, _mood);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Check-in")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "How are you feeling today?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Mood Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                final isSelected = _mood == index;
                return GestureDetector(
                  onTap: () => setState(() => _mood = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0078D4)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 10,
                              ),
                            ]
                          : [],
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _emojis[index],
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _moodLabels[index],
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected ? Colors.white : Colors.grey,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 32),

            // Sliders
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sleep (Last Night)",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${_sleep.toStringAsFixed(1)} hrs",
                          style: const TextStyle(
                            color: Color(0xFF0078D4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _sleep,
                      min: 0,
                      max: 12,
                      divisions: 24,
                      onChanged: (v) => setState(() => _sleep = v),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Study / Work (Today)",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${_study.toStringAsFixed(1)} hrs",
                          style: const TextStyle(
                            color: Color(0xFF0078D4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _study,
                      min: 0,
                      max: 16,
                      divisions: 32,
                      onChanged: (v) => setState(() => _study = v),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                hintText:
                    "Anything else on your mind? (Optional journal entry for AI analysis)",
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _submit,
              child: const Text("Submit Check-In"),
            ),
          ],
        ),
      ),
    );
  }
}
