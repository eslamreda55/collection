import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

ThemeData darkTheme =
 ThemeData(
  scaffoldBackgroundColor: HexColor('#133337'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#133337'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#133337'),
    elevation: 0.0,
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor:defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 25.0,
    backgroundColor: HexColor('#133337'),
    unselectedItemColor: Colors.grey[600],
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme = 
ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:defaultColor,
    elevation: 25.0,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey[420],
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);
