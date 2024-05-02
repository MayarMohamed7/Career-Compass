import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';
import 'package:graduationinterface/presentationTier/widgets/chat_interface.dart';

class ChatbotInteractionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChatbotInterface(),
      ),
      endDrawer: AppDrawer(),
      bottomNavigationBar: Footer(),
    );
  }
}
