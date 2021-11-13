import 'dart:ui';
import 'package:follower_shop/core/styles/AppColor.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const textStyle = const TextStyle(
      color:  Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: "lalezar",
      fontStyle:  FontStyle.normal,
      fontSize: 25.0
  );
  static const textStyleDetail = const TextStyle(
      color:  Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: "thin",
      fontStyle:  FontStyle.normal,
      fontSize: 18.0
  );
  static const textStyleDetail3 = const TextStyle(
      color:  Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: "thin",
      fontStyle:  FontStyle.normal,
      fontSize: 17.0
  );
  static const textStyleDetail2 = const TextStyle(
      color:  Colors.black,
      fontWeight: FontWeight.w400,
      fontStyle:  FontStyle.normal,
      fontSize: 18.0
  );
  static const textStyleDetailWhite = const TextStyle(
      color:  Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "thin",
      fontStyle:  FontStyle.normal,
      fontSize: 18.0
  );
  static const textStyleLink = const TextStyle(
      color:  AppColor.lighter_purple,
      fontWeight: FontWeight.w400,
      fontFamily: "thin",
      fontStyle:  FontStyle.normal,
      fontSize: 18.0
  );

}