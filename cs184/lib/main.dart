import 'package:cs184/add_page/add_page.dart';
import 'package:cs184/detail_page/detail_page.dart';
import 'package:cs184/me_page/me_page.dart';
import 'package:cs184/me_page/wish_list.dart';
import 'package:cs184/me_page/reminder.dart';
import 'package:cs184/bill_page/bill_page.dart';
import 'package:cs184/save_page/save_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'login_page/login_page.dart';
import 'login_page/sign_up_page.dart';
import 'main_page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS 184 Final Project',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/main_page': (context) => const MainPage(),
        '/detail_page': (context) => const DetailPage(),
        '/me_page': (context) => const MePage(),
        '/bill_page': (context) => const BillPage(),
        '/save_page': (context) => const SavePage(),
        '/add_page':  (context) => const AddPage(),
        '/wishlist': (context) => const WishListPage(),
        '/reminder': (context) => const ReminderPage(),
      },
    );
  }
}
