import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/forms/login_form.dart';
import 'package:graduationinterface/applicationTier/models/User.dart';

class LoginPage extends StatelessWidget {

  LoginPage({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/assets/backk.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 240),
            Text(
              'Please Login here!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
