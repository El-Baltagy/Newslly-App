import 'package:flutter/material.dart';

const backgroundColor = Colors.white60;
const buttonColor = Color.fromRGBO(14, 114, 236, 1);
const footerColor = Color.fromRGBO(26, 26, 26, 1);
const secondaryBackgroundColor = Color.fromRGBO(46, 46, 46, 1);


//light
const primaryColor = Colors.purple;
const primaryColor1 = Colors.purple;
const secondaryColor = Color(0xff00c6ff);

const textColor = Color(0xFF2B2B2B);
const lightgrayColor = Color(0x44948282);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF2B2B2B);
Color lightBackgroundColor = const Color(0xFFFFFFFF);
Color lightTextColor = const Color(0xFF403930);


//Dark
Color darkBackgroundColor = const Color(0xFF2B2B2B);
Color darkTextColor = const Color(0xFFF3F2FF);


//Gradients
const pinkpurple = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0XFFaa367c), Color(0XFF4a2fbd)],
);
const grayBack = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);
const grayWhite = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFFFFF), Color(0xFFF3F2FF)],
);
const buttonGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0XFF7DE7EB), Color(0XFF33BBCF)],
);
const contactGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);


//Box Shadow
BoxShadow primaryColorShadow = BoxShadow(
  color: primaryColor.withAlpha(100),
  blurRadius: 12.0,
  offset:  Offset(0.0, 0.0),
);
BoxShadow blackColorShadow = BoxShadow(
  color: Colors.black.withAlpha(100),
  blurRadius: 12.0,
  offset:  Offset(0.0, 0.0),
);
