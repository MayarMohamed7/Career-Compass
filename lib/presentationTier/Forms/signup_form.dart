import 'package:flutter/material.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/Pages/creatingacc_page.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_options.dart';
import 'package:graduationinterface/applicationTier/models/User.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _isLoading = false;

  // Function to toggle password and confirm password visibility
  void _toggleVisibility(bool isPassword) {
    setState(() {
      if (isPassword) {
        _passwordVisible = !_passwordVisible;
      } else {
        _confirmPasswordVisible = !_confirmPasswordVisible;
      }
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40.0),
        TextField(
          controller: _fullNameController,
          decoration: const InputDecoration(labelText: 'Full Name'),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email Address'),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () => _toggleVisibility(true),
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _confirmPasswordController,
          obscureText: !_confirmPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            suffixIcon: IconButton(
              onPressed: () => _toggleVisibility(false),
              icon: Icon(_confirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            if (_passwordController.text != _confirmPasswordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Passwords do not match"),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }
            setState(() {
              _isLoading = true;
            });
            String? signUpResult =
                await AuthMethods().signUpWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
              fullName: _fullNameController.text,
              confirmPassword: _confirmPasswordController.text,
            );
            setState(() {
              _isLoading = false;
            });
            if (signUpResult == null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatingAccPage()),
              );
            } else {
              // Handle signup failure
              print("Signup failed: $signUpResult");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Sign-up failed: $signUpResult"),
                  duration: const Duration(seconds: 5),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B52BB), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: _isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Signup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text(
              'Already have an account? Sign in',
              style: TextStyle(
                color: Color(0xFF3B52BB),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
