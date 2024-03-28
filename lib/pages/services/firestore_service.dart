import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a stream of a single document
  Stream<DocumentSnapshot> streamDocument(String path) {
    return _db.doc(path).snapshots();
  }

  // Get a stream of a collection
  Stream<QuerySnapshot> streamCollection(String path) {
    return _db.collection(path).snapshots();
  }

  // Get a single document
  Future<DocumentSnapshot> getDocument(String path) {
    return _db.doc(path).get();
  }

  // Get a collection
  Future<QuerySnapshot> getCollection(String path) {
    return _db.collection(path).get();
  }

  // Create or update a document
  Future<void> setData(String path, Map<String, dynamic> data) {
    return _db.doc(path).set(data, SetOptions(merge: true));
  }

  // Delete a document
  Future<void> deleteDocument(String path) {
    return _db.doc(path).delete();
  }
}
