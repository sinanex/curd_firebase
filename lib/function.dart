
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/model.dart';

CollectionReference data = FirebaseFirestore.instance.collection('data');

Future<void> AddDataFireBase(Model FirebaseData)async{
     data.add(FirebaseData.ToFirestore());
}

Future<void> deleteDataFireBase(String id)async{
  data.doc(id).delete();
}
Future<void> updateDataFireBase(String id,Model FirebaseData)async{
  data.doc(id).update(FirebaseData.ToFirestore());
}