import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/model/model.dart';

class FireStoreServices {
  CollectionReference fireStoreData =
      FirebaseFirestore.instance.collection('data');
  Future<void> AddDataFireBase(Model FirebaseData) async {
    try {
      log("${FirebaseData.title}");
      await fireStoreData.add(FirebaseData.ToFirestore());
    } catch (e) {
      log("$e");
    }
  }

  Future<void> deleteDataFireBase(String id) async {
    fireStoreData.doc(id).delete();
  }

  Future<void> updateDataFireBase(String id, Model FirebaseData) async {
    fireStoreData.doc(id).update(FirebaseData.ToFirestore());
  }
}
