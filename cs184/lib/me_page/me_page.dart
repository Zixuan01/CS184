import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
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
            width: double.infinity,
            height: 200,
            child: Container(
            alignment: Alignment(0.0, 0.5),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://idsb.tmgrup.com.tr/ly/uploads/images/2021/09/08/thumbs/871x871/142774.jpg"
                ),
                radius: 60.0,
            ),
            ),
          ),
        ),
        Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "UserName",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
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
          title: Text(
            "About Me",
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
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedItemColor: Colors.amber,
    //     elevation: 0,
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.insert_drive_file),
    //         label: 'Detail',
    //         backgroundColor: Colors.red,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.pie_chart),
    //         label: 'Statistic',
    //         backgroundColor: Colors.red,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.account_balance_wallet_rounded),
    //         label: 'Assets',
    //         backgroundColor: Colors.red,
    //       ),
    //     ],
    //     currentIndex: _selected_index,
    //     onTap: _onItemTapped,
    //   ),
    );
  }
}
