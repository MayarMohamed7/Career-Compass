import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/chatHistory_page.dart';
import 'package:graduationinterface/presentationTier/forms/profile_page.dart';
import 'package:graduationinterface/presentationTier/Pages/chat.dart';
import 'package:graduationinterface/presentationTier/Pages/intro.dart';
import 'package:graduationinterface/presentationTier/Pages/MySkills.dart';
import 'package:graduationinterface/presentationTier/Pages/Recommedner.dart' ;
import 'package:graduationinterface/presentationTier/Pages/Optional.dart'; 
import 'package:graduationinterface/applicationTier/Repositories/user_repository.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
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
              leading: const Icon(Icons.message, color: Color.fromARGB(255, 140, 22, 183)),
              title: const Text('New Chat', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatbotInteractionPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_edu, color: Color.fromARGB(255, 140, 22, 183)),
              title: const Text('History', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatHistoryPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box, color: Color.fromARGB(255, 140, 22, 183)),
              title: const Text('Account', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(),
  ),

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
              leading: const Icon(Icons.auto_awesome, color: Color.fromARGB(255, 140, 22, 183)), // Add an appropriate icon for Recommender
              title: const Text('Recommender', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecommenderPage()), // Navigate to the RecommenderPage
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color:Color.fromARGB(255, 140, 22, 183)),
              title: const Text('Sign Out', style: TextStyle(color:Color.fromARGB(255, 140, 22, 183))),
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