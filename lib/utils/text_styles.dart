import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static final TextStyle appNameTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
  );

  static final TextStyle headingTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
  );

  static final TextStyle trainingTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
    fontFamily: "NotoSans",
  );


  static final TextStyle dateTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
    fontFamily: "NotoSans",
  );

  static final TextStyle bodyTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.black87.withOpacity(0.3),
    fontFamily: "NotoSans",
  );
}