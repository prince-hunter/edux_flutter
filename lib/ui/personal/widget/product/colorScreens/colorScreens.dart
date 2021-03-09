import 'package:flutter/material.dart';

class ThemeColor {
  static final Color primaryColor = Color(0xFFF1e2228);
  static final Color secondaryColor = Color(0xFFF2b3038);
  static final Color accentColor = Color(0xFFFff672d);
  static final Color fontColor = Color(0xFFF1f94aa);
}

class ThemeStyle {

  static final TextStyle homeTitle = TextStyle(
      color: ThemeColor.fontColor,
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  static final TextStyle productInfo = TextStyle(
      color: ThemeColor.accentColor,
      fontSize: 25,
      fontWeight: FontWeight.bold
  );

  static final TextStyle productTitle = TextStyle(
    color: ThemeColor.fontColor,
    fontSize: 15,
  );

  static final TextStyle productDetailTitle = TextStyle(
      color: ThemeColor.fontColor,
      fontSize: 23,
      fontWeight: FontWeight.bold
  );

  static final TextStyle productDetailPrice = TextStyle(
      color: Colors.white,
      fontSize: 16
  );

  static final TextStyle productDetailDescription = TextStyle(
      color: Colors.grey[700],
      height: 1.5
  );

  static final TextStyle productLargeButton = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold
  );

  static final TextStyle footerTile = TextStyle(
      color: ThemeColor.fontColor,
      fontSize: 14,
      height: 1.3
  );

}