import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/screens/register/choice/body.dart';
import 'package:binary_flutter/services/network/fetch_dogs.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../services/sizes/sizeConfig.dart';

class Body extends StatelessWidget {
  final String name;
  final String breed;
  final String weight;
  final String id;
  final String dea;
  Body({this.name, this.breed, this.weight, this.dea, this.id});
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
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(60)),
                child: Text(
                  "설정을 통해 강아지를 더 추가해보세요",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              ImageFlexCard(
                image: AssetImage(
                  "assets/images/colde.jpg",
                ),
                title: "풍월이",
                selected: false,
              ),
            ],
          ),
          RoundedButton(
            text: "다음",
            press: () async {
              final response =
                  await fetchDogs(id, name, breed, weight, double.parse(dea));
              if (response.data != null)
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => MyApp()),
                    (route) => false);
            },
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
  final ImageProvider image;
  final String title;
  final Color color;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(140),
      height: getProportionateScreenHeight(230),
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
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
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
