import 'package:flutter/material.dart';
import 'package:graduationinterface/drawer.dart';
import 'package:graduationinterface/footer.dart';
import 'package:graduationinterface//.dart';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/firebase_options.dart';

import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  StorageMethods _storageMethods = StorageMethods();

  void selectImage(ImageSource source) async {
    Uint8List? image = await _storageMethods.pickImage(source);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void saveProfile() async {
    if (_image != null) {
      String downloadURL = await _storageMethods.uploadImagetoStorage('profile_images', _image!);
      // Get the user's name
      String userPhoto = FirebaseAuth.instance.currentUser!.displayName!;

      // Save the downloadURL in Firestore
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      users.doc(userPhoto).set({'profileImageUrl': downloadURL});
    }
  }

  String name = '';
  String email = '';
  String phoneNumber = '';
  String age = '';
  String educationalLevel = '';
  String jobStatus = '';
  String fieldOfInterests = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'images/assets/NiceJob.png',
            height: 140,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileContent(_image, selectImage),
              ProfileItem("Name: $name", Icons.person, (newName) {
                setState(() {
                  name = newName;
                });
              }),
              ProfileItem("Email: $email", Icons.email, (newEmail) {
                setState(() {
                  email = newEmail;
                });
              }),
              ProfileItem("Phone Number: $phoneNumber", Icons.phone, (newPhoneNumber) {
                setState(() {
                  phoneNumber = newPhoneNumber;
                });
              }),
              ProfileItem("Age: $age", Icons.calendar_today, (newAge) {
                setState(() {
                  age = newAge;
                });
              }),
              ProfileItem("Educational Level: $educationalLevel", Icons.school, (newEducationalLevel) {
                setState(() {
                  educationalLevel = newEducationalLevel;
                });
              }),
              ProfileItem("Job Status: $jobStatus", Icons.work, (newJobStatus) {
                setState(() {
                  jobStatus = newJobStatus;
                });
              }),
              ProfileItem("Field of Interests: $fieldOfInterests", Icons.calendar_today, (newInterests) {
                setState(() {
                  fieldOfInterests = newInterests;
                });
              }),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  saveProfile();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  backgroundColor: Color.fromARGB(255, 119, 136, 235), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  final Uint8List? image;
  final Function(ImageSource) selectImage;

  ProfileContent(this.image, this.selectImage);

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
                backgroundImage: image != null
                    ? MemoryImage(image!)
                    : AssetImage('images/assets/8.png') as ImageProvider,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'camera') {
                    selectImage(ImageSource.camera);
                  } else if (value == 'gallery') {
                    selectImage(ImageSource.gallery);
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'camera',
                    child: ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'gallery',
                    child: ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
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

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function(String)? onTap;

  ProfileItem(this.title, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        final controller = TextEditingController();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Edit your  $title'),
              content: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Enter here'),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Save'),
                  onPressed: () {
                    onTap?.call(controller.text);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
