import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/Optional.dart';
import 'package:graduationinterface/presentationTier/Pages/dashboard.dart';

class aFooter extends StatelessWidget {
  const aFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey, // Grey color for the border
            width: 0.5, // Border width
          ),
        ),
      ),
      child: Container(
        height: 60,
        color: Colors.white,
        child: IconButton(
          icon: const Icon(
            Icons.dashboard,
            color:
                Color.fromARGB(255, 201, 112, 217), // Set icon color to purple
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
      ),
    );
  }
}
