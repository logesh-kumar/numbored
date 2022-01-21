import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => FirebaseFirestore.instance
              .collection("testing")
              .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('testing').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }

              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final docsData = snapshot.data?.docs[index];
                    final dateTime =
                        (docsData?["timestamp"] as Timestamp).toDate();
                    return ListTile(title: Text(dateTime.toString()));
                  });
            }));
  }
}
