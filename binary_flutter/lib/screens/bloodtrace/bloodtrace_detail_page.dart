import 'package:binary_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class BloodTraceDetailPage extends StatefulWidget {
  @override
  _BloodTraceDetailPageState createState() => _BloodTraceDetailPageState();
}

class _BloodTraceDetailPageState extends State<BloodTraceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kLightBlack,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "혈액추적",
          style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack),
        ),
      ),
    );
  }
}
