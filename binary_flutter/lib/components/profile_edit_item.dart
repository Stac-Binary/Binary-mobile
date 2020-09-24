import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/screens/profileedit/profileedit_second_page.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProfileEditItem extends StatelessWidget {
  final String name;

  const ProfileEditItem({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
          vertical: getProportionateScreenHeight(10)),
      child: Container(
        height: getProportionateScreenHeight(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 36.0,
              backgroundImage: AssetImage(
                'assets/images/colde.jpg',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "박상아",
                  style: kNanumExtraBold.copyWith(fontSize: 20),
                ),
                Text(
                  "비밀번호 변경하기",
                  style: kNanumBold.copyWith(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            IconButton(
              icon: Icon(Icons.redo),
              color: kLightBlack,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileEditSecondPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
