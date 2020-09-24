import 'package:flutter/material.dart';

import '../services/sizes/sizeConfig.dart';

class UnderlineTextField extends StatelessWidget {
  const UnderlineTextField({
    Key key,
    @required this.nameNode,
    @required this.text,
  }) : super(key: key);
  final String text;
  final FocusNode nameNode;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      focusNode: nameNode,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF8181),
          ),
        ),
      ),
    );
  }
}

class UnderlineTextFieldDropBox extends StatelessWidget {
  const UnderlineTextFieldDropBox({
    Key key,
    @required this.nameNode,
    @required this.text,
    @required this.items,
  }) : super(key: key);
  final String text;
  final FocusNode nameNode;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      focusNode: nameNode,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF8181),
          ),
        ),
        suffixIconConstraints:
            BoxConstraints(maxHeight: getProportionateScreenHeight(38)),
        suffixIcon: Container(
          decoration: BoxDecoration(
            color: Color(0xFFCCCCCC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: DropdownButton(
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.white,
              dropdownColor: Color(0xFFCCCCCC),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (newVal) {},
            ),
          ),
        ),
      ),
    );
  }
}

class UnderlineTextFieldWithButton extends StatelessWidget {
  const UnderlineTextFieldWithButton({
    Key key,
    @required this.nameNode,
    @required this.text,
    @required this.press,
    @required this.subText,
  }) : super(key: key);
  final String text;
  final Function press;
  final FocusNode nameNode;
  final String subText;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      focusNode: nameNode,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF8181),
          ),
        ),
        suffixIconConstraints:
            BoxConstraints(maxHeight: getProportionateScreenHeight(32)),
        suffixIcon: MaterialButton(
          elevation: 0,
          color: Color(0xFFCCCCCC),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: press,
          child: Text(
            subText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
