import 'package:cs184/save_page/save_customize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../icon_type_mapping.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DatabaseReference id = FirebaseDatabase.instance
      .ref('id/${FirebaseAuth.instance.currentUser!.uid}/transaction');
  static List<Widget> transactions = [];
  static double expanse = 0;
  static double income = 0;
  bool flag = false;

  DatabaseReference account = FirebaseDatabase.instance
      .ref('id/${FirebaseAuth.instance.currentUser!.uid}/account');
  static List<Widget> accounts = [];
  static int total = 0;
  static int negative = 0;
  bool flag_asset = false;

  void tmp_asset() async {
    var data = await account.get();
    var map = data.value as Map;

    for (var i = 0; i < map.length; i++) {
      // positive asset
      if (map.values.elementAt(i)["balance"] > 0) {
        // int a = map.values.elementAt(i)["balance"];
        // print(map.keys.elementAt(i));
        total += 1;
      } else {
        // double b = map.values.elementAt(i)["balance"];
        negative += 1;
        total += 1;
      }
      // Icon icon;
      // if (map.keys.elementAt(i).toString() == "000000") {
      //   icon = Icon(
      //     Icons.attach_money,
      //     size: 35,
      //   );
      // } else {
      //   icon = Icon(
      //     Icons.credit_card,
      //     size: 35,
      //   );
      // }

      Icon icon = IconTypeMapping()
          .mapTypeToIcon(map.values.elementAt(i)['type'].toString());
      Widget temp = Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: icon,
                  ),
                ),
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
                              map.keys.elementAt(i).toString(),
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
                Expanded(child: Container()),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 5, bottom: 5),
                  child: Text(
                    map.values.elementAt(i)['balance'].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      );
      accounts.add(temp);
    }
    flag_asset = true;
    setState(() {});
  }

  void tmp() async {
    var data = await id.get();
    var map = data.value as Map;

    for (var i = 0; i < map.length; i++) {
      if (map.values.elementAt(i)["amount"] > 0) {
        double a = double.parse(map.values.elementAt(i)["amount"].toString());
        income += a;
      } else {
        double b = double.parse(map.values.elementAt(i)["amount"].toString());
        expanse += b;
      }
      Icon icon = IconTypeMapping()
          .mapTypeToIcon(map.values.elementAt(i)['type'].toString());
      Widget temp = Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: icon,
                  ),
                ),
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
                Expanded(child: Container()),
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
      transactions.add(temp);
    }
    flag = true;
    setState(() {});
    // setState(() {});
    // setState(() {});
  }

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
                    "Monthly Balance",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                        Text(expanse.toString(),
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
                      Text(income.toString(),
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
              const Text("Record",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        Get.toNamed('/add_page');
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      )))
            ],
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              // child: Expanded(
              //   // child: SingleChildScrollView(
              //   child: ListView(
              //     physics: const AlwaysScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     children: transactions,
              //     // ),
              //   ),
              // ),
              child: Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return transactions[index];
                  },
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );

  Widget statictic = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(children: [
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
                  "Monthly Balance",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                      Text(expanse.toString(),
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
                    Text(income.toString(),
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
    ]),
  );

  Widget asset = Padding(
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
                    "Net Asset",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Asset",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text(total.toString(),
                              style: TextStyle(
                                fontSize: 22,
                              )),
                        ],
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Negative Asset",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          negative.toString(),
                          style: TextStyle(fontSize: 22),
                        )
                      ])
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Row(
            children: [
              const Text("Account",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        Get.toNamed('/asset_page');
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      )))
            ],
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              // child: Expanded(
              //   // child: SingleChildScrollView(
              //   child: ListView(
              //     physics: const AlwaysScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     children: transactions,
              //     // ),
              //   ),
              // ),
              child: Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    return accounts[index];
                  },
                ),
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
    widget_options.add(statictic);
    widget_options.add(asset);
  }

  @override
  void initState() {
    total = 0;
    negative = 0;
    accounts = [];
    tmp_asset();
    income = 0;
    expanse = 0;
    transactions = [];
    tmp();
    init_widgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (flag == false) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "${DateFormat.yMMM().format(DateTime.now())} Account Detail",
              textAlign: TextAlign.right,
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
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            // elevation: 20,
            // type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_drive_file),
                label: 'Detail',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart),
                label: 'Statistics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Assets',
              ),
            ],
            currentIndex: _selected_index,
            onTap: _onItemTapped,
          ),
        ),
      );
    }
  }
}
