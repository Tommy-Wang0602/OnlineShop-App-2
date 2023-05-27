import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF843367);
const kSecondaryColor = Color(0xFF022238);
const kThirdColor = Color(0xFFFFDCBC);
const kLightBackground = Color(0xFFE8F6Fb);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;

class AppTheme {
  static const kBigTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static final kBodyText = TextStyle(color: Colors.grey.shade500, fontSize: 12);
  static const kHeadingOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const kSeeAllText = TextStyle(color: kPrimaryColor);
  static const kCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
