/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/questions_page.dart';
import 'package:graduationinterface/presentationTier//creatingacc_form.dart';

class UserDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(BuildContext context) async {
    try {
      // Get user data from form fields
      Map<String, dynamic> userData = {
        'phoneNumber': SignupFormField.of(context).phoneNumber,
        'age': SignupFormField.of(context).age,
        'educationalLevel': SignupFormField.of(context).educationalLevel,
        'jobStatus': SignupFormField.of(context).jobStatus,
        'fieldOfInterests': SignupFormField.of(context).fieldOfInterests,
      };

      // Obtain the current logged-in user's ID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Save user data to Firestore under 'userData' collection
      await _firestore.collection('userData').doc(userId).set(userData);

      // Navigate to the next page (if required)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuestionsPage()),
      );
    } catch (e) {
      // Handle any errors
      print("Error saving user data: $e");
      // You can show a snackbar or an error dialog to the user here
    }
  }
}
*/