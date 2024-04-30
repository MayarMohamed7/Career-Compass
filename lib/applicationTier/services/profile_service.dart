/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:graduationinterface/applicationTier/services/userData_service.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  
  // Method to fetch user data from the users table
  Future<User> _fetchUserDataFromUsersTable() async {
    User? user;
    try {
      // Fetch user data from the users table
      DocumentSnapshot userDataSnapshot = await _usersCollection.doc(_auth.currentUser!.uid).get();

      // Create a User object from the fetched data
      user = User(
        name: userDataSnapshot['name'] ?? '', // Retrieve name from users table
        email: userDataSnapshot['email'] ?? '', // Retrieve email from users table
        phoneNumber: '', // Placeholder for phone number
        age: 0, // Placeholder for age
        educationalLevel: '', // Placeholder for educational level
        jobStatus: '', // Placeholder for job status
        fieldOfInterests: '', // Placeholder for field of interests
      );
    } catch (e) {
      // Handle any errors
      print("Error fetching user data from users table: $e");
      // You can throw an exception or return null here based on your error handling strategy
    }
    return user ?? User(); // Return the user object or a default user object
  }
  
  // Method to fetch user data from the userData table
  Future<Map<String, dynamic>> _fetchUserDataFromUserDataTable() async {
    Map<String, dynamic> userData = {};
    try {
      // Fetch user data from the userData table
      DocumentSnapshot userDataSnapshot = await _firestore.collection('userData').doc(_auth.currentUser!.uid).get();

      // Update the userData map with the fetched data
      userData = userDataSnapshot.data() as Map<String, dynamic>;
    } catch (e) {
      // Handle any errors
      print("Error fetching user data from userData table: $e");
      // You can throw an exception or return an empty map here based on your error handling strategy
    }
    return userData;
  }

  // Method to fetch complete user data
  Future<User> getUserData() async {
    // Fetch user data from both tables
    User userDataFromUsersTable = await _fetchUserDataFromUsersTable();
    Map<String, dynamic> userDataFromDataTable = await _fetchUserDataFromUserDataTable();

    // Merge user data from both tables
    User mergedUserData = User(
      name: userDataFromUsersTable.name,
      email: userDataFromUsersTable.email,
      phoneNumber: userDataFromDataTable['phoneNumber'] ?? '',
      age: userDataFromDataTable['age'] ?? 0,
      educationalLevel: userDataFromDataTable['educationalLevel'] ?? '',
      jobStatus: userDataFromDataTable['jobStatus'] ?? '',
      fieldOfInterests: userDataFromDataTable['fieldOfInterests'] ?? '',
    );

    return mergedUserData;
  }
}
*/