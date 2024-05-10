import 'package:flutter/material.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/Pages/Userpost.dart';
import 'package:graduationinterface/presentationTier/Pages/adminfeeds.dart';
import 'package:graduationinterface/presentationTier/Pages/chatHistory_page.dart';
import 'package:graduationinterface/presentationTier/Pages/mayar.dart';
import 'package:graduationinterface/presentationTier/forms/profile_page.dart';
import 'package:graduationinterface/presentationTier/Pages/chat.dart';
import 'package:graduationinterface/presentationTier/Pages/intro.dart';
import 'package:graduationinterface/presentationTier/Pages/MySkills.dart';
import 'package:graduationinterface/presentationTier/Pages/Recommedner.dart';
import 'package:graduationinterface/presentationTier/Pages/Optional.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/assets/search.png',
                    height: 140,
                  ),
                ],
              ),
            ),
            
            ListTile(
              leading: Icon(Icons.account_box,
                  color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('Account',
                  style: TextStyle(color: Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            
              ListTile(
              leading:
                  Icon(Icons.engineering, color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('Predict Your Job',
                  style: TextStyle(color: Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PredictJob()),
                );
              },
            ),
            
            ListTile(
              leading: Icon(Icons.star_half_sharp,
                  color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('Feedback',
                  style: TextStyle(color: Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => feedbacks(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment,
                  color: Color.fromARGB(
                      255, 140, 22, 183)), // Use appropriate icon for skills
              title: Text('My Skills',
                  style: TextStyle(color: Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MySkillsPage()), // Navigate to MySkillsPage
                );
              },
            ),
         
            ListTile(
              leading: Icon(Icons.announcement, color: Color.fromARGB(255, 140, 22, 183)), 
              title: Text('Post', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPostsPage()), 
                );
              },
            ),
            
            ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('Sign Out',
                  style: TextStyle(color: Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                AuthMethods().signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
