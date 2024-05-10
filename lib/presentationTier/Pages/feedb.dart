import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/presentationTier/Widgets/draweradmin.dart';
import 'package:graduationinterface/presentationTier/Widgets/fadmin.dart';

class AdminFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Matches the color from the configuration page
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/NiceJob.png', // Using the same image asset from the configuration page
              height: 140,
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer2(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/assets/boo.png'), // Using the same background image from the configuration page
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Feedback Analysis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Adjusted text color to white for better visibility
            ),
            SizedBox(height: 20),
            Expanded(
              child: FeedbackDataTable(),
            ),
            SizedBox(height: 20),
            FeedbackAnalysis(),
          ],
        ),
      ),
      bottomNavigationBar: const aFooter(),
    );
  }
}

class FeedbackDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 40,
              columnSpacing: 20,
              columns: [
                DataColumn(
                  label: Container(
                    width: 200,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Text(
                      'Feedback',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.grey[200],
                    ),
                    child: Text(
                      'Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Add more columns as needed
              ],
              rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return DataRow(
                  cells: [
                    DataCell(
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Text(data['feedback'] ?? 'N/A', textAlign: TextAlign.center),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: Text(data['rating'] != null ? data['rating'].toString() : 'N/A', textAlign: TextAlign.center),
                      ),
                    ),
                    // Add more cells as needed for additional columns
                  ],
                );
              }).toList(),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
class FeedbackAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF004AAD), Color(0xFFCB6CE6)], // Gradient colors
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Average Rating:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                double averageRating = 0;
                double maxRating = 5;

                snapshot.data!.docs.forEach((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  if (data['rating'] != null) {
                    averageRating += data['rating'];
                  }
                });

                if (snapshot.data!.docs.isNotEmpty) {
                  averageRating /= snapshot.data!.docs.length;
                }

                double ratingWidth = averageRating / maxRating * 200; // Adjusted width calculation

                return Row(
                  children: [
                    Text(
                      averageRating.toStringAsFixed(2),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: ratingWidth,
                      color: Colors.green, // Green color for average rating visual representation
                    ),
                  ],
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                );
              }
            },
          ),
          SizedBox(height: 10),
          Text('Total Feedbacks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                int totalFeedbacks = snapshot.data!.docs.length;
                int maxTotalFeedbacks = 100; // Adjusted maximum value

                double totalWidth = totalFeedbacks / maxTotalFeedbacks * 200; // Adjusted width calculation

                return Row(
                  children: [
                    Text(
                      totalFeedbacks.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: totalWidth,
                      color: Colors.blue, // Blue color for total feedbacks visual representation
                    ),
                  ],
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                );
              }
            },
          ),
          SizedBox(height: 10),
          Text('Positive Feedbacks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                int positiveFeedbacks = 0;

                snapshot.data!.docs.forEach((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  if (data['rating'] != null && data['rating'] >= 3) {
                    positiveFeedbacks++;
                  }
                });

                int maxPositiveFeedbacks = snapshot.data!.docs.length; // Adjusted maximum value

                double positiveWidth = positiveFeedbacks / maxPositiveFeedbacks * 200; // Adjusted width calculation

                return Row(
                  children: [
                    Text(
                      positiveFeedbacks.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: positiveWidth,
                      color: Colors.yellow, // Yellow color for positive feedbacks visual representation
                    ),
                  ],
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                );
              }
            },
          ),
          SizedBox(height: 10),
          Text('Negative Feedbacks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                int negativeFeedbacks = 0;

                snapshot.data!.docs.forEach((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  if (data['rating'] != null && data['rating'] < 3) {
                    negativeFeedbacks++;
                  }
                });

                int maxNegativeFeedbacks = snapshot.data!.docs.length; // Adjusted maximum value

                double negativeWidth = negativeFeedbacks / maxNegativeFeedbacks * 200; // Adjusted width calculation

                return Row(
                  children: [
                    Text(
                      negativeFeedbacks.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 20,
                      width: negativeWidth,
                      color: Colors.red, // Red color for negative feedbacks visual representation
                    ),
                  ],
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}