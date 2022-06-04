import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
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
                            onTap: () {
                            }, 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.monetization_on), // <-- Icon
                                Text("Cash", style: TextStyle(fontSize: 13)), // <-- Text
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
                            onTap: () {
                            }, 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add_card), // <-- Icon
                                Text("Debit Card",  style: TextStyle(fontSize: 13)), // <-- Text
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
                            onTap: () {
                            }, 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.card_giftcard), // <-- Icon
                                Text("Gift Card", style: TextStyle(fontSize: 13)), // <-- Text
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
                            onTap: () {

                            }, 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.credit_card), // <-- Icon
                                Text("Credit Card",  style: TextStyle(fontSize: 13)), // <-- Text
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
                    const Text("Balance",
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
                    const Text("Account Name",
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
                    const Text("Note:",
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
        ),
      ),
    );
  }
}
