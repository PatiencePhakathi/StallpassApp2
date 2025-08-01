import 'package:flutter/material.dart';
import 'AttendancePage.dart';
import 'DepartmentAnnoucementsPage.dart';
import 'NotificationPage.dart';
import 'SuccessPage.dart';
import 'ProfileSettingsPage.dart';
import 'ScanQrCode.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StallPass Event App'),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3F51B5),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // Existing menu items
            ListTile(
              title: const Text('Department Announcements'),
              onTap: () {
                _navigateTo(context, const DepartmentAnnouncementsPage());
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                _navigateTo(context, const NotificationPage());
              },
            ),
            ListTile(
              title: const Text('Success Page'),
              onTap: () {
                _navigateTo(context, const SuccessPage());
              },
            ),
            ListTile(
              title: const Text('Attendance Profile'),
              onTap: () {
                _navigateTo(context, const AttendancePage());
              },
            ),
            ListTile(
              title: const Text('Profile Settings'),
              onTap: () {
                _navigateTo(context, const ProfileSettingsPage());
              },
            ),
            // New QR Scanner menu item
            ListTile(
              leading: const Icon(Icons.qr_code_scanner, color: Color(0xFF3F51B5)),
              title: const Text('Scan QR Code'),
              onTap: () {
                _navigateTo(context, const QRScannerPage());
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to StallPass!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Manage your event participation easily.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for navigation to prevent code duplication
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Close the drawer first
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}