import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rxdart/rxdart.dart';

import '../geo2/src/geo_firestore_flutter.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
GeoFirestore geoFirestore = GeoFirestore(_firestore.collection('deal'));
GeoFirestore getKadai = GeoFirestore(_firestore.collection('kadai'));
class FirebaseCrud {


  static Future<List<DocumentSnapshot<Object?>>> readHomebanner()  async {
    final queryLocation = GeoPoint(10.53825, 79.634827);
    List<DocumentSnapshot> documents = await geoFirestore.getAtLocation(queryLocation, 5,false);
    return documents;
  }
  static Future<List<DocumentSnapshot<Object?>>> readShops()  async {
    final queryLocation = GeoPoint(10.53825, 79.634827);
    List<DocumentSnapshot> documents = await getKadai.getAtLocation(queryLocation, 5,true);
    documents= documents.toSet().toList();

    documents.forEach((document) {
// print("sdjfsjdfjs");
// print(document["count"]);
    });

    return documents;
  }
// static Future<Response> deleteEmployee({
//   required String docId,
// }) async {
//   Response response = Response();
//   DocumentReference documentReferencer =
//   _Collection.doc(docId);
//
//   await documentReferencer
//       .delete()
//       .whenComplete((){
//     response.code = 200;
//     response.message = "Sucessfully Deleted Employee";
//   })
//       .catchError((e) {
//     response.code = 500;
//     response.message = e;
//   });
//
//   return response;
// }

}
//
// static Future<Response> addEmployee({
//   required String name,
//   required String position,
//   required String contactno,
// }) async {
//
//   Response response = Response();
//   DocumentReference documentReferencer =
//   _Collection.doc();
//
//   Map<String, dynamic> data = <String, dynamic>{
//     "employee_name": name,
//     "position": position,
//     "contact_no" : contactno
//   };
//
//   var result = await documentReferencer
//       .set(data)
//       .whenComplete(() {
//     response.code = 200;
//     response.message = "Sucessfully added to the database";
//   })
//       .catchError((e) {
//     response.code = 500;
//     response.message = e;
//   });
//
//   return response;
// }
//
//
//
// static Future<Response> updateEmployee({
//   required String name,
//   required String position,
//   required String contactno,
//   required String docId,
// }) async {
//   Response response = Response();
//   DocumentReference documentReferencer =
//   _Collection.doc(docId);
//
//   Map<String, dynamic> data = <String, dynamic>{
//     "employee_name": name,
//     "position": position,
//     "contact_no" : contactno
//   };
//
//   await documentReferencer
//       .update(data)
//       .whenComplete(() {
//     response.code = 200;
//     response.message = "Sucessfully updated Employee";
//   })
//       .catchError((e) {
//     response.code = 500;
//     response.message = e;
//   });
//
//   return response;
// }