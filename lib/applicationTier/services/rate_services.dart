
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RateServices 
{

   double _currentRating = 3.0;
  // Method to get the current rating
  double get currentRating => _currentRating;

  // Method to handle rating update
  void updateRating(double rating) {
    _currentRating = rating;
    print('Rating updated: $_currentRating');
  }
    Future<void> submitRatingAndComment(double rating, String comment) async {
    try {
  
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add data to the "rates" collection
      await firestore.collection('rates').add({
        'rate': rating,
        'comments': comment,
        'timestamp': Timestamp.now(),
      });

      print('Rating and comment submitted successfully');
    } catch (error) {
      // Handle any errors that occur during submission
      print('Error submitting rating and comment: $error');
    }
  }

  /// Method to build the RatingBar widget
  Widget buildRatingBar() {
    return RatingBar.builder(
      initialRating: _currentRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        updateRating(rating);
      },
    );
  }

  // Method to show a rating dialog
  Future<void> showRatingDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rate this'),
          content: buildRatingBar(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                submitRatingAndComment(_currentRating, '');
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('save'),
            ),
          ],
        );
      },
    );
  }
}