import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/text_fields.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:binary_flutter/screens/register/second_input/second_input_screen.dart';
import 'package:flutter/material.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatefulWidget {
  final int selected;
  Body(this.selected);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<FocusNode> nodes;
  List<TextEditingController> controllers;
  String selected = "남";
  bool enabled = false;
  @override
  void initState() {
    nodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    nodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
    controllers.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    enabled = (controllers
            .map((e) => e.text.isNotEmpty)
            .where((element) => element == true)
            .toList()
            .length ==
        4);
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
                  controller: controllers[0],
                  text: "이름 (실명 입력)",
                ),
                UnderlineTextField(
                  nameNode: nodes[1],
                  controller: controllers[1],
                  text: "이메일",
                ),
                UnderlineTextFieldDropBox(
                  controller: controllers[2],
                  nameNode: nodes[2],
                  text: "생년월일(8자리 입력)",
                  items: ["남", "여"],
                  value: selected,
                  changed: (idx) {
                    setState(() {
                      selected = idx;
                    });
                  },
                ),
                UnderlineTextFieldWithButton(
                  controller: controllers[3],
                  nameNode: nodes[3],
                  text: "주소",
                  press: () {},
                  subText: "주소 검색",
                ),
              ],
            ),
            RoundedButton(
              text: "다음",
              press: !enabled
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => SecondInputScreen(
                            type: widget.selected,
                            strs: controllers.map((e) => e.text).toList(),
                          ),
                        ),
                      );
                    },
            )
          ],
        ),
      ),
    );
  }
}
