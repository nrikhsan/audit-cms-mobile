import 'package:flutter/material.dart';

class CustomColors{
  static const orange = Color(0xFFFF7043);
  static const red = Color(0xFFE03131);
  static const blue = Color(0xFF5C6BC0);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;
  static const grey = Color(0xFF818181);
  static const lightGrey = Color(0xFFD5D5D5);
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

  static TextStyle textBold13Px = const TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 13,
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

  static TextStyle textMediumBlack13Px = const TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 13,
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

  static TextStyle textRegular15Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.black
  );

  static TextStyle textRegularGrey = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.grey
  );

  static TextStyle textRegularBlue = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.blue
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

  static TextStyle hintTextStyle13Px = const TextStyle(
      fontFamily: 'RobotoRegular',
      fontSize: 13,
      color: CustomColors.grey
  );

  //text field uraian temuan LHA
  static InputDecoration customInputDecorationUraianTemuanLHA = InputDecoration(
      hintText: 'Masukan uraian temuan...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //text field rekomendasi sementara
  static InputDecoration customInputTemporaryRecommendation = InputDecoration(
      hintText: 'Rekomendasi sementara...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //text field rekomendasi sementara
  static InputDecoration customInputPermanentRecommendation = InputDecoration(
      hintText: 'Rekomendasi permanen...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //text field recommendation or suggestion
  static InputDecoration customInputRecommendationOrSuggestion = InputDecoration(
      hintText: 'Rekomendasi/saran...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //text field penelusuran
  static InputDecoration customInputDecorationSearch = InputDecoration(
      hintText: 'Input tanggal...',
      suffixIcon: Icon(Icons.date_range_rounded, size: 25, color: CustomColors.grey),
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //text field start date
  static InputDecoration customInputDecorationStartDate = InputDecoration(
      hintText: 'Mulai dari...',
      suffixIcon: Icon(Icons.date_range_rounded, size: 20, color: CustomColors.grey),
      hintStyle: CustomStyles.hintTextStyle13Px,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //text field end date
  static InputDecoration customInputDecorationEndDate = InputDecoration(
      hintText: 'Sampai dengan...',
      suffixIcon: Icon(Icons.date_range_rounded, size: 20, color: CustomColors.grey),
      hintStyle: CustomStyles.hintTextStyle13Px,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.grey
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      )
  );

  //email
  static InputDecoration customInputDecorationEmail = InputDecoration(
      suffixIcon: const Icon(Icons.account_circle, color: CustomColors.grey),
      hintText: 'Masukan email atau username...',
      hintStyle: CustomStyles.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
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
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: CustomColors.blue
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
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