import 'package:flutter/material.dart';
import 'DepartmentAnnoucementsPage.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';
import 'SuccessPage.dart';
import 'AttendancePage.dart';
import 'ProfileSettingsPage.dart';

void main() {
  runApp(const EventApp());
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Events',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const DepartmentAnnouncementsPage(),
        '/success': (context) => const SuccessPage(),
        '/attendance': (context) => const AttendancePage(),
        '/profile': (context) => const ProfileSettingsPage(),
      },
    );
  }
}