import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

getTitleTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: 'cairo',
    color: color ?? AppColors.primaryColor,
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

getBodyTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: 'cairo',
    color: color ?? AppColors.textColor,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

getSmallTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: 'cairo',
    color: color ?? AppColors.accentColor,
    fontSize: fontSize ?? 14,
  );
}
