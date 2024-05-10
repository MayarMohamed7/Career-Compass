
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RateServices 
{
  double _currentRating = 3.0;

  // Method to get the current rating
  double get currentRating => _currentRating;

  // Method to handle rating update
  void updateRating(double rating, Function(double) onRatingUpdate) {
    _currentRating = rating;
    print('Rating updated: $_currentRating');
    onRatingUpdate(_currentRating);
  }

  /// Method to build the RatingBar widget
  Widget buildRatingBar(Function(double) onRatingUpdate) {
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
        updateRating(rating, onRatingUpdate);
      },
    );
  }

  Future<void> submitRatingAndComment(double rating, String comment) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get current user ID (assuming you have a way to get it)
      String userId = ''; // Provide the user ID here

      // Add data to the "feedback" collection
      await firestore.collection('feedback').add({
        'userId': userId,
        'rating': rating,
        'feedback': comment,
        'timestamp': Timestamp.now(),
      });

      print('Rating and comment submitted successfully');
    } catch (error) {
      // Handle any errors that occur during submission
      print('Error submitting rating and comment: $error');
    }
  }
}
