import 'package:flutter/material.dart';
import 'package:graduationinterface/adminhome.dart';
import 'package:graduationinterface/draweradmin.dart';

class SystemConfigurationPage extends StatelessWidget {
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminDashboardPage()),
            );
          },
        ),
      ),
      endDrawer: AppDrawer2(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/assets/boo.png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'System Configuration',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),

                Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'System Settings',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B52BB), 
                        ),
                      ),
                      SizedBox(height: 12.0),
                      
                      TextFormField(
                        decoration: InputDecoration(labelText: 'System Setting 1'),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'System Setting 2'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Chatbot Behavior',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B52BB), 
                        ),
                      ),
                      SizedBox(height: 12.0),
                      SwitchListTile(
                        title: Text('Enable Chatbot'),
                        value: true,
                        onChanged: (value) {
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Chatbot Setting 1'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Recommendation Criteria',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color:  Color(0xFF3B52BB), 
                        ),
                      ),
                      SizedBox(height: 12.0),
                      
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Criteria 1'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Criteria 2'),
                      ),
                      
                    ],
                  ),
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
