import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/Pages/login_page.dart';



class passwordResetpage extends StatefulWidget {
  const passwordResetpage({super.key});

  @override
  _passwordResetState createState() => _passwordResetState();
}

class _passwordResetState extends State<passwordResetpage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
 

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/ew3a.png',
              height: 120,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Recieve a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.grey,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 5, 41, 71),
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(Icons.email),
              label: const Text(
                'Send Email',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                AuthMethods().resetpassword(emailController.text).then((success) {
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password Reset Email Sent'),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: Failed to reset password'),
                        duration: const Duration(seconds: 5),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}