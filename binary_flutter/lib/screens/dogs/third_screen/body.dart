import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:flutter/material.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
      child: Column(
        children: [
          TitleIcon(),
          Text("설정을 통해 강아지를 더 추가해보세요"),
          ImageFlexCard(
            image: Image.asset(
              "assets/images/puppy_preview.png",
              fit: BoxFit.fill,
            ),
            title: "풍월이",
            selected: false,
          ),
          RoundedButton(
            text: "다음",
            press: () {},
          )
        ],
      ),
    );
  }
}

class ImageFlexCard extends StatelessWidget {
  const ImageFlexCard({
    Key key,
    this.image,
    this.title,
    this.color,
    this.selected,
  }) : super(key: key);
  final Widget image;
  final String title;
  final Color color;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(135),
      height: getProportionateScreenHeight(200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: selected
            ? Border.all(
                color: color,
                width: 2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Color(0x30000000),
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 2, child: image),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
