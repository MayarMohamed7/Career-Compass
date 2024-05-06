import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/SystemConfigurationPage.dart';
import 'package:graduationinterface/presentationTier/Pages/feed.dart';
import 'package:graduationinterface/presentationTier/Pages/intro.dart';

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
              leading:
                  const Icon(Icons.settings, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('System Configuration',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SystemConfigurationPage()),
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.bar_chart, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Feedback Analysis',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeedbackAnalysisPage()),
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.exit_to_app, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Sign Out',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
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
