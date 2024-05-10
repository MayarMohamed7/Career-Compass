import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/widgets/footer.dart';

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
      ),
      endDrawer: const AppDrawer(), 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/assets/ew3a.png"), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Job Recommender',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _skillsController,
                decoration: InputDecoration(
                  hintText: 'Enter your skills',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    borderSide: BorderSide(color: Colors.black), // Black border
                  ),
                  filled: true,
                  fillColor: Colors.white, // White background
                  contentPadding: EdgeInsets.all(16.0), // Padding inside text field
                ),
                style: TextStyle(fontSize: 18, color: Colors.black), // Text color
                maxLines: null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : predictJob,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Predict Job',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 201, 112, 217),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Adjust button padding
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
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
