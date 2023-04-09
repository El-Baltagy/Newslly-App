import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../color.dart';

   final lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
       // primarySwatch: primaryColor,
      iconTheme:IconThemeData(
        color: primaryColor
      ) ,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color:Colors.black ),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent,
              statusBarIconBrightness:Brightness.dark,
          systemNavigationBarColor:Colors.transparent ),
      ),
      textTheme: TextTheme(

          labelLarge: TextStyle(color: Colors.red)),
       // colorScheme: ColorScheme(background: lightBackgroundColor)
   );

   final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    backgroundColor: darkBackgroundColor,
    scaffoldBackgroundColor: const Color(0xFF00040F),
    visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color:Colors.white ),
        backgroundColor: Colors.transparent,systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:Brightness.light,systemNavigationBarColor:Colors.transparent)
      ),
    textTheme: TextTheme(
      labelLarge: TextStyle(color: darkTextColor),
    ),

  );



extension ThemeExtras on ThemeData {

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  Color get shimmerColor => brightness == Brightness.dark
      ?  Colors.white24:Colors.white24;


  Color get baseColor => brightness == Brightness.light
      ?  Colors.grey[350]!:Colors.white60;
  Color get highlightColor => brightness == Brightness.light
      ?  Colors.grey[100]!:Colors.grey[100]!;


  //
  Color get textColor1 => brightness == Brightness.light
      ?Colors.black
      : Colors.white;
  Color get textColor2 => brightness == Brightness.light
      ?  Colors.grey
      : Colors.white70;
  Color get cardCo => brightness == Brightness.dark
      ?  Colors.white10
      : lightBackgroundColor;

  Color get itemCo => brightness == Brightness.light
      ?  Colors.grey
      : Colors.white70;

  String get textTh => brightness == Brightness.dark
      ?  "Dark Mode": "Light Mode";
  IconData get iconTh => brightness == Brightness.dark
      ?   Icons.dark_mode_outlined: Icons.light_mode;
  bool get boolTh => brightness == Brightness.light
      ?   true: false;


}
