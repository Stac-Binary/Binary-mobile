import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/screens/home/home_page.dart';
import 'package:binary_flutter/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kWhite
        )
      ),
      title: 'ASDF',
      home: HomePage(),
    );
  }
}
