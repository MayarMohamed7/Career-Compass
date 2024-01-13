import 'package:flutter/material.dart';
import 'package:graduationinterface/SystemConfigurationPage.dart';
import 'package:graduationinterface/feed.dart';
import 'package:graduationinterface/intro.dart';

class AppDrawer2 extends StatelessWidget {
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
              leading: Icon(Icons.settings, color: Color.fromARGB(255, 0, 0, 0)),
              title: Text('System Configuration', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SystemConfigurationPage()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: Color.fromARGB(255, 0, 0, 0)),
              title: Text('Feedback Analysis', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackAnalysisPage()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Color.fromARGB(255, 0, 0, 0)),
              title: Text('Sign Out', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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
