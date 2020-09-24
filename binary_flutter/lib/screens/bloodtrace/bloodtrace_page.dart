import 'package:flutter/material.dart';

class BloodTracePage extends StatefulWidget {
  @override
  _BloodTracePageState createState() => _BloodTracePageState();
}

class _BloodTracePageState extends State<BloodTracePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("혈액추적"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
