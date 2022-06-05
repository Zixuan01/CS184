import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../main_page/main_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DatabaseReference fb = FirebaseDatabase.instance.ref("id");

  @override
  Widget build(BuildContext context) {
    var auth = FirebaseAuth.instance;
    String username = "";
    String password = "";
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        try {
                          var newUser =
                              await auth.createUserWithEmailAndPassword(
                                  email: username, password: password);
                          if (newUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                            const snackBar = SnackBar(
                              content: Text(
                                  'You have logged in with the account you just created'),
                            );
                            // print(FirebaseAuth.instance.currentUser!.uid);
                            DatabaseReference id = fb
                                .child(FirebaseAuth.instance.currentUser!.uid);
                            await id.update({"email": username});
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } catch (e) {
                          var snackBar = SnackBar(
                            content:
                                Text("Sign up failed. Please try again later."),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
