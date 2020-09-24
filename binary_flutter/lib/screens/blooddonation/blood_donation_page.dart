import 'package:binary_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class BloodDonationPage extends StatefulWidget {
  @override
  _BloodDonationPageState createState() => _BloodDonationPageState();
}

class _BloodDonationPageState extends State<BloodDonationPage> {
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
          "헌혈 내역",
          style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack),
        ),
      ),
    );
  }
}
