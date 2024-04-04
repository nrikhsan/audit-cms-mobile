import 'package:flutter/material.dart';

class CustomColors{
  static const orange = Color(0xFFFF7043);
  static const red = Color(0xFFE03131);
  static const blue = Color(0xFF5C6BC0);
  static const green = Color(0xFF46BD74);
  static const black = Color(0xFF000000);
  static const black54 = Colors.black54;
  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;
  static const grey = Color(0xFF818181);
  static const lightGrey = Color(0xFFD5D5D5);
}

class CustomStyles {

  //roboto bold
  static TextStyle textBold18Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 18,
      color: CustomColors.black
  );

  static TextStyle textBold15Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 15,
      color: CustomColors.black
  );

  static TextStyle textBold13Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 13,
      color: CustomColors.black
  );

  static TextStyle textBoldGreen13Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 13,
      color: CustomColors.green
  );

  static TextStyle textBoldGrey13Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 13,
      color: CustomColors.grey
  );

  //roboto medium
  static TextStyle textMedium18Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 18,
      color: CustomColors.black
  );

  static TextStyle textMedium15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.black
  );

  static TextStyle textMediumGrey15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.grey
  );

  static TextStyle textMediumWhite15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.white
  );

  static TextStyle textMediumRed15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.red
  );

  static TextStyle textMediumWhite13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
      color: CustomColors.white
  );

  static TextStyle textMedium13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
      color: CustomColors.black
  );

  

  static TextStyle textMediumGrey13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
      color: CustomColors.grey
  );

  static TextStyle textMediumRed13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
      color: CustomColors.red
  );

  static TextStyle textMediumGreen13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
      color: CustomColors.green
  );

  static TextStyle textMediumGreen15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.green
  );

  static TextStyle textMediumOrange15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.orange
  );

   static TextStyle textMediumBlue15Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.blue
  );

  static TextStyle textMediumBlue13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
      color: CustomColors.blue
  );

  //roboto regular
  static TextStyle textRegular18Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 18,
      color: CustomColors.black
  );

  static TextStyle textRegular15Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 15,
      color: CustomColors.black
  );

  static TextStyle textRegular13Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 15,
      color: CustomColors.black
  );

  static TextStyle textRegularRed13Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 15,
      color: CustomColors.red
  );

  static TextStyle textRegularBlack5413Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 15,
      color: CustomColors.black54
  );

  static TextStyle textRegularGrey13Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 15,
      color: CustomColors.grey
  );

  static TextStyle textRegularWhite13Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.white
  );

  //custom rounded button
  static RoundedRectangleBorder customRoundedButton = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
}