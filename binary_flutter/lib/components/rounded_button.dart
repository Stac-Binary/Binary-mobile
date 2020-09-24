import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    this.press,
    this.color,
    this.text,
  }) : super(key: key);
  final Function press;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        elevation: 0,
        color: color ?? Color(0xFFFD7C7C),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        onPressed: press,
        disabledColor: color ?? Color(0x55FD7C7C),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
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
