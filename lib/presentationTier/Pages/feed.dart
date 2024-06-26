import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/draweradmin.dart';
import 'package:graduationinterface/presentationTier/pages/adminhome.dart';

class FeedbackAnalysisPage extends StatelessWidget {
  const FeedbackAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminDashboardPage()));
          },
        ),
      ),
      endDrawer: const AppDrawer2(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/assets/last.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Feedback Analysis',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Change title color to white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'images/assets/lovee.png'), // Replace with your admin photo asset
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'User Feedback',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B52BB),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          ListTile(
                            title: Text('User Comment 1'),
                          ),
                          ListTile(
                            title: Text('User Comment 2'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Feedback Trends',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B52BB),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Image.asset(
                            'images/assets/FOUR.png',
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
