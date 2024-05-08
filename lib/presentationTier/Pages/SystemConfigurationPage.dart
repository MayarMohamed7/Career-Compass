import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/pages/adminhome.dart';
import 'package:graduationinterface/presentationTier/Widgets/draweradmin.dart';

class SystemConfigurationPage extends StatelessWidget {
  const SystemConfigurationPage({super.key});

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminDashboardPage()),
            );
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
                const Text(
                  'System Configuration',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'System Settings',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B52BB),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'System Setting 1'),
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'System Setting 2'),
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
                          'Chatbot Behavior',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B52BB),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        SwitchListTile(
                          title: const Text('Enable Chatbot'),
                          value: true,
                          onChanged: (value) {},
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Chatbot Setting 1'),
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
                          'Recommendation Criteria',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B52BB),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Criteria 1'),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Criteria 2'),
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
