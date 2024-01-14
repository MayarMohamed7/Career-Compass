import 'package:flutter/material.dart';
import 'package:graduationinterface/creatingacc.dart'; //import creatingacc page


//create signup statless widget 
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            image: AssetImage('images/assets/back.signup.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 225),
              Text(
                'Create an Account!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SignupForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          onPressed: () {
  
           Navigator.push(context, MaterialPageRoute(builder: (context) => CreatingAcc()));
        
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 40),
          ),
          child: Text(
            'Signup',
            style: TextStyle(
              fontWeight: FontWeight.bold,
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
