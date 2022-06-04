import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cs184/login_page/login_page.dart';
import 'package:cs184/me_page/wish_list.dart';
import 'package:cs184/me_page/reminder.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
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
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 20),
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
                          "https://idsb.tmgrup.com.tr/ly/uploads/images/2021/09/08/thumbs/871x871/142774.jpg"),
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
              Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 50.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "Accounting days: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 50.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "Number of accounts: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              // Padding(
              // //   padding: const EdgeInsets.only(top: 36.0, left: 150.0, right: 80.0),
              // padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       const Text("Accounting days:",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //       Expanded(
              //         child: Container(),
              //       ),
              //       const Text("|",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //       Expanded(
              //         child: Container(),
              //       ),
              //       const Text("Number of Accounts :",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //       Expanded(
              //         child: Container(),
              //       ),
              //     ],
              //   ),
              // ),
              // Expanded(
              //     child: Container()
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                              //  Navigator.of(context).pushNamed('/shoppinglist');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const WishListPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.auto_awesome_rounded), // <-- Icon
                                Text("Wish List",
                                    style: TextStyle(fontSize: 11)), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //   Expanded(
                    //     child: Container(),
                    //   ),
                    SizedBox.fromSize(
                      size: Size(70, 70),
                      child: ClipOval(
                        child: Material(
                          color: Color.fromARGB(114, 238, 230, 201),
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ReminderPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.edit_notifications), // <-- Icon
                                Text("Reminder",
                                    style: TextStyle(fontSize: 11)), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //   Expanded(
                    //     child: Container(),
                    //   ),
                    SizedBox.fromSize(
                      size: Size(70, 70),
                      child: ClipOval(
                        child: Material(
                          color: Color.fromARGB(114, 238, 230, 201),
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login', (Route<dynamic> route) => false);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.logout), // <-- Icon
                                Text("Logout",
                                    style: TextStyle(fontSize: 11)), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //   Expanded(
                    //     child: Container(),
                    //   ),
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
