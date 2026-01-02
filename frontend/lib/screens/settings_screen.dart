import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF0078D4)),
          accountName: Text("Alex Student"),
          accountEmail: Text("student@university.edu"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "A",
              style: TextStyle(fontSize: 24, color: Color(0xFF0078D4)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text("Daily Reminders"),
          trailing: Switch(value: true, onChanged: (v) {}),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text("Sync Outlook Calendar"),
          subtitle: const Text("Microsoft Graph API Connected"),
          trailing: const Icon(Icons.check_circle, color: Colors.green),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.privacy_tip),
          title: const Text("Privacy & Data"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text("Support"),
          onTap: () {},
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          child: const Text("Sign Out"),
        ),
      ],
    );
  }
}
