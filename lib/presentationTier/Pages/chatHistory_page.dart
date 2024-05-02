import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';
import 'package:graduationinterface/presentationTier/widgets/chat_history_card.dart';

class ChatHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: AppDrawer(),
      body: ListView(
        children: [
          ChatHistoryCard(
            title: "Resume Review",
            message: "Your resume looks great! Let's discuss job opportunities.",
            time: "Yesterday",
          ),
          ChatHistoryCard(
            title: "Interview Preparation",
            message: "I've prepared some interview questions for you. Let's practice.",
            time: "2 days ago",
          ),
          ChatHistoryCard(
            title: "Career Advice",
            message: "I have some tips on advancing in your career. Let's chat.",
            time: "5 days ago",
          ),
          ChatHistoryCard(
            title: "Job Search Strategies",
            message: "Let's strategize on finding the perfect job for you!",
            time: "1 week ago",
          ),
          ChatHistoryCard(
            title: "Salary Negotiation",
            message: "I can help you negotiate a better salary offer. Let's get started.",
            time: "2 weeks ago",
          ),
          ChatHistoryCard(
            title: "Skill Development",
            message: "We can work on developing new skills to boost your career.",
            time: "3 weeks ago",
          ),
          // Add more chat history items here
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
