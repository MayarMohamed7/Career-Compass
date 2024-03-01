import 'package:flutter/material.dart';
import 'package:graduationinterface/Optional.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
