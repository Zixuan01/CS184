import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  DatabaseReference account = FirebaseDatabase.instance
      .ref('id/${FirebaseAuth.instance.currentUser!.uid}/account');

  String account_number = "";
  String account_type = "";
  String account_note = "";
  String balance = "";

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
              padding: const EdgeInsets.only(top: 36.0),
              child: Row(
                children: [
                  const Text("Assets",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(),
                  ),
                  Container()
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
                            onTap: () {
                              account_number = "000000";
                              account_type = "Cash";
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.monetization_on), // <-- Icon
                                Text("Cash",
                                    style: TextStyle(fontSize: 13)), // <-- Text
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
                            onTap: () {
                              account_type = "Debit";
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add_card), // <-- Icon
                                Text("Debit Card",
                                    style: TextStyle(fontSize: 13)), // <-- Text
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
                            onTap: () {
                              account_type = "Gift";
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.card_giftcard), // <-- Icon
                                Text("Gift Card",
                                    style: TextStyle(fontSize: 13)), // <-- Text
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
                            onTap: () {
                              account_type = "Credit";
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.credit_card), // <-- Icon
                                Text("Credit Card",
                                    style: TextStyle(fontSize: 12)), // <-- Text
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
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Card(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Account Number (6 digits)',
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (account_number != "000000") {
                        account_number = value;
                      }
                      //setState(() {
                      //  _amount = int.parse(value);
                      //});
                    },
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Card(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Balance',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      balance = value;
                      //setState(() {
                      //  _amount = int.parse(value);
                      //});
                    },
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Card(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Account Note',
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 2,
                    onChanged: (value) {
                      account_note = value;
                      //setState(() {
                      //  _amount = int.parse(value);
                      //});
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: SizedBox.fromSize(
                size: Size(300, 60),
                child: ClipRect(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      onTap: () async {
                        if (account_number.length == 6) {
                          DatabaseReference act_num =
                              account.child(account_number);
                          await act_num.update({
                            "balance": double.parse(balance),
                            "type": account_type,
                            "note": account_note
                          });
                        }

                        Navigator.of(context).pushNamed('/main_page');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add_sharp), // <-- Icon
                          Text("Add New Asset",
                              style: TextStyle(fontSize: 20)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
