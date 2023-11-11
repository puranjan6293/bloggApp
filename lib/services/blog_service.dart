import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pagefly/model/blog_model.dart';

class BlogService {
  final CollectionReference _blogCollectionReference =
      FirebaseFirestore.instance.collection('blogs');

  //! add blog
  Future<void> addBlog(BlogModel blogModel) async {
    return _blogCollectionReference
        .doc(blogModel.uid)
        .set(blogModel.toMap())
        .then((value) => print("Blog Added"))
        .catchError((error) => print("Failed to add blog: $error"));
  }

  //!retrive all books from firebase as a stream
  Stream<List<BlogModel>> getBlog() {
    return _blogCollectionReference
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return BlogModel.fromMap(data);
      }).toList();
    });
  }

  //!update blog by uid
  Future<void> updateBlog(BlogModel blogModel) async {
    return _blogCollectionReference
        .doc(blogModel.uid)
        .update(blogModel.toMap())
        .then((value) => print("Blog Updated"))
        .catchError((error) => print("Failed to update blog: $error"));
  }

  //!delete blog by uid
  Future<void> deleteBlog(String uid) async {
    return _blogCollectionReference
        .doc(uid)
        .delete()
        .then((value) => print("Blog Deleted"))
        .catchError((error) => print("Failed to delete blog: $error"));
  }
}
