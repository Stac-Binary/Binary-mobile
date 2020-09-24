import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/text_fields.dart';
import 'package:binary_flutter/screens/dogs/third_screen/dog_register_third.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/sizes/sizeConfig.dart';

class Body extends StatefulWidget {
  final String id;
  Body(this.id);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String value = "1.1";
  TextEditingController DEAController;
  TextEditingController nameController;
  TextEditingController breedController;
  TextEditingController weightController;

  @override
  void initState() {
    nameController = TextEditingController();
    breedController = TextEditingController();
    weightController = TextEditingController();
    DEAController = TextEditingController()..text = "DEA 1.1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TitleIcon(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          child: SvgPicture.asset("assets/images/dogs.svg"),
                          radius: getProportionateScreenWidth(36),
                          backgroundColor: Color(0xFFFF8181),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x30000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.edit,
                                size: getProportionateScreenWidth(18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    child: UnderlineTextField(
                      controller: nameController,
                      text: "이름",
                      nameNode: FocusNode(),
                    ),
                  ),
                ],
              ),
              UnderlineTextField(
                controller: breedController,
                text: "견종",
                nameNode: FocusNode(),
              ),
              UnderlineTextField(
                controller: weightController,
                text: "몸무게",
                nameNode: FocusNode(),
              ),
              UnderlineTextFieldDropBox(
                controller: DEAController,
                text: "혈액형",
                nameNode: FocusNode(),
                value: value,
                items: ["1.1", "1.2", "3", "4", "5", "7"],
                changed: (val) {
                  setState(() {
                    value = val;
                    DEAController.text = "DEA $value";
                  });
                },
              ),
            ],
          ),
          RoundedButton(
            text: "다음",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => DogRegisterThird(
                      id: widget.id,
                      name: nameController.text,
                      breed: breedController.text,
                      weight: weightController.text,
                      dea: value),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
