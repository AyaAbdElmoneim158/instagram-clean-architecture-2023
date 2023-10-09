import 'package:flutter/material.dart';

//|> Colors --------------------------------------------------------------------
class AppColors {
  static const Color backGroundColor = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color blueColor = Color.fromRGBO(0, 149, 246, 1);
  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Colors.grey;
  static const Color darkGreyColor = Color.fromRGBO(97, 97, 97, 1);
}

//|> General Widget ------------------------------------------------------------
Widget sizeVer(double height) => SizedBox(height: height);
Widget sizeHor(double width) => SizedBox(width: width);
