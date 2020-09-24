import 'package:flutter/material.dart';

import 'body.dart';

class SecondInputScreen extends StatelessWidget {
  final int type;
  final List<String> strs;

  SecondInputScreen({this.type, this.strs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(type, strs),
    );
  }
}
