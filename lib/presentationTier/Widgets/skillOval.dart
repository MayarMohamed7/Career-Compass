import 'package:flutter/material.dart';

class SkillOval extends StatelessWidget {
  final String skillName;
  final VoidCallback onDelete;

  SkillOval({required this.skillName, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Color.fromARGB(255, 201, 112, 217)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(skillName, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}