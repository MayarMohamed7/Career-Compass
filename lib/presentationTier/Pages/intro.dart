import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/adminhome.dart';
import 'package:graduationinterface/presentationTier/Pages/login_page.dart';

import '../../applicationTier/models/User.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = User(
      email: '',
      fullname: '',
      password: '',
      confirmPassword: '',
      name: '',
      phoneNumber: '',
      age: 0,
      educationalLevel: '',
      jobStatus: '',
      fieldOfInterests: '',
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/assets/bb.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to Career Compass, We will help you find your suitable job',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(user: user)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(300, 50),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Register'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminDashboardPage()),
                    );
                  },
                  child: Text(
                    'Admin Registration ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
