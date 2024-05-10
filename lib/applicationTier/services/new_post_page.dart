import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationinterface/presentationTier/Widgets/draweradmin.dart';
import 'package:graduationinterface/applicationTier/services/post_service.dart';
import 'package:graduationinterface/presentationTier/Widgets/fadmin.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _contentController = TextEditingController();
  final PostService _postService = PostService();
  Map<String, dynamic>? _deletedPost;

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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/assets/boo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  "What's your advice today?",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Adjusted text color to white for better visibility

                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Type your advice here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
  onPressed: () async {
    if (_contentController.text.isNotEmpty) {
      await _postService.addPost(_contentController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post added successfully!')),
      );
      _contentController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter some content.')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF004AAD), // Blue background color
  ),
  child: Text(
    'Post',
    style: TextStyle(
      fontWeight: FontWeight.bold, // Bold font
      color: Colors.white, // White text color
    ),
  ),
),

                const SizedBox(height: 20),
                Text(
                  'Previous Posts',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF004AAD)),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot document = snapshot.data!.docs[index];
                            String content = document['content'];
                            String postId = document.id;
                            return ListTile(
                              title: Text(content),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditPostPage(postId: postId),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red, // Set the color of the bin icon to red
                                    ),
                                    onPressed: () async {
                                      // Show confirmation dialog before deleting
                                      final confirmDelete = await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Delete Post?'),
                                          content: Text('Are you sure you want to delete this post?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                // Store a reference to the deleted post
                                                _deletedPost = document.data() as Map<String, dynamic>?;

                                                // Delete the post from Firestore
                                                await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('Post deleted successfully')),
                                                );
                                                Navigator.pop(context, true);
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );

                                      // Check if delete was confirmed
                                      if (confirmDelete == true) {
                                        // Do something if delete was confirmed
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Center(child: Text('No posts yet.'));
                    },
                  ),
                ),
                // Undo deletion button
                if (_deletedPost != null)
                  TextButton(
                    onPressed: () async {
                      // Restore the deleted post
                      if (_deletedPost != null) {
                        await FirebaseFirestore.instance.collection('posts').add(_deletedPost!);
                        _deletedPost = null;
                        setState(() {});
                      }
                    },
                    child: Text('Undo Deletion'),
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const aFooter(),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }
}

class EditPostPage extends StatefulWidget {
  final String postId;

  const EditPostPage({Key? key, required this.postId}) : super(key: key);

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController();

    // Fetch post data based on the postId and set the state
    FirebaseFirestore.instance.collection('posts').doc(widget.postId).get().then((snapshot) {
      if (snapshot.exists) {
        final postData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _contentController.text = postData['content'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Content'),
            TextField(
              decoration: InputDecoration(hintText: 'Enter Content', filled: true, fillColor: Colors.grey[200]),
              controller: _contentController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Update post data in Firestore
                  await FirebaseFirestore.instance.collection('posts').doc(widget.postId).update({
                    'content': _contentController.text,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Post updated successfully')));
                  Navigator.pop(context);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update post: $error')));
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
