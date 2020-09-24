import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/screens/register/first_input/first_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleIcon(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(60)),
                    child: Text(
                      "용도를 선택해주세요",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ImageCard(
                        color: Color(0xFFFF8181),
                        image: SvgPicture.asset(
                          "assets/images/human_with_dog.svg",
                          color: Color(0xFFFF8181),
                        ),
                        title: "반려인",
                        selected: true,
                      ),
                      ImageCard(
                        color: Color(0xFF707070),
                        image: SvgPicture.asset(
                          "assets/images/doctor_with_dog.svg",
                          color: Color(0xFF707070),
                        ),
                        title: "반려인",
                        selected: false,
                      ),
                    ],
                  )
                ],
              ),
              RoundedButton(
                text: "다음",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => FirstInputScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
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
          image,
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class TitleIcon extends StatelessWidget {
  const TitleIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(40),
          height: getProportionateScreenWidth(40),
          child: Image.asset("assets/images/title_icon.png"),
        ),
        Text(
          "비나리",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF707070),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
