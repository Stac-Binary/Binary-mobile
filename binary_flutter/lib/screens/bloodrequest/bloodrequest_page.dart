import 'package:flutter/material.dart';

class BloodrequestPage extends StatefulWidget {
  @override
  _BloodrequestPageState createState() => _BloodrequestPageState();
}

class _BloodrequestPageState extends State<BloodrequestPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("수혈"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
