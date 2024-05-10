import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/profile_content.dart';
import 'package:graduationinterface/presentationTier/Widgets/profile_item.dart';
import 'package:graduationinterface/applicationTier/services/profile_service.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:graduationinterface/presentationTier/utils/dialogtemp.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileService _profileService = ProfileService();

  String fullname='';
  String email='';
  String phoneNumber='';
  String age='';
  String educationalLevel='';
  String jobStatus='';
  String fieldOfInterests='';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await _profileService.getUserData(user!.uid);
    final credData = await _profileService.getCred(user.uid);
    setState(() {
      fullname = credData['fullname'] ?? '';
      email = credData['email'] ?? '';
      phoneNumber = userData['phoneNumber'] ?? '';
      age = userData['age'] ?? '';
      educationalLevel = userData['educationalLevel'] ?? '';
      jobStatus = userData['jobStatus'] ?? '';
      fieldOfInterests = userData['fieldOfInterests'] ?? '';
    });
  }

  Future<void> saveData() async {
    final user = FirebaseAuth.instance.currentUser;
    await _profileService.updateUserData(user!.uid, {
      'phoneNumber': phoneNumber,
      'age': age,
      'educationalLevel': educationalLevel,
      'jobStatus': jobStatus,
      'fieldOfInterests': fieldOfInterests,
    });
  }

  Future<void> saveCred() async 
  {
    final user = FirebaseAuth.instance.currentUser;
    await _profileService.updateCred(user!.uid, {
      'fullname': fullname,
      'email': email,
    });
  }

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
              ProfileItem("Name: $fullname", Icons.person, (newName) {
                setState(() {
                  fullname = newName;
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
                onPressed: ()  {
                  showChangesSavedDialog(context);
                  saveData();
                  saveCred();
              
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