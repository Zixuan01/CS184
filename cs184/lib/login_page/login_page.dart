import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cs184/login_page/sign_up_page.dart';
import 'package:cs184/main_page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  DatabaseReference fb = FirebaseDatabase.instance.ref("id");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String username = "";
    String password = "";
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(0, 237, 10, 10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(padding: EdgeInsets.only(top: height / 6)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_box_rounded,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                        labelText: "User Name",
                        hintText: "Enter a valid email"),
                    onChanged: (value) {
                      username = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter your password"),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Colors.black,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        // await fb.update({"username": "maikeer"});
                        FocusScope.of(context).unfocus();
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: username, password: password)
                            .then((signedInUser) async {
                          Navigator.of(context).pushNamed('/main_page');
                          // print(FirebaseAuth.instance.currentUser!.uid);
                          DatabaseReference id =
                              fb.child(FirebaseAuth.instance.currentUser!.uid);
                          await id.update({"email": username});
                        }).catchError((e) {
                          print(e);

                          var snackBar = SnackBar(
                            content: Text(e.message),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child:
                        const Text("Sign Up", style: TextStyle(fontSize: 20))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
