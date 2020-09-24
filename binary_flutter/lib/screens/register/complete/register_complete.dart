import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';

class RegisterComplete extends StatelessWidget {
  final int type;
  final List<String> strs;
  final List<String> strs2;
  RegisterComplete(this.type, this.strs, this.strs2);
  @override
  Widget build(BuildContext context) {
    print(type);
    print(strs);
    print(strs2);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (ctx) => MyApp()), (route) => false);
      });
    });
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/images/complete_register.svg"),
            Text(
              "회원가입이 완료되었습니다.",
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
