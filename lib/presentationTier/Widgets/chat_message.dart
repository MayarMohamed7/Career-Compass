import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool isBot;

  ChatMessage({required this.text, required this.isUser, this.isBot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: isUser
                ? Color.fromARGB(255, 176, 169, 177)
                : Color.fromARGB(255, 201, 112, 217), 
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (!isUser && isBot) ...[
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/assets/8.png'), 
                ),
                SizedBox(width: 8.0),
              ],
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}