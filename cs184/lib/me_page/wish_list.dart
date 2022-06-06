import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
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
          title: const Text(
            "My Wish List",
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
                padding: const EdgeInsets.only(top: 36.0),
                child: Row(
                  children: [
                    const Text("Wish List",
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => _buildPopupDialog(context),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30,
                        )
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Add item'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Item name',
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                // setState(() {
                //   notifText = value;
                // });
              },
            )
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Price',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // setState(() {
                  //   notifText = value;
                  // });
                },
              )
            ),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
        
        },
        child: const Text("Add", style: TextStyle(fontSize: 16))
      ),
    ],
  );
}
