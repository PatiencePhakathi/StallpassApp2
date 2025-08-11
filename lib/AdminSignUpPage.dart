import 'package:flutter/material.dart';

class AdminSignUpPage extends StatefulWidget {
  const AdminSignUpPage({super.key});

  @override
  State<AdminSignUpPage> createState() => _AdminSignUpPageState();
}

class _AdminSignUpPageState extends State<AdminSignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                    // Purple header
                    Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4A3AFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                            "Admin Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
