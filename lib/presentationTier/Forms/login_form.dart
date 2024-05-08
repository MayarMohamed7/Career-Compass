import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/pages/signup_page.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/pages/Optional.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false; // Define _isLoading variable
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            String? signInResult =
                await _authMethods.signInWithEmailAndPassword(
              email: _usernameController
                  .text, // Use _usernameController instead of _emailController
              password: _passwordController.text,
            );

            if (signInResult == null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OptionalPage()),
              );
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
                context, MaterialPageRoute(builder: (context) => SignupPage()));
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
      ],
    );
  }
}

  
   /* bool isLoggedIn =  await _authMethods.checkAuthenticationStatus();
         
            if (isLoggedIn) {
              bool isUser = await _authMethods.checkIfUserExists(
                  _emailController.text);
              bool isAdmin = await _authMethods.checkIfAdminExists(
                  _emailController.text);*/

             // if (isUser) {
              /* else if (isAdmin) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminDashboardPage()),
                );
              }*/