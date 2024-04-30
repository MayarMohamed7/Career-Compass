// presentationTier/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
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
              ProfileContent(),
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
