import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBarMessageRed(String title, String message){
  Get.snackbar(title, message, snackPosition: SnackPosition.TOP, 
      colorText: CustomColors.white, backgroundColor: CustomColors.red);
}

void snackBarMessageGreen(String title, String message){
  Get.snackbar(title, message, snackPosition: SnackPosition.TOP, 
      colorText: CustomColors.white, backgroundColor: CustomColors.green);
}

void alertDeleteWidget(BuildContext context, String title, String message, Widget widget){
  showDialog(
    context: context, 
    builder: (_){
      return AlertDialog(
        title: Text(title),
        titleTextStyle: CustomStyles.textBold18Px,
        content: Text(message),
        contentTextStyle: CustomStyles.textRegular13Px,
        actions: [widget],
      );
    }
  );
}