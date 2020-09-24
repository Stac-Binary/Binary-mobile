import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/sizes/sizeConfig.dart';

const kInputBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
  borderSide: BorderSide(color: Colors.white, width: 0.5),
);

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key key,
    @required this.hintText,
    @required this.controller,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(45),
      child: TextField(
        maxLines: 1,
        style: TextStyle(
          color: Color(0xFFFFC7C7),
          fontSize: 16,
        ),
        controller: controller,
        decoration: InputDecoration(
          filled: false,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFC7C7),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: kInputBorderStyle,
          enabledBorder: kInputBorderStyle,
          disabledBorder: kInputBorderStyle,
          focusedBorder: kInputBorderStyle,
          errorBorder: kInputBorderStyle,
          focusedErrorBorder: kInputBorderStyle,
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({
    Key key,
    @required this.hintText,
    @required this.controller,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isShow = false;
  set isShow(val) {
    setState(() {
      _isShow = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(45),
      child: TextField(
        obscureText: !_isShow,
        obscuringCharacter: "●",
        maxLines: 1,
        style: TextStyle(
          color: Color(0xFFFFC7C7),
          fontSize: 16,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
            maxWidth: getProportionateScreenWidth(30),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              isShow = !_isShow;
            },
            child: Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
              child: _isShow
                  ? SvgPicture.asset(
                      "assets/images/eyes_on.svg",
                      color: Color(0xFFFFC7C7),
                    )
                  : SvgPicture.asset(
                      "assets/images/eyes_off.svg",
                      color: Color(0xFFFFC7C7),
                    ),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFC7C7),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: kInputBorderStyle,
          enabledBorder: kInputBorderStyle,
          disabledBorder: kInputBorderStyle,
          focusedBorder: kInputBorderStyle,
          errorBorder: kInputBorderStyle,
          focusedErrorBorder: kInputBorderStyle,
        ),
      ),
    );
  }
}
