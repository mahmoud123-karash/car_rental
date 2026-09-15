import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle style20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle style20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle style25 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 25,
  );
  static const TextStyle style25Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static const TextStyle style15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
  static const TextStyle style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle style16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle style17 = TextStyle(
    fontSize: 17,
    fontFamily: 'SF UI Display',
    fontWeight: FontWeight.w600,
    height: 0,
  );

  static const TextStyle style13 = TextStyle(
    color: Color(0xFFC8C7CC),
    fontSize: 13,
    fontFamily: 'SF UI Display',
    fontWeight: FontWeight.w600,
    height: 0,
  );

  static const TextStyle style14 = TextStyle(
    color: Color(0xFF868686),
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static const TextStyle style24 = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 0,
  );

  static const TextStyle style12 = TextStyle(
    color: Color(0xFF8A8A8F),
    fontSize: 12,
    fontFamily: 'SF UI Display',
    fontWeight: FontWeight.w600,
    height: 0,
    letterSpacing: 0.41,
  );

  static const TextStyle style16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 0,
  );
}
