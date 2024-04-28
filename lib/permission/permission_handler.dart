import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(Permission permission)async{
  AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
  if (build.version.sdkInt >= 30) {
    var request = await Permission.manageExternalStorage.request();
    if (request.isGranted) {
      return true;
    }else{
      return false;
    }
  }else{
    if (await permission.isGranted) {
      return true;
    }else{
      var result = await permission.request();
      if (result.isGranted) {
        return true;
      }else{
        return false;
      }
    }
  }
}

void showSnackbarPermission(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Access denied', 
    style: CustomStyles.textMediumWhite15Px)));
}