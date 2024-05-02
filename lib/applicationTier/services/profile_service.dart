import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileService {
  
      bool PasswordsMatched(String password, String confirmPassword) {
    return password == confirmPassword;
  }

// Function to update user profile email and password
  Future<void> updateProfile(String fullName, String email, String password, String confirmPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (PasswordsMatched(password, confirmPassword)) {
        await user.updateEmail(email);
        await user.updatePassword(password);
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'fullName': fullName,
          'email': email,
        });
      }
    }
  }
   // function to update profile Item 

  Future<void> updateProfileItem(String uid, String field, String value) async {
    await FirebaseFirestore.instance.collection('userData').doc(uid).update({
      field: value,
    }); 

  
}
}