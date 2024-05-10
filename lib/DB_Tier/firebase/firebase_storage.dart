import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


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
      rethrow; // Propagate the error to the caller
    }
  }

Future<String?> getImageUrlFromStorage(String path) async {
  try {
    Reference ref = _storage.ref().child(path).child(_auth.currentUser!.uid);
    String? url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    print('Error retrieving image URL from storage: $e');
    return null;
  }
}
}
  