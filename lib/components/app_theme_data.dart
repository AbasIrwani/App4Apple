import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var mainTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff7f7f7),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xfff7f7f7),
      shadowColor: Colors.cyan,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      titleTextStyle: TextStyle(
          fontFamily: "IBMPlexSansArabic",
          fontSize: 24,
          color: Colors.cyan[900],
          fontWeight: FontWeight.w600),
    ));
var darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff1E1F20),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff1E1F20),
      shadowColor: Colors.grey.shade400,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
    ));
