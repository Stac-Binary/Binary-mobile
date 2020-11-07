import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/sizes/sizeConfig.dart';

const kInputBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
  borderSide: BorderSide(color: Colors.white, width: 0.5),
);
const kInputBorderStyle2 = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
  borderSide: BorderSide(color: Colors.grey, width: 0.5),
);

class RoundedTextField2 extends StatelessWidget {
  const RoundedTextField2({
    Key key,
    @required this.hintText,
    @required this.controller,
    @required this.node,
  }) : super(key: key);
  final FocusNode node;
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
          color: Color(0xFF707070),
          fontSize: 16,
        ),
        controller: controller,
        focusNode: node,
        decoration: InputDecoration(
          filled: false,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCCCCCC),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: kInputBorderStyle2,
          enabledBorder: kInputBorderStyle2,
          disabledBorder: kInputBorderStyle2,
          focusedBorder: kInputBorderStyle2,
          errorBorder: kInputBorderStyle2,
          focusedErrorBorder: kInputBorderStyle2,
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key key,
    @required this.hintText,
    @required this.controller,
    this.filled,
    this.hintColor,
    this.bold,
  }) : super(key: key);
  final Color hintColor;
  final bool filled;
  final bool bold;
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
          fillColor: Colors.white,
          filled: filled ?? false,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: bold ? FontWeight.bold : FontWeight.w100,
            color: hintColor ?? Color(0xFFFFC7C7),
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
    this.filled,
    this.hintColor,
    this.bold,
  }) : super(key: key);
  final Color hintColor;
  final bool filled;
  final bool bold;
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
          filled: widget.filled ?? false,
          fillColor: Colors.white,
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
            fontWeight: widget.bold ? FontWeight.bold : FontWeight.w100,
            color: widget.hintColor ?? Color(0xFFFFC7C7),
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
