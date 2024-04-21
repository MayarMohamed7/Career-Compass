import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/pages/signup_page.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart'; 
import 'package:graduationinterface/presentationTier/pages/Optional.dart';
import 'package:graduationinterface/presentationTier/pages/adminhome.dart';
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Username'),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
     SizedBox(height: 24.0),
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
  
    bool isLoggedIn =  await _authMethods.checkAuthenticationStatus();
         
            if (isLoggedIn) {
              bool isUser = await _authMethods.checkIfUserExists(
                  _emailController.text);
              bool isAdmin = await _authMethods.checkIfAdminExists(
                  _emailController.text);

              if (isUser) {
          
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OptionalPage()),
                );
              } else if (isAdmin) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminDashboardPage()),
                );
              }
              setState(() {
                _isLoading = false;
              });
            } else {
              print('User not found in either tables');
            }
          } else {
            print("Sign-in failed: $signInResult");

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Sign-in failed: $signInResult"),
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
              ),
            );

            setState(() {
              _isLoading = false;
            });
          }
        },
        child: _isLoading
            ? CircularProgressIndicator()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
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
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3B52BB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          minimumSize: Size(10, 10),
        ),
      ),
      SizedBox(height: 16.0),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage()));
        },
        child: Center(
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
