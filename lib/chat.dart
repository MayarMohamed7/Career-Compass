import 'package:flutter/material.dart';
import 'package:graduationinterface/drawer.dart';

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
    );
  }
}

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
