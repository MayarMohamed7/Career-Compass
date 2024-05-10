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
  late TextEditingController _commentController;

  RateServices _rateServices = RateServices();
  CollectionReference feedbackCollection = FirebaseFirestore.instance.collection('feedback');

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate & Feedback'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Enter your feedback here',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
              SizedBox(height: 20),
              _rateServices.buildRatingBar((rating) {
                setState(() {
                  _rating = rating;
                });
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_commentController.text.isNotEmpty && _rating > 0) {
                    showChangesSavedDialog(context);
                    _rateServices.submitRatingAndComment(_rating, _commentController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please rate and provide feedback!')),
                    );
                  }
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
              SizedBox(height: 20),
              Text(
                'Previous Feedbacks:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: feedbackCollection.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                        return ListTile(
                          title: Text('Rating: ${data['rating']}'),
                          subtitle: Text('Feedback: ${data['feedback']}'),
                        );
                      }).toList(),
                    );
                  } else {
                    return SizedBox(); // Return an empty widget if snapshot has no data
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
