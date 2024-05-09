import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictJob extends StatefulWidget {
  @override
  _PredictJobState createState() => _PredictJobState();
}

class _PredictJobState extends State<PredictJob> {
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  bool _isLoading = false;

  Future<void> predictJob() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var response = await http.post(
        Uri.parse('http://192.168.1.2:8000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'Skills': _skillsController.text}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        _jobController.text = data['Predicted Job Title'];
      } else {
        _jobController.text = "Error predicting job";
      }
    } catch (e) {
      _jobController.text = "Error connecting to the API";
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 201, 112, 217), // Background color from the previous sized box
        title: Center(
          child: Image.asset(
            'images/assets/NiceJob.png', // Image from the second page
            height: 95,
          ),
        ),
        shape: Border(bottom: BorderSide(color: const Color.fromARGB(255, 201, 112, 217))), // Same color as the app bar background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: _skillsController,
                      decoration: InputDecoration(
                        hintText: 'Enter your skills',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: const Color.fromARGB(255, 201, 112, 217)), // Same color as the app bar background
                        ),
                      ),
                      style: TextStyle(fontSize: 18), // Increase text size
                      maxLines: null, // Allow multiple lines for the text field
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isLoading ? null : predictJob,
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            'Predict Job',
                            style: TextStyle(
                              color: Colors.white, // White text color
                              fontSize: 18, // Increase text size
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 201, 112, 217), // Background color from the previous sized box
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    width: 300,
                    child: Image.asset(
                      'images/assets/fly.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Predicted Job: ${_jobController.text}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
