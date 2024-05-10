import 'package:flutter/material.dart';
import 'package:graduationinterface/applicationTier/services/new_post_page.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/Pages/feedb.dart';
import 'package:graduationinterface/presentationTier/Pages/intro.dart';
import 'package:graduationinterface/presentationTier/Pages/j.dart';

class AppDrawer2 extends StatelessWidget {
  const AppDrawer2({super.key});

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
              leading: const Icon(Icons.settings, color: Color(0xFF004AAD)),
              title: const Text('Manage Users', style: TextStyle(color: Color(0xFF004AAD))),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => UserManagementPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article, color: Color(0xFF004AAD)),
              title: const Text('Manage Posts', style: TextStyle(color: Color(0xFF004AAD))),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NewPostPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart, color: Color(0xFF004AAD)),
              title: const Text('Feedback Analysis', style: TextStyle(color: Color(0xFF004AAD))),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AdminFeedbackPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Color(0xFF004AAD)),
              title: const Text('Sign Out', style: TextStyle(color: Color(0xFF004AAD))),
              onTap: () 
              {
                AuthMethods().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
