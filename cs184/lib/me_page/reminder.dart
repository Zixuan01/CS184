import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
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
          title: Text(
            "Reminder",
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
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  children: [
                    const Text("Daily Time",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        child:
                          Text("temp"),
                      )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 36.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Notification Text",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: Text("keep track of yo money otherwis ur gonna get ur ass kicked"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
