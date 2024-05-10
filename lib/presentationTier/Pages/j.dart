import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduationinterface/presentationTier/Widgets/draweradmin.dart';
import 'package:graduationinterface/presentationTier/Widgets/fadmin.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  late TextEditingController _searchController;
  Map<String, dynamic>? _deletedUser;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
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
      endDrawer: const AppDrawer2(), // Set the end drawer
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Users Accounts Management',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Users',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                // Implement search functionality here
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final users = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final userData = users[index].data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            title: Text(userData['fullname']),
                            subtitle: Text(userData['email']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Navigate to edit page for the selected user
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditUserProfilePage(userId: users[index].id),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () async {
                                    // Show confirmation dialog before deleting
                                    final confirmDelete = await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Delete User Account?'),
                                        content: Text('Are you sure you want to delete this user account?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, false),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              // Store a reference to the deleted user
                                              _deletedUser = userData;

                                              // Delete the user account
                                              await FirebaseFirestore.instance.collection('users').doc(users[index].id).delete();
                                              
                                              // Update the UI
                                              setState(() {});

                                              // Close the dialog and return true
                                              Navigator.pop(context, true);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );

                                    // Check if delete was confirmed
                                    if (confirmDelete == true) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('User ${userData['fullname']} deleted.'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () async {
                                            // Restore the deleted user
                                            if (_deletedUser != null) {
                                              await FirebaseFirestore.instance.collection('users').add(_deletedUser!);
                                              _deletedUser = null;
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      ));
                                    }
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              // Implement live user account viewing or navigation to detailed user profile
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const aFooter(),
    );
  }
}

class EditUserProfilePage extends StatefulWidget {
  final String userId;

  const EditUserProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  _EditUserProfilePageState createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  late TextEditingController _fullnameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _fullnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    // Fetch user data based on the userId and set the state
    FirebaseFirestore.instance.collection('users').doc(widget.userId).get().then((snapshot) {
      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _fullnameController.text = userData['fullname'];
          _emailController.text = userData['email'];
        });
      }
    });
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
      endDrawer: const AppDrawer2(),
      body: SingleChildScrollView( // Make the page scrollable
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/assets/noo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'User Updates',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 12),
                    Text('Fullname', style: TextStyle(color: Colors.white, fontSize: 18)), // Bigger and black text
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Fullname',
                        filled: true,
                        fillColor: Colors.grey[200]?.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: _fullnameController,
                      style: TextStyle(color: Colors.black, fontSize: 18), // Bigger and black text
                    ),
                    SizedBox(height: 20),
                    Text('Email', style: TextStyle(color: Colors.white, fontSize: 18)), // Bigger and black text
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        filled: true,
                        fillColor: Colors.grey[200]?.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: _emailController,
                      style: TextStyle(color: Colors.black, fontSize: 18), // Bigger and black text
                    ),
                    SizedBox(height: 20),
                    Text('Password', style: TextStyle(color: Colors.white, fontSize: 18)), // Bigger and black text
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter New Password',
                        filled: true,
                        fillColor: Colors.grey[200]?.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.black, fontSize: 18), // Bigger and black text
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // Your button action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004AAD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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