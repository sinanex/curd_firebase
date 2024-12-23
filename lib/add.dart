import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/function.dart';
import 'package:curd_firebase/model.dart';
import 'package:flutter/material.dart';

class addPage extends StatelessWidget {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
  addPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: titleCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "feild is empty";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "title", border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: subtitleCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "feild is empty";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'subtitle', border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  addDataBtn(context);
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }

  void addDataBtn(BuildContext context) async {
    final data = Model(subtitle: subtitleCtrl.text, title: titleCtrl.text);
    AddDataFireBase(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("data added")));
    Navigator.pop(context);
  }
}
