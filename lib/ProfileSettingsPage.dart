import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(text: "John Doe");
  final TextEditingController _studentNumberController = TextEditingController(text: "STD2025001");
  final TextEditingController _emailController = TextEditingController(text: "john.doe@university.edu");
  final TextEditingController _passwordController = TextEditingController();
  bool _isEditing = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _studentNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Blue banner with "Personal Info"
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Personal Info",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // User icon
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[100],
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.blue,
              ),
            ),
          ),

          // Form fields
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildEditableField(
                      controller: _nameController,
                      label: "Full Name",
                      icon: Icons.person,
                      validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildEditableField(
                      controller: _studentNumberController,
                      label: "Student Number",
                      icon: Icons.badge,
                      validator: (value) => value!.isEmpty ? 'Enter student number' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildEditableField(
                      controller: _emailController,
                      label: "Email",
                      icon: Icons.email,
                      validator: (value) =>
                      !value!.contains('@') ? 'Enter a valid email' : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 30),

                    // Save and Update buttons
                    if (_isEditing) ...[
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveChanges,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "SAVE CHANGES",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isEditing ? _cancelEditing : _toggleEditing,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isEditing ? Colors.grey : Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          _isEditing ? "CANCEL" : "UPDATE PROFILE",
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleLogout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "LOG OUT",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: const OutlineInputBorder(),
        enabled: _isEditing,
        filled: !_isEditing,
        fillColor: Colors.grey[100],
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      enabled: _isEditing,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(Icons.lock, color: Colors.blue),
        border: const OutlineInputBorder(),
        filled: !_isEditing,
        fillColor: Colors.grey[100],
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.blue,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator: (value) {
        if (_isEditing && value!.isNotEmpty && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  void _toggleEditing() {
    setState(() => _isEditing = true);
  }

  void _cancelEditing() {
    setState(() => _isEditing = false);
    // Reset form fields if needed
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Save changes logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
      setState(() => _isEditing = false);
    }
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CANCEL"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              // Add your logout logic here (clear session, etc.)
            },
            child: const Text("LOG OUT", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}