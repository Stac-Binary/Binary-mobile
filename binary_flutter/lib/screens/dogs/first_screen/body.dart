import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/screens/dogs/second_screen/dog_register_second.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatelessWidget {
  final String id;
  Body(this.id);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TitleIcon(),
          ImageCard(
            selected: false,
            title: "",
            image: SvgPicture.asset(
              "assets/images/human_with_dog.svg",
              color: Color(0xFFffdede),
            ),
          ),
          Column(
            children: [
              Text(
                "회원님의 강아지를 등록해주세요.",
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              RoundedButton(
                text: "등록하기",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => DogRegisterSecond(id)));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
