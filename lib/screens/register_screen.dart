// Suggested code may be subject to a license. Learn more: ~LicenseLog:650817868.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:653717820.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2545549895.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3940995255.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3224134522.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1685797021.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3919514267.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:861584253.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1299932463.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3153031051.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1419467588.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3572831351.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2996051045.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3744612210.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2240838096.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1380300817.
import 'package:flutter/material.dart';
import 'package:you_app_test/repositories/auth_repository.dart';
import 'package:you_app_test/screens/profile_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        await AuthenticationRepository.instance.register(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          name: _nameController.text.trim(),
        );
        Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
      } catch (e) {
        // Handle registration error
        print(e);
        // Show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
