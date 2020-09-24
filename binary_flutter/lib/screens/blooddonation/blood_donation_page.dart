import 'package:binary_flutter/components/item_container.dart';
import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20)),
            child: Text(
              "최근 현황 내역",
              style: kNanumLight.copyWith(fontSize: 24),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, int index) {
                  return ItemContainer(
                    text: "안녕하세요 저는 황현비니예요.",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
