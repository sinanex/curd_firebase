import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/model/model.dart';

class FireStoreServices {
  final CollectionReference fireStoreData =
      FirebaseFirestore.instance.collection('data');

  Future<void> addDataToFireBase(Model firebaseData) async {
    try {
      log("Adding Data: ${firebaseData.title}");
      await fireStoreData.add(firebaseData.ToFirestore());
    } catch (e) {
      log("Error Adding Data: $e");
    }
  }

  Future<void> deleteDataFromFireBase(String id) async {
    try {
      await fireStoreData.doc(id).delete();
      log("Deleted Data with ID: $id");
    } catch (e) {
      log("Error Deleting Data: $e");
    }
  }

  Future<void> updateDataInFireBase(String id, Model firebaseData) async {
    try {
      await fireStoreData.doc(id).update(firebaseData.ToFirestore());
      log("Updated Data with ID: $id");
    } catch (e) {
      log("Error Updating Data: $e");
    }
  }

  Future<List<Model>> getDataFromFireBase() async {
    try {
      final QuerySnapshot snapshot = await fireStoreData.get();
      return snapshot.docs
          .map((doc) => Model.fromFirbase(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      log("Error Fetching Data: $e");
      throw Exception("Error Fetching Data");
    }
  }
}
