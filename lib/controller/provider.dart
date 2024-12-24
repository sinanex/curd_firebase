import 'dart:developer';
import 'package:curd_firebase/services/services.dart';
import 'package:curd_firebase/model/model.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  TextEditingController titleCrtl = TextEditingController();
  TextEditingController subtitleCrtl = TextEditingController();
  FireStoreServices firestore = FireStoreServices();
  List<Model> data = [];
  void addData() async {
    try {
      firestore.AddDataFireBase(
          Model(subtitle: subtitleCrtl.text, title: titleCrtl.text));
      notifyListeners();
    } catch (e) {
      log("error");
    }
  }

  void deleteData(String id) async {
    firestore.deleteDataFireBase(id);
  }

  void editData(String id, Model firebaseData) async {
    firestore.updateDataFireBase(
        id, firebaseData);
  }
}
