import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              child: Container(
                color: kPink,
                width: SizeConfig.screenWidth,
                height: getProportionateScreenHeight(200),
              ),
            ),
            Positioned(
              child: CircleAvatar(
                radius: 42.0,
                backgroundImage: AssetImage(
                  'assets/images/colde.jpg',
                ),
              ),
              left: getProportionateScreenWidth(50),
              top: getProportionateScreenHeight(46),
            ),
            Positioned(
              child: getDogData("풍원이", "리트리버", "DEA 1.1"),
              right: getProportionateScreenWidth(80),
              top: getProportionateScreenHeight(50),
            ),
            Positioned(
              child: Container(
                child: Image.asset('assets/images/mainimage.png'),
              ),
              left: getProportionateScreenWidth(32),
              top: getProportionateScreenHeight(150),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(200),
        ),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: Text("안녕"),
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }

  Widget getDogData(String dogName, String dogBreed, String dogBloodType) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dogName,
            style: kNanumExtraBold.copyWith(fontSize: 24, color: kWhite),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dogBreed,
                style: kNanumBold.copyWith(fontSize: 16, color: kWhite),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(
                dogBloodType,
                style: kNanumBold.copyWith(fontSize: 16, color: kWhite),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "견종",
                style: kNanumLight.copyWith(fontSize: 12, color: kWhite),
              ),
              SizedBox(
                width: getProportionateScreenWidth(46),
              ),
              Text(
                "혈액형",
                style: kNanumLight.copyWith(fontSize: 12, color: kWhite),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
