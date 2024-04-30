import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/Optional.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
          icon: Icon(
            Icons.home_rounded,
            color: Color.fromARGB(255, 201, 112, 217), // Set icon color to purple
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OptionalPage()));
          },
        ),
      ),
    );
  }
}
