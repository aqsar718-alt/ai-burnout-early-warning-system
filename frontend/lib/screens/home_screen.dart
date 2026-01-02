import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'analytics_screen.dart';
import 'check_in_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, this.username = "Student"});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // State for Check-in Data
  List<double> _studyHistory = [0.5, 0.6, 0.4, 0.7, 0.5];
  List<double> _sleepHistory = [0.8, 0.7, 0.6, 0.5, 0.6];
  List<double> _burnoutHistory = [0.2, 0.3, 0.25, 0.4, 0.3];
  int _latestBurnoutScore = 68;
  String _latestSuggestion =
      "You're doing okay, but try to sleep 30 mins earlier tonight.";

  void _handleCheckIn(double sleep, double study, int mood) {
    setState(() {
      // Normalize data for chart (0.0 to 1.0)
      // Max study = 16hrs, Max sleep = 12hrs
      _studyHistory.add((study / 16).clamp(0.0, 1.0));
      _sleepHistory.add((sleep / 12).clamp(0.0, 1.0));

      // Simple Burnout Logic: Less sleep + more study = higher burnout
      // Adding a mock value based on input
      double risk = ((12 - sleep) + study) / 20;
      _burnoutHistory.add(risk.clamp(0.0, 1.0));

      _latestBurnoutScore = (risk * 100).toInt().clamp(0, 100);

      // Dynamic AI Logic
      if (sleep < 5) {
        _latestSuggestion =
            "⚠️ Critical: You slept only ${sleep.toInt()} hrs! Prioritize rest immediately to avoid burnout.";
      } else if (study > 10) {
        _latestSuggestion =
            "📉 High Study Load: 10+ hours detected. Consider taking a 15-minute walk to reset.";
      } else if (mood < 2) {
        _latestSuggestion =
            "💙 You seem stressed. Why not schedule a coffee break with a friend?";
      } else {
        _latestSuggestion =
            "✅ Great balance! Keep maintaining this healthy routine.";
      }

      // Keep only last 5 for chart
      if (_studyHistory.length > 5) _studyHistory.removeAt(0);
      if (_sleepHistory.length > 5) _sleepHistory.removeAt(0);
      if (_burnoutHistory.length > 5) _burnoutHistory.removeAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Rebuild pages with new data
    final pages = [
      DashboardScreen(
        username: widget.username,
        burnoutScore: _latestBurnoutScore,
        aiSuggestion: _latestSuggestion,
      ),
      AnalyticsScreen(
        studyData: _studyHistory,
        sleepData: _sleepHistory,
        burnoutData: _burnoutHistory,
      ),
      CheckInScreen(onCheckIn: _handleCheckIn),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        // Mobile-optimized labels
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            selectedIcon: Icon(Icons.check_circle),
            label: 'Check-in',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
