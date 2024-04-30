import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_options.dart';
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String confirmPassword,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Get the user's UID
      String? uid = userCredential.user?.uid;

      if (uid != null) {
        await _firestore.collection('users').doc(uid).set({
          'email': email,
          'fullname': fullName,
          'password': password,
          'confirmpassword': confirmPassword,
        });

        return null; // Return null if signup is successful
      } else {
        return 'Failed to create user'; // Return error if UID is null
      }
    } catch (e) {
      return e.toString(); // Return the error message if signup fails
    }
  }

  // Log in with email and password
  Future<String?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Return null if login is successful
    } catch (e) {
      return e.toString(); // Return the error message if login fails
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
