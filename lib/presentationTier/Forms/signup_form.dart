import 'package:flutter/material.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/Pages/creatingacc_page.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_options.dart';
class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
        SizedBox(height: 40.0),
        TextField(
          controller: _fullNameController,
          decoration: InputDecoration(labelText: 'Full Name'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email Address'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Confirm Password'),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            String? signUpResult = await AuthMethods().signUpWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
              fullName: _fullNameController.text,
              confirmPassword: _confirmPasswordController.text,
            );
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
                  duration: Duration(seconds: 5),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3B52BB), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Signup',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
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
