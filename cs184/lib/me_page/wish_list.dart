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
          title: Text(
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30,
                            )))
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
