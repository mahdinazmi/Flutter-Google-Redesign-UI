import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 class Styles {
  
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? darkTheme : lightTheme;
  }
}

final darkTheme = ThemeData(
  primaryColor: const Color(0xff161D29),
  backgroundColor: const Color(0xff161D29), 
  scaffoldBackgroundColor: const Color(0xff161D29),
  focusColor: const Color(0xff202733), 
  iconTheme: const IconThemeData(
    color: Colors.white
  ), 
  inputDecorationTheme: InputDecorationTheme(
  fillColor: const Color(0xff202733),
  filled: true,
  hintStyle: TextStyle(
    color: Colors.white,
    fontSize: 14. sp,
    fontWeight: FontWeight.w400,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(50),
  ),
 )
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  backgroundColor: const Color(0xFFE5E5E5),
    iconTheme: const IconThemeData(
    color: Color(0xff596A91)
  ), 
  inputDecorationTheme: InputDecorationTheme(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: const Color(0xffA4ADC1),
    fontSize: 14. sp,
    fontWeight: FontWeight.w400,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(50),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(50),
  ),
 )
);