// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cs184/save_page/save_customize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  DatabaseReference id = FirebaseDatabase.instance
      .ref('id/${FirebaseAuth.instance.currentUser!.uid}/transaction');
  static double yearly_expense = 0;
  static double yearly_income = 0;
  bool flag = false;
  static List<double> exp_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  static List<double> inc_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  static List<double> bal_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

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

  void tmp_bill() async {
    var data = await id.orderByKey().get();
    var map = data.value as Map;

    for (var i = 0; i < map.length; i++) {
      if (map.values.elementAt(i)["date"].substring(0, 4) == "2022") {
        if (map.values.elementAt(i)["amount"] > 0) {
          double a = double.parse(map.values.elementAt(i)["amount"].toString());
          yearly_income += a;
          int m = int.parse(map.values.elementAt(i)["date"].substring(5, 7));
          inc_month[m - 1] += a;
        } else {
          double b = double.parse(map.values.elementAt(i)["amount"].toString());
          yearly_expense += b;
          int m = int.parse(map.values.elementAt(i)["date"].substring(5, 7));
          exp_month[m - 1] += b;
        }
      }
    }

    flag = true;
    setState(() {});
  }

  @override
  void initState() {
    yearly_expense = 0;
    yearly_income = 0;

    exp_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    inc_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    bal_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    tmp_bill();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
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
        child: Padding(
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
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text(yearly_expense.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            Text(yearly_income.toString(),
                                style: TextStyle(
                                  fontSize: 22,
                                )),
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
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  color: Colors.white,
                  child: Table(
                    border: TableBorder.symmetric(
                        outside: const BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid),
                        inside: BorderSide.none),
                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(114, 238, 230, 201)),
                          children: [
                            Text(
                              "Month",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Expense",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Income",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ]),
                      TableRow(children: [
                        Text(
                          "Jan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[0].toString()),
                        Text(inc_month[0].toString()),
                        Text((exp_month[0] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Feb",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[1].toString()),
                        Text(inc_month[1].toString()),
                        Text((exp_month[1] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Mar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[2].toString()),
                        Text(inc_month[2].toString()),
                        Text((exp_month[2] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Apr",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[3].toString()),
                        Text(inc_month[3].toString()),
                        Text((exp_month[3] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "May",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[4].toString()),
                        Text(inc_month[4].toString()),
                        Text((exp_month[4] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Jun",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[5].toString()),
                        Text(inc_month[5].toString()),
                        Text((exp_month[5] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Jul",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[6].toString()),
                        Text(inc_month[6].toString()),
                        Text((exp_month[6] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Aug",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[7].toString()),
                        Text(inc_month[7].toString()),
                        Text((exp_month[7] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Sep",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[8].toString()),
                        Text(inc_month[8].toString()),
                        Text((exp_month[8] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Oct",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[9].toString()),
                        Text(inc_month[9].toString()),
                        Text((exp_month[9] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Nov",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[10].toString()),
                        Text(inc_month[10].toString()),
                        Text((exp_month[10] + inc_month[0]).toString()),
                      ]),
                      TableRow(children: [
                        Text(
                          "Dec",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(exp_month[11].toString()),
                        Text(inc_month[11].toString()),
                        Text((exp_month[11] + inc_month[0]).toString()),
                      ]),
                    ],
                  ),
                  // )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
