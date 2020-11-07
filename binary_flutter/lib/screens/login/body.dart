import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/rounded_input_field.dart';
import 'package:binary_flutter/provider/login_provider.dart';
import 'package:binary_flutter/screens/register/choice/register_choice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../services/sizes/sizeConfig.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final pwController = TextEditingController();
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF6666)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/handicon.png"),
                      Text(
                        "B I N A R Y",
                        style: GoogleFonts.montserrat(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10)),
                        child: Text(
                          "I D",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ),
                      RoundedTextField(
                        filled: true,
                        hintColor: Colors.grey,
                        bold: false,
                        hintText: "아이디를 입력하세요.",
                        controller: idController,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(10)),
                        child: Text(
                          "P A S S",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ),
                      RoundedPasswordField(
                        filled: true,
                        hintColor: Colors.grey,
                        bold: false,
                        hintText: "비밀번호를 입력하세요.",
                        controller: pwController,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "비밀번호를 잊어버리셨나요?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      RoundedButton(
                        text: "로그인",
                        press: () async {
                          final id = idController.text;
                          final pw = pwController.text;
                          Provider.of<LoginProvider>(context, listen: false)
                              .dbgsignIn(id, pw);
                        },
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => RegisterChoice())),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "회원가입",
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "이 필요하신가요?",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
