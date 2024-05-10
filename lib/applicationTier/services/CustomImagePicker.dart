import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
 // this file handles all image related code like picking image from gallery or camera 
  // and also checking for camera permission before opening the camera
 //Single Responsiblity Principle applied . 
class CameraPermissionHandler {
  Future<bool> checkCameraPermission() async {
    PermissionStatus permission = await Permission.camera.status;
    if (permission != PermissionStatus.granted) {
      PermissionStatus permissionStatus = await Permission.camera.request();
      return permissionStatus == PermissionStatus.granted;
    } else {
      return true;
    }
  }
}

class CustomImagePicker {
  final CameraPermissionHandler _permissionHandler = CameraPermissionHandler();

  Future<Uint8List?> pickImage(ImageSource source) async {
    if (source == ImageSource.camera) {
      // Check for camera permission using separate class
      bool hasPermission = await _permissionHandler.checkCameraPermission();
      if (!hasPermission) {
        // Handle case when permission is not granted
        return null;
      }
    }

    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      return await pickedFile.readAsBytes();
    }
    return null;
  }
}
//  I renamed the class 
//to CustomImagePicker to avoid conflicts with the ImagePicker class provided by the image_picker package
//Path: lib/presentationTier/utils/image_picker.dart  