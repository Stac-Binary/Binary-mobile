import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/screens/register/first_input/first_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selected = 0;
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 0;
                          });
                        },
                        child: ImageCard(
                          color: selected == 0
                              ? Color(0xFFFF8181)
                              : Color(0xFF707070),
                          image: SvgPicture.asset(
                            "assets/images/human_with_dog.svg",
                            color: selected == 0
                                ? Color(0xFFFF8181)
                                : Color(0xFF707070),
                          ),
                          title: "반려인",
                          selected: selected == 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 1;
                          });
                        },
                        child: ImageCard(
                          color: selected == 1
                              ? Color(0xFFFF8181)
                              : Color(0xFF707070),
                          image: SvgPicture.asset(
                            "assets/images/doctor_with_dog.svg",
                            color: selected == 1
                                ? Color(0xFFFF8181)
                                : Color(0xFF707070),
                          ),
                          title: "병원",
                          selected: selected == 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              RoundedButton(
                text: "다음",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => FirstInputScreen(selected)));
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
      child: title == ""
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: image)
          : Column(
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
