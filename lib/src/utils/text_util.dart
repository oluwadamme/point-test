import 'package:flutter/material.dart';

TextStyle blackStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? letterSpacing,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w800,
    letterSpacing: letterSpacing,
    height: 1.3,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}

TextStyle boldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? letterSpacing,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w700,
    letterSpacing: letterSpacing,
    height: 1.3,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}

TextStyle semiBoldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? letterSpacing,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w600,
    letterSpacing: letterSpacing,
    height: 1.3,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}

TextStyle mediumStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w500,
    letterSpacing: letterSpacing,
    height: height ?? 1.2,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}

TextStyle normalStyle(double size, Color color,
    {TextDecoration? decoration, String? family, double? letterSpacing, double? height}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w400,
    letterSpacing: letterSpacing,
    height: height ?? 1.3,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}

TextStyle lightStyle(double size, Color color,
    {TextDecoration? decoration, String? family, double? letterSpacing, double? height}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w400,
    letterSpacing: letterSpacing,
    height: height ?? 1.3,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}

TextStyle italicStyle(
  double size,
  Color color,
  FontWeight fontWeight, {
  TextDecoration? decoration,
  String? family,
  double? letterSpacing,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontStyle: FontStyle.italic,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    height: 1.3,
    decoration: decoration,
    fontFamily: family ?? 'EuclidCircularA',
  );
}
