import 'package:flutter/material.dart';
class ChatHistoryCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const ChatHistoryCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
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
      ),
    );
  }
}
