import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Profile")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Icon(Icons.calendar_month, size: 100, color: Colors.indigo),
          ),
          const SizedBox(height: 20),
          const Text(
            "Attendance Record",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text("IT Faculty - 27 July 2025"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            child: const Text("Confirm Attendance"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}