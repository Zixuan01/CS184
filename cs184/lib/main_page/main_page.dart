import 'package:cs184/detail_page/detail_page.dart';
import 'package:cs184/me_page/me_page.dart';
import 'package:cs184/bill_page/bill_page.dart';
import 'package:cs184/save_page/save_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseReference id = FirebaseDatabase.instance
      .ref('id/${FirebaseAuth.instance.currentUser!.uid}/transaction');

  List<Widget> widgets = [];
  void tmp() async {
    var data = await id.get();
    var map = data.value as Map;

    for (var i = 0; i < map.length; i++) {
      // print(map.values.elementAt(i)['amount']);
      Widget temp = Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              map.values.elementAt(i)['type'].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              map.values.elementAt(i)['date'].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 5, bottom: 5),
                        child: Text(
                          map.values.elementAt(i)['note'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 5, bottom: 5),
                  child: Text(
                    map.values.elementAt(i)['amount'].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      );
      widgets.add(temp);
    }
    setState(() {});
  }

  @override
  void initState() {
    tmp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // id.onValue.listen((event) {
    //   String email = event.snapshot.value.toString();
    //   print(id.child("050402/amount").onValue.listen((event) {
    //     print(event.snapshot.value);
    //   }));
    // });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24, 0, 10),
              child: Text(
                "Today's Record",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    children: widgets,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 20, 10, 10),
              child: Text(
                "10 Latest Record",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: const Text(
                  "Temp",
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            FloatingActionButton(
              // shape: ShapeBo,
              backgroundColor: Colors.white,
              elevation: 0,
              onPressed: () {},
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox.fromSize(
                    size: const Size(60, 60),
                    child: ClipOval(
                      child: Material(
                        color: Color.fromARGB(114, 238, 230, 201),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DetailPage()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.insert_drive_file,
                                color: Colors.black,
                              ), // <-- Icon
                              Text(
                                "Detail",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size(60, 60),
                    child: ClipOval(
                      child: Material(
                        color: Color.fromARGB(114, 238, 230, 201),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BillPage()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.insert_drive_file), // <-- Icon
                              Text(
                                "Bill",
                                style: TextStyle(fontSize: 18),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size(60, 60),
                    child: ClipOval(
                      child: Material(
                        color: Color.fromARGB(114, 238, 230, 201),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SavePage()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.insert_drive_file), // <-- Icon
                              Text(
                                "Save",
                                style: TextStyle(fontSize: 18),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size(60, 60),
                    child: ClipOval(
                      child: Material(
                        color: Color.fromARGB(114, 238, 230, 201),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/me_page');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.insert_drive_file), // <-- Icon
                              Text(
                                "Me",
                                style: TextStyle(fontSize: 18),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
