import 'package:flutter/material.dart';

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
