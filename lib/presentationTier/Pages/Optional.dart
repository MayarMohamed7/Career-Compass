import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/Skills_page.dart';
import 'package:graduationinterface/presentationTier/Pages/Userpost.dart';
import 'package:graduationinterface/presentationTier/Pages/chat.dart';
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
      endDrawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/assets/boys.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to career compass for personalized career advice!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 140, 22, 183),
                ),
              ),
              const SizedBox(height: 30),
              buttonWithImageAndText(
                context,
                'images/assets/222.png',
                'Get your job',
                buttonHeight,
                buttonWidth,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PredictJob())), // Navigate to Skills Page
              ),
              const SizedBox(height: 10),
              buttonWithImageAndText(
                context,
                'images/assets/111.png',
                'Posts',
                buttonHeight,
                buttonWidth,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserPostsPage())), // Navigate to Chat Bot Page
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget buttonWithImageAndText(BuildContext context, String imagePath,
      String buttonText, double height, double width, VoidCallback onPressed) {
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Color.fromARGB(255, 201, 112, 217), // Background color
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
              const SizedBox(height: 5),
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
