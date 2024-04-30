import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/intro.dart';
import 'package:graduationinterface/DB_Tier/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
