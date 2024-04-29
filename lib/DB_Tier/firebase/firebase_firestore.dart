//This file would contain methods related to reading,
 //writing, updating, and deleting data in Firestore,
 // including user and admin management.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/applicationTier/models/skill.dart';

 class FirestoreMethods {
  // Save the skills to Firestore

  Future<void> saveSkillToFirestore(List<String> skills) async {
    try {
      // Get the current user's ID
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        // Reference to the document for the user
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('users').doc(userId);

        // Get existing user data or create new document
        DocumentSnapshot userSnapshot = await userDocRef.get();

        if (userSnapshot.exists) {
          // If the user document already exists, update the skills field
          List<String>? existingSkills = (userSnapshot.data() as Map<String, dynamic>)['skills']?.cast<String>();
          List<String> updatedSkills = [...existingSkills ?? [], ...skills];

          await userDocRef.update({'skills': updatedSkills});
        } else {
          // If the user document doesn't exist, create a new one with the skills field
          await userDocRef.set({'skills': skills});
        }
      }
    } catch (error) {
      print('Error saving skills: $error');
      // Handle error
    }
  }
Future<List<Skill>> fetchSkillsFromFirestore() async {
  List<Skill> skills = [];

  try {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (userSnapshot.exists) {
    List<dynamic> skillsData = (userSnapshot.data() as Map<String, dynamic>)['skills'] ?? [];

        skills = skillsData.map((skillName) => Skill(name: skillName)).toList();
      }
    }
  } catch (error) {
    print('Error fetching skills: $error');
  }

  return skills;
}
} 