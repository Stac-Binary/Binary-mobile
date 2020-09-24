import 'package:binary_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class AppInformation extends StatefulWidget {
  @override
  _AppInformationState createState() => _AppInformationState();
}

class _AppInformationState extends State<AppInformation> {
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
          "앱 정보",
          style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack),
        ),
      ),
    );
  }
}
