import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/view/add.dart';
import 'package:curd_firebase/controller/provider.dart';
import 'package:curd_firebase/view/update.dart';
import 'package:curd_firebase/view/widget/wiget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference data = FirebaseFirestore.instance.collection('data');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addPage()));
          }),
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: StreamBuilder(
        stream: data.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data?.docs.isEmpty == true) {
            return Center(child: Text("No data available"));
          }

          return Consumer<FirebaseProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: snapshot.data?.docs.length ?? 0,
              itemBuilder: (context, index) {
                final data = snapshot.data?.docs[index];
                final docId = data?.id;
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdatePAge(
                                      id: docId,
                                        title: data?['title'],
                                        subtitle: data?['subtitle'])));
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            value.deleteData(docId!);
                            showSnackBar(message: "data deleted", context: context);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                  title: Text(data?['title'] ?? 'No title'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}