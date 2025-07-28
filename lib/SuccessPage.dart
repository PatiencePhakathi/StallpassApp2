import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  size: 100, color: Colors.indigo),
              const SizedBox(height: 20),
              const Text(
                "SUCCESS",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Thank you for your participation.\nAttendance recorded for IT Faculty.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/attendance');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: const Text("Continue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}