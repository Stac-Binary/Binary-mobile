import 'package:binary_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/sizes/sizeConfig.dart';

class UnderlineTextField extends StatelessWidget {
  const UnderlineTextField({
    Key key,
    @required this.nameNode,
    @required this.text,
    @required this.controller,
  }) : super(key: key);
  final String text;
  final FocusNode nameNode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      focusNode: nameNode,
      controller: controller,
      style: kNanumBold.copyWith(
        fontSize: 14,
        color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: kNanumBold.copyWith(
          fontSize: 14,
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
    this.controller,
    this.value,
    this.changed,
  }) : super(key: key);
  final String text;
  final FocusNode nameNode;
  final List<String> items;
  final TextEditingController controller;
  final String value;
  final Function changed;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.bottom,
      focusNode: nameNode,
      readOnly: text == "혈액형",
      style: kNanumBold.copyWith(
        fontSize: 14,
        color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: kNanumBold.copyWith(
          fontSize: 14,
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
              value: value,
              style:
                  kNanumBold.copyWith(color: Colors.white),
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                      onTap: () {
                        changed(e);
                      },
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
  const UnderlineTextFieldWithButton(
      {Key key,
      @required this.nameNode,
      @required this.text,
      @required this.press,
      @required this.subText,
      this.controller})
      : super(key: key);
  final String text;
  final Function press;
  final FocusNode nameNode;
  final String subText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      focusNode: nameNode,
      controller: controller,
      style: kNanumBold.copyWith(
        fontSize: 14,
        color: nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: text,
        hintStyle: kNanumBold.copyWith(
          fontSize: 14,
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
          color: kRed,
          textColor: kLightBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: press,
          child: Text(
            subText,
            style: kNanumBold.copyWith(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class UnderlinePasswordInput extends StatefulWidget {
  const UnderlinePasswordInput({
    Key key,
    @required this.nameNode,
    @required this.text,
    @required this.controller,
  }) : super(key: key);
  final String text;
  final FocusNode nameNode;
  final TextEditingController controller;
  @override
  _UnderlinePasswordInputState createState() => _UnderlinePasswordInputState();
}

class _UnderlinePasswordInputState extends State<UnderlinePasswordInput> {
  bool _isShow = false;
  set isShow(val) {
    setState(() {
      _isShow = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      focusNode: widget.nameNode,
      controller: widget.controller,
      style: kNanumBold.copyWith(
        fontSize: 14,
        color: widget.nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      obscureText: !_isShow,
      obscuringCharacter: "●",
      decoration: InputDecoration(
        hintText: widget.text,
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
                  )
                : SvgPicture.asset("assets/images/eyes_off.svg"),
          ),
        ),
        hintStyle: kNanumBold.copyWith(
          fontSize: 14,
          color:
              widget.nameNode.hasFocus ? kLightBlack : Color(0xFFCCCCCC),
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

class UnderlinePasswordInput extends StatefulWidget {
  const UnderlinePasswordInput({
    Key key,
    @required this.nameNode,
    @required this.text,
    @required this.controller,
  }) : super(key: key);
  final String text;
  final FocusNode nameNode;
  final TextEditingController controller;
  @override
  _UnderlinePasswordInputState createState() => _UnderlinePasswordInputState();
}

class _UnderlinePasswordInputState extends State<UnderlinePasswordInput> {
  bool _isShow = false;
  set isShow(val) {
    setState(() {
      _isShow = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      focusNode: widget.nameNode,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: widget.nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
      ),
      obscureText: !_isShow,
      obscuringCharacter: "●",
      decoration: InputDecoration(
        hintText: widget.text,
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
                  )
                : SvgPicture.asset("assets/images/eyes_off.svg"),
          ),
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color:
              widget.nameNode.hasFocus ? Color(0xFF727272) : Color(0xFFCCCCCC),
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
