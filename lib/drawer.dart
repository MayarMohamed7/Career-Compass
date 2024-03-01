import 'package:flutter/material.dart';
import 'package:graduationinterface/chat.dart';
import 'package:graduationinterface/intro.dart';
import 'package:graduationinterface/profile.dart';

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
                Navigator.pop(context);
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
