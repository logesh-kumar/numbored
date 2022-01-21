import 'package:flutter/material.dart';
import 'package:numbored/shared/botom_nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Numero")),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('testing').snapshots(),
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
          }),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
