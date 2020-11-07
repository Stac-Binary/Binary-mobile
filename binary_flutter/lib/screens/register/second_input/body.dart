import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/text_fields.dart';
import 'package:binary_flutter/screens/login/login_screen.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:binary_flutter/screens/register/complete/register_complete.dart';
import 'package:binary_flutter/services/network/fetch_register.dart';
import 'package:flutter/material.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatefulWidget {
  final int type;
  final List<String> strs;
  Body(this.type, this.strs);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<FocusNode> nodes;
  List<TextEditingController> controllers;
  bool enabled = false;
  @override
  void initState() {
    nodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    controllers = [
      TextEditingController(),
      TextEditingController()
        ..addListener(() {
          setState(() {});
        }),
      TextEditingController()
        ..addListener(() {
          setState(() {});
        }),
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
    enabled = controllers[1].text.isNotEmpty &&
        controllers[2].text.isNotEmpty &&
        controllers[1].text == controllers[2].text;
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
                    text: "아이디를 입력",
                    controller: controllers[0]),
                UnderlinePasswordInput(
                    nameNode: nodes[1],
                    text: "비밀번호 입력",
                    controller: controllers[1]),
                UnderlinePasswordInput(
                    nameNode: nodes[2],
                    text: "비밀번호 확인",
                    controller: controllers[2]),
              ],
            ),
            Column(
              children: [
                RoundedButton(
                  text: "확인",
                  press: !enabled
                      ? null
                      : () async {
                          print("ASDF");
                          enabled = false;
                          final response = await fetchRegister(
                            controllers[0].text,
                            controllers[1].text,
                            widget.strs[0],
                            widget.strs[3],
                            widget.strs[1],
                          );
                          print("ASDF");
                          print(response);
                          if (response == 200)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => RegisterComplete(
                                    controllers[0].text,
                                    widget.type,
                                    widget.strs,
                                    controllers.map((e) => e.text).toList()),
                              ),
                            );
                        },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => LoginScreen()));
                  },
                  child: Text(
                    "로그인 화면으로 돌아가기",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF707070),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
