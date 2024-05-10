import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Widgets/drawer.dart';
import 'package:graduationinterface/presentationTier/utils/dialogtemp.dart';
import 'package:graduationinterface/applicationTier/services/rate_services.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/presentationTier/widgets/footer.dart';

class feedbacks extends StatefulWidget {
  @override
  _feedbacksState createState() => _feedbacksState();
}

class _feedbacksState extends State<feedbacks> {
  double _rating = 0.0;
  late TextEditingController _commentController;
  late Map<String, dynamic> _deletedFeedback;

  RateServices _rateServices = RateServices();
  CollectionReference feedbackCollection = FirebaseFirestore.instance.collection('feedback');

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _deletedFeedback = {};
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
              Center(
                child: _rateServices.buildRatingBar((rating) {
                  setState(() {
                    _rating = rating;
                  });
                }),
              ),
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
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Future<bool> _confirmDeleteFeedback(BuildContext context, Map<String, dynamic> data, String documentId) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm"),
          content: Text("Are you sure you want to delete this feedback?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    ) ?? false;
  }

  void _deleteFeedback(String documentId, Map<String, dynamic> data) async {
    try {
      _deletedFeedback = {'documentId': documentId, 'data': data};

      await feedbackCollection.doc(documentId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              _restoreDeletedFeedback();
            },
          ),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete feedback: $error')),
      );
    }
  }

  void _restoreDeletedFeedback() async {
    try {
      if (_deletedFeedback.isNotEmpty && _deletedFeedback.containsKey('documentId') && _deletedFeedback.containsKey('data')) {
        final documentId = _deletedFeedback['documentId'] as String?;
        final data = _deletedFeedback['data'] as Map<String, dynamic>?;
        if (documentId != null && data != null) {
          await feedbackCollection.doc(documentId).set(data);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Feedback restored')),
          );
          setState(() {
            _deletedFeedback.clear(); // Clear the stored deleted feedback
          });
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to restore feedback: $error')),
      );
    }
  }
}
