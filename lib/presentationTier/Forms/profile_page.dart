import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/profile_content.dart';
import 'package:graduationinterface/presentationTier/Widgets/profile_item.dart';
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
