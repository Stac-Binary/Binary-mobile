import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/screens/route_page.dart';
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
      home: RoutePage(),
    );
  }
}
