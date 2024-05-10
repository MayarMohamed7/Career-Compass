import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');

  Future<void> addPost(String content) async {
    try {
      await postsCollection.add({
        'content': content,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error adding post: $e');
    }
  }

  updatePost(String editingPostId, String text) {}
}
