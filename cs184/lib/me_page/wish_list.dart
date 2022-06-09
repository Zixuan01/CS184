import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int cnt = 0;
String name = "";
int price = 0;
DatabaseReference wish = FirebaseDatabase.instance
    .ref('id/${FirebaseAuth.instance.currentUser!.uid}/wish');

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

  void get_count() async {
    var data = await wish.get();
    // var map = data.value as Map;
    if (data.exists) {
      var map = data.value as List;
      cnt = map.length;
    } else {
      cnt = 1;
    }
  }

  List<Widget> wishes = [];
  void tmp() async {
    var data = await wish.get();
    if (data.exists) {
      var map = data.value as List;
      for (int i = 1; i < map.length; i++) {
        // print(map.values.elementAt(i)['amount']);
        // print(map[i].runtimeType);
        Widget temp = Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  map[i]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, top: 5, bottom: 5),
                            child: Text(
                              "Price: ${map[i]['price']}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))
                ])));

        // if (DateTime.parse(map[i]['end']).isBefore(DateTime.now())) {
        //   done.add(temp);
        // } else {
        wishes.add(temp);
        // }
      }
      setState(() {});
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    get_count();
    tmp();
    super.initState();
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
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
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
                                builder: (BuildContext context) =>
                                    _buildPopupDialog(context),
                              );
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
                        itemCount: wishes.length,
                        itemBuilder: (context, index) {
                          return wishes[index];
                        },
                      ),
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
                  name = value;
                  // setState(() {
                  //   notifText = value;
                  // });
                },
              )),
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
                  price = int.parse(value);
                  // setState(() {
                  //   notifText = value;
                  // });
                },
              )),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () async {
            DatabaseReference count = wish.child(cnt.toString());

            await count.update({
              "name": name.toString(),
              "price": price,
            });

            Navigator.of(context).pushNamed('/main_page');
          },
          child: const Text("Add", style: TextStyle(fontSize: 16))),
    ],
  );
}
