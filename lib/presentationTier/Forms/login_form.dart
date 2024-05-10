import 'package:flutter/material.dart';

import 'package:graduationinterface/presentationTier/Pages/signup_page.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart'; 
import 'package:graduationinterface/presentationTier/Pages/Optional.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_firestore.dart';
import 'package:graduationinterface/presentationTier/Pages/adminhome.dart';
import 'package:graduationinterface/presentationTier/Pages/passReset.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  final FirestoreMethods _firestoreMethods = FirestoreMethods();
bool _isLoading = false; // Define _isLoading variable
   bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;


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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(

          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),

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
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            String? signInResult =
                await _authMethods.signInWithEmailAndPassword(

              email: _emailController.text, 

              password: _passwordController.text,
            );
            if (signInResult == null) {
                bool isLoggedIn = await  _authMethods.checkAuthenticationStatus(); 
                if (isLoggedIn)
                {
                bool isUser = await  _firestoreMethods.checkIfUserExists(_emailController.text);
                bool isAdmin = await _firestoreMethods.checkIfAdminExists(_emailController.text);
                if(isUser){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OptionalPage()),
              );
              }
              else if(isAdmin){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboardPage()),
              );
              }
                }
              setState(() {
                _isLoading = false;
              });
            } else {
              print("Sign-in failed: $signInResult");

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Sign-in failed: $signInResult"),
                  duration: const Duration(seconds: 5),
                  backgroundColor: Colors.red,
                ),
              );

              setState(() {
                _isLoading = false;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B52BB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            minimumSize: const Size(10, 10),
          ),
          child: _isLoading
              ? const CircularProgressIndicator()
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupPage()),);
          },
          child: const Center(
            child: Text(
              'Don\'t have an account? Sign up',
              style: TextStyle(
                color: Color(0xFF3B52BB),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => passwordResetpage()),);
          },
          child: const Center(
            child: Text(
              'Reset Password',
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