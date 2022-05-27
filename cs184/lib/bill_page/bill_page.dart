// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const Text(
                    "Yearly Balance",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: const [
                        Text(
                          "Expense",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "Income",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
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
              const Text("Bill Statement",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      )))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              color: Colors.white,
              child: Table(
                // border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid)),
                // border: TableBorder.all(width: 1.0, color: Colors.black),
                border: TableBorder.symmetric(
                  outside: const BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                  inside: BorderSide.none
                ),
              
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color.fromARGB(114, 238, 230, 201)),
                    
                    children: [
                    Text("Month", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Expense", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Income", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Balance", style: TextStyle(fontWeight: FontWeight.bold),),
                  ]),
                  TableRow(children: [
                    Text("Jan", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Feb", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Mar", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Apr", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("May", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Jun", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Jul", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Aug", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Sep", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Oct", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Nov", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                  TableRow(children: [
                    Text("Dec", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("temp"),
                    Text("temp"),
                    Text("temp"),
                  ]),
                ],
        ),
      // )
          ),
        )
      ],
    ),
  );

  List<Widget> widget_options = [];

  void init_widgets() {
    widget_options.add(detail);
    // widget_options.add(statictic);
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
          // centerTitle: false,
          title: Text(
            "${DateFormat.y().format(DateTime.now())} Bill",
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
        child: widget_options.elementAt(_selected_index),
      ),
    );
  }
}
