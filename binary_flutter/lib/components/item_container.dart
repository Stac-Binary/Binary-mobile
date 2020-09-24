import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final String text;

  const ItemContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(12),
      ),
      child: Container(
        height: getProportionateScreenHeight(70),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 0),
              )
            ]),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(10)),
                child: Image.asset('assets/images/bloodred.png')),
            Container(
              height: getProportionateScreenHeight(60),
              width: getProportionateScreenWidth(2),
              color: kPink,
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              text,
              style: kNanumLight.copyWith(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
