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

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
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
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: const Text(
                            "temp",
                            style: TextStyle(fontSize: 40),
                          ),
                        )
                      ],
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
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: const Text(
                            "temp",
                            style: TextStyle(fontSize: 40),
                          ),
                        )
                      ],
                    ),
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
                            splashColor: Colors.green, 
                            onTap: () {
                              Navigator.of(context).pushNamed('/save_daily');
                            }, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add_sharp), // <-- Icon
                                Text("Create New Saving Plan", style: TextStyle(fontSize: 20)), // <-- Text
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
