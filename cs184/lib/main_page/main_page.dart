import 'package:cs184/detail_page/detail_page.dart';
import 'package:cs184/me_page/me_page.dart';
import 'package:cs184/bill_page/bill_page.dart';
import 'package:cs184/save_page/save_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
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
                child: const Text(
                  "Temp",
                  style: TextStyle(fontSize: 36),
                ),
              ),
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
