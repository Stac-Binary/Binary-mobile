import 'package:binary_flutter/models/hospital_model.dart';
import 'package:binary_flutter/screens/bloodrequest/bloodrequest_page.dart';
import 'package:binary_flutter/screens/bloodrequest/dialog/custom_dialog.dart';
import 'package:binary_flutter/services/network/fetch_hospital.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../services/sizes/sizeConfig.dart';

class Body extends StatefulWidget {
  PageController controller;
  Body(this.controller);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<HospitalData> datas;
  TextEditingController controller;
  @override
  void initState() {
    datas = [];
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              child: Container(
                color: kPink,
                width: SizeConfig.screenWidth,
                height: getProportionateScreenHeight(120),
              ),
            ),
            Positioned(
              child: Text(
                "수혈 요청 내역",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              top: getProportionateScreenHeight(30),
              left: getProportionateScreenWidth(20),
            ),
            Positioned(
              top: getProportionateScreenHeight(85),
              child: Container(
                width: SizeConfig.screenWidth,
                child: SearchBox(
                  textController: controller,
                  onPress: () async {
                    final respones = await fetchHospital(controller.text);
                    setState(() {
                      datas = respones == null ? [] : respones.data;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemBuilder: (ctx, idx) => GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        BloodGlobal.model = datas[idx];
                        return CustomDialog(widget.controller, datas[idx].idx);
                      });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20),
                      horizontal: getProportionateScreenWidth(20)),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: getProportionateScreenHeight(60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            offset: Offset(0, 0),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ]),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Text(
                        "${datas[idx].hospitalName} ${datas[idx].address}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF707070),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: datas.length,
            ),
          ),
        )
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    @required this.textController,
    @required this.onPress,
  }) : super(key: key);

  final TextEditingController textController;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: getProportionateScreenWidth(335),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x10000000),
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
                color: Color(0xFFFAFAFA),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: textController,
                        style: TextStyle(color: Color(0xFF707070)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "지역 검색",
                          hintStyle: TextStyle(color: Color(0xFF707070)),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 0,
                      color: Color(0xFFFAFAFA),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(360),
                        onTap: onPress,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
