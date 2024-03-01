import 'package:flutter/material.dart';
import 'package:graduationinterface/drawer.dart';

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
          ChatHistoryItem(
            title: "Resume Review",
            message: "Your resume looks great! Let's discuss job opportunities.",
            time: "Yesterday",
          ),
          ChatHistoryItem(
            title: "Interview Preparation",
            message: "I've prepared some interview questions for you. Let's practice.",
            time: "2 days ago",
          ),
          ChatHistoryItem(
            title: "Career Advice",
            message: "I have some tips on advancing in your career. Let's chat.",
            time: "5 days ago",
          ),
          ChatHistoryItem(
            title: "Job Search Strategies",
            message: "Let's strategize on finding the perfect job for you!",
            time: "1 week ago",
          ),
          ChatHistoryItem(
            title: "Salary Negotiation",
            message: "I can help you negotiate a better salary offer. Let's get started.",
            time: "2 weeks ago",
          ),
          ChatHistoryItem(
            title: "Skill Development",
            message: "We can work on developing new skills to boost your career.",
            time: "3 weeks ago",
          ),
          // Add more chat history items here
        ],
      ),
    );
  }
}

class ChatHistoryItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const ChatHistoryItem({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
      onTap: () {
        // Handle tapping on a chat item
      },
    );
  }
}
