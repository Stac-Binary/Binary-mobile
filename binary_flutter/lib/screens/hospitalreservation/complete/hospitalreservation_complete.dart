import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';

class FinishBlood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => MyApp()), (r) => false);
      });
    });
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/images/human_with_dog.svg"),
            Text(
              "예약이 완료되었습니다",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF707070),
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
