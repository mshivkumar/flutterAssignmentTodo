import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class AppTypography {
  static TextStyle kGilroyBoldGeneric({
    double fontSize = 16,
    Color? color = APPColors.kcBlack,
    TextDecoration? decoration = TextDecoration.none,
    TextOverflow? overflow = TextOverflow.ellipsis,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Gilroy',
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: overflow,
      );

  static TextStyle kGilroyBold20({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Gilroy',
        color: color,
      );

  static TextStyle kGilroyBold16({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Gilroy',
        color: color,
      );

  static TextStyle kGilroyBold14({
    Color? color = APPColors.kcBlack,
    double fontSize = 14,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Gilroy',
        color: color,
      );

  static TextStyle kNunitoRegular13({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoRegular14({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoSemiBold14(
          {Color? color = APPColors.kcBlack,
          FontWeight? fontWeight = FontWeight.w500}) =>
      TextStyle(
        fontSize: 14,
        fontWeight: fontWeight,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoBold9({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 9,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoBold11(
          {Color? color = APPColors.kcBlack,
          FontWeight? fontWeight = FontWeight.w700}) =>
      TextStyle(
        fontSize: 11,
        fontWeight: fontWeight,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoBold13({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoBold14({Color? color = APPColors.kcBlack}) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: color,
      );

  static TextStyle kNunitoBoldGeneric({
    double fontSize = 11,
    Color? color = APPColors.kcBlack,
    TextDecoration? decoration = TextDecoration.none,
    TextOverflow? overflow = TextOverflow.ellipsis,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
      );

  static TextStyle kNunitoSemiBoldGeneric({
    double fontSize = 14,
    Color? color = APPColors.kcBlack,
    TextDecoration? decoration = TextDecoration.none,
    TextOverflow? overflow = TextOverflow.ellipsis,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w500,
      );

  static TextStyle kNunitoGeneric({
    double fontSize = 13,
    Color? color = APPColors.kcBlack,
    TextDecoration? decoration = TextDecoration.none,
    TextOverflow? overflow = TextOverflow.ellipsis,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
      );
}
