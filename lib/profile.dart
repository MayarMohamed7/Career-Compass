import 'package:flutter/material.dart';
import 'package:graduationinterface/drawer.dart';
import 'package:graduationinterface/footer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Center(
          child: Image.asset(
            'images/assets/NiceJob.png',
            height: 140,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileContent(),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add save functionality here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  primary: Color.fromARGB(255, 119, 136, 235),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
            bottomNavigationBar: Footer(),

    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Color.fromARGB(255, 201, 112, 217),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(100),
            
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/assets/8.png'),
          ),
        ),
        SizedBox(height: 8.0),
        TextButton.icon(
          onPressed: () {
            // Add edit profile picture functionality here
          },
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          label: Text(
            'Edit Profile Picture',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ProfileItem("Name", Icons.person, () {
          // Add functionality to edit name
        }),
        ProfileItem("Username", Icons.person_outline, () {
          // Add functionality to edit username
        }),
        ProfileItem("Email", Icons.email, () {
          // Add functionality to edit email
        }),
        ProfileItem("Password", Icons.lock, () {
          // Add functionality to edit password
        }),
        ProfileItem("Phone Number", Icons.phone, () {
          // Add functionality to edit phone number
        }),
        ProfileItem("Age", Icons.calendar_today, () {
          // Add functionality to edit age
        }),
        ProfileItem("Educational Level", Icons.school, () {
          // Add functionality to edit educational level
        }),
        ProfileItem("Job Status", Icons.work, () {
          // Add functionality to edit job status
        }),
        ProfileItem("Field of Interests", Icons.star, () {
          // Add functionality to edit field of interests
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
