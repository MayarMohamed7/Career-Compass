import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/Widgets/footer.dart';

class ChatbotInteractionPage extends StatelessWidget {
  const ChatbotInteractionPage({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ChatbotInterface(),
      ),
      endDrawer: const AppDrawer(),
      bottomNavigationBar: const Footer(),
    );
  }
}

class ChatbotInterface extends StatefulWidget {
  const ChatbotInterface({super.key});

  @override
  _ChatbotInterfaceState createState() => _ChatbotInterfaceState();
}

class _ChatbotInterfaceState extends State<ChatbotInterface> {
  final TextEditingController _skillsController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.add(const ChatMessage(
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
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _skillsController,
                decoration: const InputDecoration(
                  hintText: 'Enter your message',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                _sendMessage(_skillsController.text);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 201, 112, 217),
                ),
                child: const Icon(
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

      _messages.add(const ChatMessage(
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

  const ChatMessage({super.key, required this.text, required this.isUser, this.isBot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: isUser
                ? const Color.fromARGB(255, 176, 169, 177)
                : const Color.fromARGB(255, 201, 112, 217),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (!isUser && isBot) ...[
                const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/assets/8.png'),
                ),
                const SizedBox(width: 8.0),
              ],
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
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
