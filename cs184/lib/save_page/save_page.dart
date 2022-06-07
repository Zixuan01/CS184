import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  int _selected_index = 0;
  static const option_style = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  DatabaseReference id = FirebaseDatabase.instance
      .ref('id/${FirebaseAuth.instance.currentUser!.uid}/save');

  List<Widget> done = [];
  List<Widget> pending = [];

  void tmp() async {
    var data = await id.get();
    var map = data.value as List;

    for (int i = 1; i < map.length; i++) {
      // print(map.values.elementAt(i)['amount']);
      print(map[i].runtimeType);
      Widget temp = Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "${map[i]['start']} to " + map[i]['end'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, top: 5, bottom: 5),
                          child: Text(
                            "Total Budget: ${map[i]['amount']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))
              ])));

      if (DateTime.parse(map[i]['end']).isBefore(DateTime.now())) {
        done.add(temp);
      } else {
        pending.add(temp);
      }
    }
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  void initState() {
    tmp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Saving Plans",
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    const Text("In Progress",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: pending.length == 0
                          ? [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    "You Have No Pending Saving Plans",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ]
                          : pending,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Row(
                  children: [
                    const Text("Done",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        children: done.length == 0
                            ? [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      "You Have No Done Saving Plans",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ]
                            : done),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox.fromSize(
                        size: Size(300, 60),
                        child: ClipRect(
                          child: Material(
                            color: Color.fromARGB(114, 238, 230, 201),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/save_daily');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add_sharp), // <-- Icon
                                  Text("Create New Saving Plan",
                                      style:
                                          TextStyle(fontSize: 20)), // <-- Text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
