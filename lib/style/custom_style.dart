import 'package:flutter/material.dart';

class CustomColors{
  static const orange = Colors.deepOrange;
  static const blue = Color(0xFF5C6BC0);
  static const black = Colors.black;
  static const white = Colors.white;
  static const grey = Colors.grey;
  static const lightGrey = Color(0xFFF5F5F5);
}

class CustomStyles{

  //roboto bold
  static TextStyle textBold = const TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 18,
    color: CustomColors.black
  );

  static TextStyle textBold15Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 15,
      color: CustomColors.black
  );

  static TextStyle textBold15PxWhite = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 15,
      color: CustomColors.white
  );

  //roboto medium
  static TextStyle textMediumBlack = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.black
  );

  static TextStyle textMediumWhite = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 15,
      color: CustomColors.white
  );

  //roboto regular
  static TextStyle textRegular = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.black
  );

  static TextStyle textRegularWhite15px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.white
  );

  //roboto regular hint text
  static TextStyle hintTextStyle = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 15,
      color: CustomColors.grey
  );

  //email
  static InputDecoration customInputDecorationEmail = InputDecoration(
      suffixIcon: const Icon(Icons.account_circle, color: CustomColors.grey),
      hintText: 'Masukan email atau username...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: CustomColors.orange
          )
      )
  );

  //password
  static InputDecoration customInputDecorationPassword = InputDecoration(
      suffixIcon: const Icon(Icons.password, color: CustomColors.grey),
      hintText: 'Masukan kata sandi...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: CustomColors.orange
          )
      )
  );


  //custom rounded button
  static RoundedRectangleBorder customRoundedButton = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
}