import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/applicationTier/services/new_post_page.dart';
import 'package:graduationinterface/presentationTier/Pages/j.dart';
import 'package:graduationinterface/presentationTier/Widgets/draweradmin.dart';
import 'package:graduationinterface/presentationTier/Widgets/fadmin.dart';
import 'package:graduationinterface/presentationTier/widgets/footer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false, 
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
      endDrawer: const AppDrawer2(),
       body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/assets/boo.png"), 
            fit: BoxFit.cover,
          ),
        ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome Admin',
                style: TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
),

                textAlign: TextAlign.center,
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                DashboardItem(
                  title: 'User Management',
                  icon: Icons.people,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserManagementPage()),
                    );
                  },
                ),
                DashboardItem(
                  title: 'New Post',
                  icon: Icons.post_add,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPostPage()),
                    );
                  },
                ),
                // Add more dashboard items as needed
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Feedback Analysis',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004AAD), // Adjusted color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  FeedbackAnalysis(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: const aFooter(),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48.0,
                color: Color(0xFF004AAD), 
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Average Rating:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004AAD)),
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

              double ratingWidth = averageRating / maxRating * 200; 

              return Row(
                children: [
                  Text(
                    averageRating.toStringAsFixed(2),
                    style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), 
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
                style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)),
              );
            }
          },
        ),
        SizedBox(height: 10),
        Text('Total Feedbacks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004AAD))), // Adjusted color
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
                    style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), // Adjusted color
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
                style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), // Adjusted color
              );
            }
          },
        ),
        SizedBox(height: 10),
        Text('Positive Feedbacks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004AAD))), // Adjusted color
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
                    style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), // Adjusted color
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
                style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), // Adjusted color
              );
            }
          },
        ),
        SizedBox(height: 10),
        Text('Negative Feedbacks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004AAD))), // Adjusted color
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
                    style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), // Adjusted color
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
                style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)), // Adjusted color
              );
            }
          },
        ),
      ],
    );
  }
}
