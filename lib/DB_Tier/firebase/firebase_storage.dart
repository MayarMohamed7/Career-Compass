import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(String childName, Uint8List image) async {
    try {
      Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
      UploadTask uploadTask = ref.putData(image);
      TaskSnapshot snap = await uploadTask;
      String downloadURL = await snap.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image to storage: $e');
      throw e; // Propagate the error to the caller
    }
  }

  Future<String?> getProfileImageUrl(String userId) async {
    try {
      Reference ref = _storage.ref().child('profile_images').child('$userId.jpg');
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error retrieving profile image URL from storage: $e');
      return null;
    }
  }
}