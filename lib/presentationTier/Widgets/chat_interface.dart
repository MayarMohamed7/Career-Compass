
import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/widgets/chat_message.dart';

class ChatbotInterface extends StatefulWidget {
  @override
  _ChatbotInterfaceState createState() => _ChatbotInterfaceState();
}
class _ChatbotInterfaceState extends State<ChatbotInterface> {
  final TextEditingController _skillsController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.add(ChatMessage(
      text: 'How can I help you today?',
      isUser: false,
      isBot: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _messages[index];
            },
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _skillsController,
                decoration: InputDecoration(
                  hintText: 'Enter your message',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)), 
              ),
            ),
            SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                _sendMessage(_skillsController.text);
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 201, 112, 217), 
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _sendMessage(String message) {
    setState(() {
      _messages.add(ChatMessage(
        text: message,
        isUser: true,
      ));

      _messages.add(ChatMessage(
        text: 'Career Compass : Response',
        isUser: false,
        isBot: true,
      ));

      _skillsController.clear();
    });
  }
}
