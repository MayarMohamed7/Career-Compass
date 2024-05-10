import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/questions_page.dart';
import 'package:graduationinterface/presentationTier/Forms/creatingacc_form.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_firestore.dart';
import 'package:graduationinterface/applicationTier/services/CustomImagePicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';


class CreatingAccPage extends StatefulWidget {
  @override
  _CreatingAccPageState createState() => _CreatingAccPageState();
}
class _CreatingAccPageState extends State<CreatingAccPage>
{

  FirestoreMethods _firestoreMethods = FirestoreMethods();
  CustomImagePicker _customImagePicker = CustomImagePicker();
  Uint8List? _image;
  FirebaseAuth _auth = FirebaseAuth.instance;
  StorageMethods _storageMethods = StorageMethods();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController selectedEducationalLevel = TextEditingController();
  final TextEditingController selectedJobStatus = TextEditingController();
  final TextEditingController selectedFieldOfInterests = TextEditingController();


  
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/assets/signn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.5),
                        /// This part of the code is setting the image for the container based on the
                        /// `_image` variable.
                        image: _image == null
                            ? const DecorationImage(
                                image: AssetImage('images/assets/8.png'),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: MemoryImage(_image!),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Camera'),
                                onTap: () async {
                                  Uint8List? image =
                                      await _customImagePicker.pickImage(
                                          ImageSource.camera);
                                  if (image != null) {
                                    setState(() {
                                      _image = image;
                                    });
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
                                      await _customImagePicker.pickImage(
                                          ImageSource.gallery);
                                  if (image != null) {
                                    setState(() {
                                      _image = image;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              SignupFormField(
                phoneNumberController: phoneNumberController,
                ageController: ageController,
                selectedEducationalLevel: selectedEducationalLevel,
                selectedJobStatus: selectedJobStatus,
                selectedFieldOfInterests: selectedFieldOfInterests,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                    if (_image != null) {
      // Upload image to Firebase Storage
      String imageURL = await _storageMethods.uploadImageToStorage(
        'profile_images/${_auth.currentUser!.email}.jpg', // Firebase Storage path with user ID as filename
        _image!,
      );
                    }

                  String? res = await _firestoreMethods.saveUserData(
                    phoneNumber: phoneNumberController.text,
                    age: ageController.text,
                    educationalLevel: selectedEducationalLevel.text,
                    jobStatus: selectedJobStatus.text,
                    fieldOfInterests: selectedFieldOfInterests.text,
                  );
                  if (res == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionsPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error creating account: $res'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B52BB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}