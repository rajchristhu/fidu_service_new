import 'package:cloud_firestore/cloud_firestore.dart';
import '../../res/strings/Strings.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getDataCollection(String path) {
    return _db.collection(path).get().then((value) => value);
  }

  Stream<QuerySnapshot> streamDataCollection(String path) {
    return _db.collection(path).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id, String path) {
    return _db.collection(path).doc(id).get();
  }

  Future<void> removeDocument(String id, String path) {
    return _db.collection(path).doc(id).delete();
  }

  Future<DocumentReference> addDocument(dynamic data, String path) {
    return _db.collection(path).add(data);
  }

  Future<void> updateDocument(dynamic data, String id, String path) {
    return _db.collection(path).doc(id).update(data);
  }
}
