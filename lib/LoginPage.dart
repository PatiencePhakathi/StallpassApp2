import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Purple wavy header
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFF4A3AFF), // Purple
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Username field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Dropdown for admin login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: "More Options",
                ),
                value: _selectedOption,
                items: [
                  'Admin Login',
                ].map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                  if (value == 'Admin Login') {
                    Navigator.pushNamed(context, '/adminLogin');
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A3AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Implement login logic
                  },
                  child: const Text("Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}//end