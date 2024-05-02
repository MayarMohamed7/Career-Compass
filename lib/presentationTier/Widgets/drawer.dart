import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/chatHistory_page.dart';
import 'package:graduationinterface/presentationTier/forms/profile_page.dart';
import 'package:graduationinterface/presentationTier/Pages/chat.dart';
import 'package:graduationinterface/presentationTier/Pages/intro.dart';
import 'package:graduationinterface/presentationTier/Pages/MySkills.dart';
import 'package:graduationinterface/presentationTier/Pages/Recommedner.dart' ;
import 'package:graduationinterface/presentationTier/Pages/Optional.dart'; 
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/assets/search.png',
                    height: 140,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message, color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('New Chat', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatbotInteractionPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history_edu, color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('History', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatHistoryPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box, color: Color.fromARGB(255, 140, 22, 183)),
              title: Text('Account', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Color.fromARGB(255, 140, 22, 183)), // Use appropriate icon for skills
              title: Text('My Skills', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySkillsPage()), // Navigate to MySkillsPage
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color.fromARGB(255, 140, 22, 183)), 
              title: Text('Home', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OptionalPage()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_awesome, color: Color.fromARGB(255, 140, 22, 183)), // Add an appropriate icon for Recommender
              title: Text('Recommender', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecommenderPage()), // Navigate to the RecommenderPage
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color:Color.fromARGB(255, 140, 22, 183)),
              title: Text('Sign Out', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.pushReplacement(
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
