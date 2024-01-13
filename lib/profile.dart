import 'package:flutter/material.dart';
import 'package:graduationinterface/drawer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png',
              height: 140,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileContent(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
               
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('images/assets/8.png'),
        ),
        SizedBox(height: 8.0),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        ProfileItem("Name", Icons.edit, () {
        }),
        ProfileItem("Username", Icons.edit, () {
        }),
        ProfileItem("Email", Icons.edit, () {
        }),
        ProfileItem("Password", Icons.edit, () {
        }),
        ProfileItem("Phone Number", Icons.edit, () {
        }),
        ProfileItem("Age", Icons.edit, () {
        }),
        ProfileItem("Educational Level", Icons.edit, () {
        }),
        ProfileItem("Job Status", Icons.edit, () {
        }),
        ProfileItem("Field of Interests", Icons.edit, () {
        }),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  ProfileItem(this.label, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
      ),
    );
  }
}
