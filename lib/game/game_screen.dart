import 'package:flutter/material.dart';
import 'package:numbored/services/auth.dart';
import 'package:numbored/shared/botom_nav.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:numbored/shared/utils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class NumInput {
  int number = 0;
}

class NumInputList {}

class _GameScreenState extends State<GameScreen> {
  int randomNumber = AppUtil.generateRandomNumber();

  List<List<int>> gridState = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20],
  ];

  //final TextEditingController _controller = TextEditingController();

  Widget _buildGridItems(BuildContext context, int index) {
    //int gridStateLength = gridState.length;
    int x, y = 0;
    x = (index / 5).floor();
    y = (index % 5);

    //print("$index, $x, $y");
    return GestureDetector(
      onTap: () => {},
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Center(
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final trimVal = value.trim();
                if (trimVal != "" && AppUtil.isNumeric(trimVal)) {
                  setState(() {
                    gridState[x][y] = int.parse(value);
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(gridState);
    return Scaffold(
      appBar: AppBar(title: const Text("Numero")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthService().signOut();
          // setState(() {
          //   randomNumber = AppUtil.generateRandomNumber();
          // });
        },
        child: const Icon(Icons.refresh),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                randomNumber.toString(),
                style: const TextStyle(fontSize: 48, letterSpacing: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                randomNumber
                    .toString()
                    .split('')
                    .map((a) => int.parse(a))
                    .reduce((a, b) {
                  return a + b;
                }).toString(),
                style: const TextStyle(fontSize: 48, letterSpacing: 10),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0)),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: _buildGridItems,
                    itemCount: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance.collection('testing').snapshots(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (!snapshot.hasData) {
      //         return const SizedBox.shrink();
      //       }

      //       return ListView.builder(
      //           itemCount: snapshot.data?.docs.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             final docsData = snapshot.data?.docs[index];
      //             final dateTime =
      //                 (docsData?["timestamp"] as Timestamp).toDate();
      //             return ListTile(title: Text(dateTime.toString()));
      //           });
      //     }),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
