import 'package:flutter/material.dart';
import 'package:graduationinterface/applicationTier/services/CustomImagePicker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:graduationinterface/DB_Tier/firebase/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  CustomImagePicker _customImagePicker = CustomImagePicker();
  Uint8List? _imageBytes;
  StorageMethods _storageMethods = StorageMethods();
  final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;
    String? imageUrl;
    @override
    void initState() {
    super.initState();  
    _loadImageUrlFromStorage();
  }

  Future<void> _loadImageUrlFromStorage() async {
    try {
      String path = 'profile_images/${_auth.currentUser!.email}.jpg';
      String? url = await _storageMethods.getImageUrlFromStorage(path);
      setState(() {
        imageUrl = url;
      });
    } catch (e) {
      print('Error retrieving image URL from storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Color.fromARGB(255, 201, 112, 217),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageBytes != null
                    ? MemoryImage(_imageBytes!)
                    : imageUrl != null
                        ? NetworkImage(imageUrl!)
                        : AssetImage('images/assets/8.png') as ImageProvider<Object>?,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Camera'),
                      onTap: () async {
                        Uint8List? image =
                            await _customImagePicker.pickImage(ImageSource.camera);
                        if (image != null) {
                          try {
                            String path =
                                'profile_images/${_auth.currentUser!.email}.jpg';
                            imageUrl = await _storageMethods
                                .uploadImageToStorage(path, image);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString(
                                'profile_image_url', imageUrl ?? '');
                            setState(() {
                              _imageBytes = image;
                            });
                          } catch (e) {
                            print('Error uploading image and saving URL: $e');
                            // Handle error gracefully (e.g., show a snackbar)
                          }
                        }
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () async {
                        Uint8List? image =
                            await _customImagePicker.pickImage(ImageSource.gallery);
                        if (image != null) {
                          try {
                            String path =
                                'profile_images/${_auth.currentUser!.email}.jpg';
                            imageUrl = await _storageMethods
                                .uploadImageToStorage(path, image);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString(
                                'profile_image_url', imageUrl ?? '');
                            setState(() {
                              _imageBytes = image;
                            });
                          } catch (e) {
                            print('Error uploading image and saving URL: $e');
                            // Handle error gracefully (e.g., show a snackbar)
                          }
                        }
                      },
                    ),
                  ),
                ],
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
      ],
    );
  }
}