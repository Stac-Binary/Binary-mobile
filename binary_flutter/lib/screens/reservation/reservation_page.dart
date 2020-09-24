import 'package:binary_flutter/components/item_container.dart';
import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage>
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
            "헌혈 예약 내역",
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
              itemCount: 5,
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

  Future<void> _function() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("예약 정보"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '대구 달서구 00동물병원',
                  style: kNanumExtraBold.copyWith(fontSize: 24),
                ),
                SizedBox(height: getProportionateScreenHeight(8),),
                Text('달서구 장기동 123-4', style: kNanumExtraBold.copyWith(fontSize: 16)),
                SizedBox(height: getProportionateScreenHeight(8),),
                Text('053-000-0000', style: kNanumExtraBold.copyWith(fontSize: 16)),
                SizedBox(height: getProportionateScreenHeight(10),),
                Row(
                  children: [
                    Image.asset('assets/images/bloodred.png', height: 32, width: 32,),
                    SizedBox(width: getProportionateScreenWidth(16),),
                    Text(
                      "DEA 1.1",
                      style: kNanumExtraBold.copyWith(
                          fontSize: 32,
                          color: kRed,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10),),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/colde.jpg'),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Text(
                      "풍원이",
                      style: kNanumExtraBold.copyWith(
                          fontSize: 24,
                          color: kGrey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('확인', style: kNanumBold.copyWith(color: kRed, fontSize: 20),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
