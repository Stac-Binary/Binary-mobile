import 'package:binary_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class BloodBenefit extends StatefulWidget {
  @override
  _BloodBenefitState createState() => _BloodBenefitState();
}

class _BloodBenefitState extends State<BloodBenefit> {
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
          "헌혈 혜택",
          style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack),
        ),
      ),

    );
  }
}
