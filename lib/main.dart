import 'package:flutter/material.dart';
import 'package:graduationinterface/MySkills.dart';
import 'package:graduationinterface/Skills.dart';
import 'package:graduationinterface/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MySkillsPage(),
      debugShowCheckedModeBanner: 
      false,
    );
  }
}

