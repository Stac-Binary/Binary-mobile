import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/text_fields.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:binary_flutter/screens/register/second_input/second_input_screen.dart';
import 'package:flutter/material.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<FocusNode> nodes;
  @override
  void initState() {
    nodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    nodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleIcon(),
            Column(
              children: [
                UnderlineTextField(
                  nameNode: nodes[0],
                  text: "이름 (실명 입력)",
                ),
                UnderlineTextFieldWithButton(
                  nameNode: nodes[1],
                  text: "전화번호('-'제외)",
                  press: () {},
                  subText: "인증번호 전송",
                ),
                UnderlineTextField(
                  nameNode: nodes[2],
                  text: "인증번호 입력",
                ),
                UnderlineTextFieldDropBox(
                  nameNode: nodes[3],
                  text: "생년월일(8자리 입력)",
                  items: ["남", "여"],
                ),
                UnderlineTextFieldWithButton(
                  nameNode: nodes[4],
                  text: "주소",
                  press: () {},
                  subText: "주소 검색",
                ),
              ],
            ),
            RoundedButton(
              text: "다음",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SecondInputScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
