import 'package:flutter/material.dart';

class DepartmentAnnouncementsPage extends StatelessWidget {
  const DepartmentAnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> announcements = [
      {
        'title': 'GET READY FOR OPEN DAY - SCAN TO ENGAGE',
        'date': '10 January 2025',
        'time': '14:10',
        'location': 'Main Hall',
      },
      {
        'title': 'EVENT ATTENDANCE NOW DIGITAL!',
        'date': '15 March 2025',
        'time': '12:25',
        'location': 'Auditorium',
      },
      {
        'title': 'CODING BOOTCAMP ALERT',
        'date': '15 April 2025',
        'time': '10:00',
        'location': 'Lab 204',
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xFF3F51B5),
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: const Text(
                'Department Announcements',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Select Department',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  final item = announcements[index];
                  return Card(
                    color: Colors.grey[200],
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      title: Text(
                        '"${item['title']}"',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['date']!),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 16),
                              const SizedBox(width: 5),
                              Text(item['location']!),
                            ],
                          ),
                        ],
                      ),
                      trailing: const Text("View More"),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // You can navigate to the QR Scanner Page here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                ),
                child: const Text('QR Scan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}