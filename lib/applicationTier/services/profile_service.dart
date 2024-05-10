import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      bool PasswordsMatched(String password, String confirmPassword)
   {
    return password == confirmPassword;
  }
Future<Map<String, dynamic>> getUserData(String userId) async {
    final userDataDoc = await _firestore.collection('userData').doc(userId).get();
    return userDataDoc.data() ?? {};
  }

Future<Map<String, dynamic>> getCred(String userId) async {
    final userDataDoc = await _firestore.collection('users').doc(userId).get();
    return userDataDoc.data() ?? {};
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> newData) async {
    await _firestore.collection('userData').doc(userId).update(newData);
  }
Future<void> updateCred(String userId, Map<String, dynamic> newData) async {
    await _firestore.collection('users').doc(userId).update(newData);
  }
  
}
  
  

  
// Function to fetch user profile data

  /*Future<User?> getCurrentUserProfile() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = auth.currentUser;
  if (currentUser != null) {
    // Fetch user data from 'users' table
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

    // Fetch user profile data from 'userData' table
    DocumentSnapshot userProfileSnapshot = await FirebaseFirestore.instance.collection('userData').doc(currentUser.uid).get();
    Map<String, dynamic> userProfileData = userProfileSnapshot.data() as Map<String, dynamic>;

    // Merge data from both tables into a single User object
    return User(
      id: userData['id'],
      email: userData['email'] ?? '',
      fullName: userData['fullName'] ?? '',
      phoneNumber: userProfileData['phoneNumber'],
      age: userProfileData['age'],
      educationalLevel: userProfileData['educationalLevel'],
      jobStatus: userProfileData['jobStatus'],
      fieldOfInterests: userProfileData['fieldOfInterests'],
    );
  }
  return null;
}

Future<void> fetchUserProfile(Function(User?) onProfileFetched) async {
    User? userProfile = await getCurrentUserProfile();
    onProfileFetched(userProfile);
  }*/