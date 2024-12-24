import 'dart:developer';
import 'package:curd_firebase/services/services.dart';
import 'package:curd_firebase/model/model.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  TextEditingController titleCrtl = TextEditingController();
  TextEditingController subtitleCrtl = TextEditingController();
  FireStoreServices firestore = FireStoreServices();
  List<Model> fireStoreageList = [];
  void addData() async {
    try {
      firestore.addDataToFireBase(
          Model(subtitle: subtitleCrtl.text, title: titleCrtl.text));
    } catch (e) {
      log("error");
    }
    subtitleCrtl.clear();
    titleCrtl.clear();
    getData();
    notifyListeners();
  }

  void deleteData(String id) async {
    firestore.deleteDataFromFireBase(id);
    getData();
    notifyListeners();
  }

  void editData(String id, Model firebaseData) async {
    firestore.updateDataInFireBase(id, firebaseData);
getData();
    notifyListeners();
  }
   getData()async{
  fireStoreageList = await firestore.getDataFromFireBase();
    if(fireStoreageList.isNotEmpty){
      log("data get success");
    }
    notifyListeners();
    
   }

}
