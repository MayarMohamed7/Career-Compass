//This file would contain methods related to reading,
 //writing, updating, and deleting data in Firestore,
 // including user and admin management.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/applicationTier/models/skill.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Save the skills to Firestore

  Future<void> saveSkillToFirestore(List<String> skills) async  //for SkillsPage 
  {
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
//save user data entered in creating account !  
  Future<String?> saveUserData({
    required String phoneNumber,
    required String age,
    required String educationalLevel,
    required String jobStatus,
    required String fieldOfInterests,
  }) async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('userData').doc(userId);

        Map<String, dynamic> userData = {
          'phoneNumber': phoneNumber,
          'age': age,
          'educationalLevel': educationalLevel,
          'jobStatus': jobStatus,
          'fieldOfInterests': fieldOfInterests,
        };

        await userDocRef.set(userData);
        return null; // Return null to indicate success
      } else {
        return 'User not logged in';
      }
    } catch (e) {
      return e.toString(); // Return error message
    }
  }

  Future<List<Skill>> fetchSkillsFromFirestore() async // for MY skills page
  {
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
Future<void> removeSkillFromFirestore(String skillName) async {
  try {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      DocumentSnapshot userSnapshot = await userDocRef.get();
      if (userSnapshot.exists) {
        List<String> existingSkills =
            (userSnapshot.data() as Map<String, dynamic>)['skills']?.cast<String>() ?? [];

        existingSkills.remove(skillName);

          await userDocRef.update({'skills': existingSkills});
        }
      }
    } catch (error) {
      print('Error removing skill: $error');
    }
  }
  
  Future<bool> checkIfUserExists(String email) async 
  {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
          

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      // Return false if there is an error
      print('Error checking user existence: $e');
      return false;

    }
  } 

    Future<bool> checkIfAdminExists(String email) async {
    try {
    
      QuerySnapshot querySnapshot = await _firestore
          .collection('admins')
          .where('email', isEqualTo: email)
          .get();
          

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      // Return false if there is an error
      print('Error checking user existence: $e');
      return false;

    }
  } 


}