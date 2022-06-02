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

  Widget detail = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Row(
            children: [
              const Text("Saving Plans",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(),
              ),
              Container(
                  )
            ],
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
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.calendar_today), // <-- Icon
                          Text("single goal", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.calendar_today_outlined), // <-- Icon
                          Text("365 days",  style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.calendar_month), // <-- Icon
                          Text("12 month", style: TextStyle(fontSize: 13)), // <-- Text
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
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
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
        )
      ],
    ),
  );
  
  List<Widget> widget_options = [];

  void init_widgets() {
    widget_options.add(detail);
  }

  @override
  void initState() {
    super.initState();
    init_widgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ))),
      body: Center(
        child: widget_options.elementAt(_selected_index),
      ),
    );
  }
}