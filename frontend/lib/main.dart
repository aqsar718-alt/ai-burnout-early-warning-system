import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Burnout System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) {
        // Force Mobile Layout on Desktop
        return Container(
          color: Colors.grey[900], // Dark background outside the phone
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 450,
            ), // Standard Mobile Width
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 8),
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: child,
          ),
        );
      },
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
