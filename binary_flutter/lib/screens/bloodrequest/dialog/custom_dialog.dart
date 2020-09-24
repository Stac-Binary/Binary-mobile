import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/screens/bloodrequest/bloodrequest_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/sizes/sizeConfig.dart';

class CustomDialog extends StatelessWidget {
  final PageController controller;
  final int idx;
  CustomDialog(this.controller, this.idx);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: getProportionateScreenWidth(300),
        height: getProportionateScreenHeight(370),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: Text(
                  BloodGlobal.model.hospitalName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    BloodGlobal.model.address,
                    style: TextStyle(
                      color: Color(0x77707070),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "053-0000-0000",
                    style: TextStyle(
                      color: Color(0x77707070),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(150),
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("□ 수혈 요청 중인 혈액형"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/blood_icon.svg"),
                        Container(
                          child: Row(
                            children: [1.1, 1.2, 7]
                                .map((e) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenWidth(15)),
                                      child: Text(
                                        "DEA ${e}",
                                        style: TextStyle(
                                          color: Color(0xFFDE5B5B),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(10),
              ),
              child: RoundedButton(
                press: () {
                  BloodGlobal.selectedIdx = idx;
                  controller.jumpToPage(1);
                  Navigator.pop(context);
                },
                text: "헌혈하기",
              ),
            )
          ],
        ),
      ),
    );
  }
}
