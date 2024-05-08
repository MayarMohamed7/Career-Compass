import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: Text('Job Predictor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _skillsController,
                decoration: InputDecoration(
                  labelText: 'Enter your skills',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isLoading ? null : predictJob,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('Predict Job'),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
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
    );
  }
}
