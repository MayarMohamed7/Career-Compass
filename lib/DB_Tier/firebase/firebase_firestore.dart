//This file would contain methods related to reading,
 //writing, updating, and deleting data in Firestore,
 // including user and admin management.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 class FirestoreMethods {
  // Save the skills to Firestore
  Future<void> saveSkillToFirestore(List<String> skills) async {
    try {
      // Get the current user's ID
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        // Save each skill with the user's ID
        for (String skill in skills) {
          await FirebaseFirestore.instance.collection('user_skills').add({
            'skill': skill,
            'userId': userId,
          });
        }
      }
    } catch (error) {
      print('Error saving skills: $error');
      // Handle error
    }
  }
}
 