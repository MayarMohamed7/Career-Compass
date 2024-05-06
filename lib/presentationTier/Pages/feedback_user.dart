import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/utils/dialogtemp.dart';
import 'package:graduationinterface/applicationTier/services/rate_services.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
class feedback_user extends StatefulWidget {
  @override
  _feedback_userState createState() => _feedback_userState();
}
class _feedback_userState extends State<feedback_user> {
    double _rating = 0.0;
  TextEditingController _commentController = TextEditingController();

  RateServices _rateServices = RateServices();

  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate & Feedback'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: _commentController,
                    decoration: InputDecoration(
                      labelText: 'Enter your feedback here',
                    
                      border: OutlineInputBorder(),
                    ),
                    maxLines: null, // Allows multiple lines
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                 onPressed: () {
                    setState(() {
                      // Show rating bar
 
                      _rateServices.showRatingDialog(context); 
                     
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Text('Rate'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showChangesSavedDialog(context);
              _rateServices.submitRatingAndComment( _rating,  _commentController.text);

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3B52BB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}