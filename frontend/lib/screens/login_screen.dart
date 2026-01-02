import 'package:flutter/material.dart';
import '../widgets/microsoft_logo.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    // Simulate Network Delay for "Microsoft Auth"
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      String username = "Student";
      if (_emailController.text.contains("@")) {
        String rawName = _emailController.text.split("@")[0];
        username = rawName[0].toUpperCase() + rawName.substring(1);
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(username: username)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo Area
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MicrosoftLogo(size: 40),
                  SizedBox(width: 12),
                  Text(
                    "Microsoft",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Title
              const Text(
                "Sign in",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "to access AI Burnout Warning System",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Form
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email, phone, or Skype",
                  hintText: "student@university.edu",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("No account? Create one!"),
                ),
              ),
              const SizedBox(height: 24),

              // Button
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Next"),
              ),

              const SizedBox(height: 48),

              // Footer
              const Center(
                child: Text(
                  "Built for Microsoft Imagine Cup 2026",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
