import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/pages/MySkills.dart';

void showChangesSavedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Changes saved',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Container(
          width: 150,
          height: 150,
          child: Image.asset(
            'images/assets/222.png', // Adjust the image path as needed
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MySkillsPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding here
                  child: Text(
                    'Go to skills page',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
