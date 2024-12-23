import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_firebase/add.dart';
import 'package:curd_firebase/function.dart';
import 'package:flutter/material.dart';

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
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
            return Center(child: Text('No data available'));
          }

          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data?.docs[index];
              final docId = data?.id;
              return ListTile(
                trailing: IconButton(
                    onPressed: () {
                      deleteDataFireBase(docId!);
                    },
                    icon: Icon(Icons.delete)),
                title: Text(data?['title'] ?? 'No title'),
              );
            },
          );
        },
      ),
    );
  }

  void deleteData(String id) async {
    CollectionReference data = FirebaseFirestore.instance.collection('data');

    await data.doc(id).delete();
  }
}
