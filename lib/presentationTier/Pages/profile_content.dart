// presentationTier/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';
import 'package:graduationinterface/presentationTier/Widgets/profile_item.dart';
import 'package:graduationinterface/presentationTier/Forms/profile_page.dart';
import 'package:graduationinterface/applicationTier/services/CustomImagePicker.dart';
import 'package:image_picker/image_picker.dart';

class ProfileContent extends StatelessWidget {
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
                backgroundImage:  AssetImage('images/assets/8.png'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'camera') {
                    CustomImagePicker().pickImage(ImageSource.camera);
                  } else {
                    CustomImagePicker().pickImage(ImageSource.gallery);
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

