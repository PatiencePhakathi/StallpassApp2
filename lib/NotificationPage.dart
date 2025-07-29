import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Spring Fest: Music, Food & Fun This Friday!',
        'message': 'Dear Student,\nGet ready to unwind and celebrate the season—',
        'time': '14:10'
      },
      {
        'title': 'Wellness Workshop: Stress Management Tips',
        'message': 'Dear Student,\nFeeling overwhelmed? Join us for a Wellness Workshop.',
        'time': '12:25'
      },
      {
        'title': 'Free Health Check-up on Campus',
        'message': 'Dear Student,\nDon’t miss your chance to get a free health screening!',
        'time': '10:00'
      },
      {
        'title': 'Hackathon 2025 Registration Open',
        'message': 'Dear Student,\nUnleash your coding skills and creativity—',
        'time': '09:30'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            color: const Color(0xFFF2F2F2),
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(
                item['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  item['message']!,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
              trailing: Text(
                item['time']!,
                style: const TextStyle(color: Colors.grey),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          );
        },
      ),
    );
  }
}