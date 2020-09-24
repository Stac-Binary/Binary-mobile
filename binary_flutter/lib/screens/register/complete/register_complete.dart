import 'package:binary_flutter/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 1), (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => LoginScreen()),(route) => false);
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
