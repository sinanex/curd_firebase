import 'package:curd_firebase/function.dart';
import 'package:curd_firebase/model.dart';
import 'package:flutter/material.dart';

class UpdatePAge extends StatefulWidget {
  String? title;
  String? subtitle;
  String? id;

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
   UpdatePAge({super.key,required this.title,required this.subtitle,required this.id});

  @override
  State<UpdatePAge> createState() => _UpdatePAgeState();
}

class _UpdatePAgeState extends State<UpdatePAge> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
  @override
  void initState() {
  titleCtrl = TextEditingController(text: widget.title);
  subtitleCtrl = TextEditingController(text: widget.subtitle);
    // TODO: implement initState
    super.initState();
  }
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
                    updateBtn();
                  },
                  child: Text("submit"))
          ],
        ),
      ),
    );
  }
  
  void updateBtn() {
   final data = Model(subtitle: subtitleCtrl.text,title: titleCtrl.text);
   updateDataFireBase(widget.id!, data);
   Navigator.pop(context);
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data updated")));
  }
}