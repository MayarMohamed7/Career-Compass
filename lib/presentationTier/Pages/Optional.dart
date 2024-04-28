import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/pages/Skills.dart';
import 'package:graduationinterface/presentationTier/chat.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';


class OptionalPage extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;

  OptionalPage({
    this.buttonHeight = 250,
    this.buttonWidth = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/assets/boys.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to career compass for personalized career advice!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 140, 22, 183),
                ),
              ),
              SizedBox(height: 30),
              buttonWithImageAndText(
                context,
                'images/assets/222.png',
                'Skills Entry',
                buttonHeight,
                buttonWidth,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsPage())), // Navigate to Skills Page
              ),
              SizedBox(height: 10),
              buttonWithImageAndText(
                context,
                'images/assets/111.png',
                'Chat-Bot',
                buttonHeight,
                buttonWidth,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotInteractionPage())), // Navigate to Chat Bot Page
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Widget buttonWithImageAndText(BuildContext context, String imagePath, String buttonText, double height, double width, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           backgroundColor: Color.fromARGB(255, 201, 112, 217), // Background color
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath, height: height * 0.7),
              SizedBox(height: 5),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: height * 0.09,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
