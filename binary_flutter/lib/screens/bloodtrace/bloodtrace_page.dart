import 'package:binary_flutter/components/item_container.dart';
import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/screens/bloodtrace/bloodtrace_detail_page.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodTracePage extends StatefulWidget {
  @override
  _BloodTracePageState createState() => _BloodTracePageState();
}

class _BloodTracePageState extends State<BloodTracePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          color: kPink,
          width: SizeConfig.screenWidth,
          height: getProportionateScreenHeight(150),
        ),
        Positioned(
          child: Text(
            "혈액 추적",
            style: kNanumExtraBold.copyWith(fontSize: 24, color: kWhite),
          ),
          top: getProportionateScreenHeight(32),
          left: getProportionateScreenWidth(20),
        ),
        Positioned(
          child: Container(
            height: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, int index) {
                return ItemContainer(
                  text: "대구 달서구 00동물병원",
                  imageURL: "assets/images/healthred.png",
                  onTap: _function,
                );
              },
            ),
          ),
          top: getProportionateScreenHeight(100),
          left: 0,
          right: 0,
          bottom: 0,
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<Function> _function(){
    return Navigator.push(context, MaterialPageRoute(builder: (context) => BloodTraceDetailPage()));
  }
}
