import 'package:flutter/material.dart';
import 'package:graduationinterface/Optional.dart';
//import 'package:graduationinterface/chat.dart';
import 'package:graduationinterface/intro.dart';
//import 'package:graduationinterface/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  OptionalPage(),
      debugShowCheckedModeBanner: 
      false,
    );
  }
}

