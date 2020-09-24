import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/text_fields.dart';
import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProfileEditSecondPage extends StatefulWidget {
  @override
  _ProfileEditSecondPageState createState() => _ProfileEditSecondPageState();
}

class _ProfileEditSecondPageState extends State<ProfileEditSecondPage> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kLightBlack,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "프로필 수정",
          style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 100),
        child: Container(
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(32),
              vertical: getProportionateScreenHeight(52),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/colde.jpg'),
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
                                  Icons.add,
                                  size: getProportionateScreenWidth(18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                UnderlineTextField(
                  controller: nameController,
                  text: "이름(실명입력)",
                  nameNode: FocusNode(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                UnderlineTextField(
                  controller: emailController,
                  text: "이메일",
                  nameNode: FocusNode(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                UnderlineTextFieldWithButton(
                  controller: addressController,
                  text: "주소",
                  nameNode: FocusNode(),
                  press: () {},
                  subText: "주소 검색",
                ),
                SizedBox(
                  height: getProportionateScreenHeight(80),
                ),
                RoundedButton(
                  press: () => Navigator.pop(context),
                  color: kPink,
                  text: "저장",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
