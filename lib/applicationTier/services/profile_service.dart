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
  
  

  