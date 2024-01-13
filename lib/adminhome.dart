import 'package:flutter/material.dart';
import 'package:graduationinterface/draweradmin.dart';

class AdminDashboardPage extends StatelessWidget {
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
        automaticallyImplyLeading: false, 
      ),
      endDrawer: AppDrawer2(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/assets/boo.png'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome, Admin!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/assets/trophy.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
                          'Monitoring Tools',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        ListTile(
                          leading: Icon(
                            Icons.timeline,
                            color: Color(0xFF3B52BB),
                          ),
                          title: Text(
                            'Real-time User Activity Tracking',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3B52BB)),
                          ),
                          subtitle: Text(
                            'Track user interactions and engagement in real-time.',
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.error,
                            color: Color(0xFF3B52BB),
                          ),
                          title: Text(
                            'Error Logs',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3B52BB)),
                          ),
                          subtitle: Text(
                            'View logs and details of errors occurring in the system.',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                        
                          },
                          child: Text('Show More'),
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
                          'Analytics',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            AnalyticsPhoto(imagePath: 'images/assets/ONE.png'),
                            AnalyticsPhoto(imagePath: 'images/assets/TWO.png'),
                            AnalyticsPhoto(imagePath: 'images/assets/THREE.png'),
                            AnalyticsPhoto(imagePath: 'images/assets/FOUR.png'),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                           
                          },
                          child: Text('Show More'),
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
                          'Configuration Options',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Color(0xFF3B52BB),
                          ),
                          title: Text(
                            'Chatbot Behavior Settings',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3B52BB)),
                          ),
                          subtitle: Text(
                            'Configure chatbot responses and behavior.',
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.build,
                            color: Color(0xFF3B52BB),
                          ),
                          title: Text(
                            'System Preferences',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3B52BB)),
                          ),
                          subtitle: Text(
                            'Adjust system settings and preferences.',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: Text('Show More'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnalyticsPhoto extends StatelessWidget {
  final String imagePath;

  AnalyticsPhoto({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
