import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// sudah difixing
void downloadFileDetailBap(String url, String fileName) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      // String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = '$fileName';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
            }
          },
        );
        snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
      } catch (error) {
        if (error is DioError) {
          if (error.response != null) {
            print('Server responded with error: ${error.response!.statusCode}');
            print('Response data: ${error.response!.data}');
          } else {
            print('Dio error: $error');
          }
        } else {
          print('Error: $error');
        }
        snackBarMessageRed('Gagal', 'Terjadi kesalahan saat mengunduh laporan');
      }
    }
}

void showDialogPdfBapAuditArea(BuildContext context, String title, String url, String fileName) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: CustomColors.white,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
              width: double.maxFinite,
              height: 400,
              child: Scaffold(
                appBar: AppBar(
                  titleSpacing: 5,
                  backgroundColor: CustomColors.white,
                  title: Text(title),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: FutureBuilder(
                  future: getToken(), 
                  builder: (_, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const SpinKitCircle(color: CustomColors.blue);
                    }else{
                      final token = snapshot.data;
                      return SfPdfViewer.network(
                        headers: {'Authorization': 'Bearer $token'},
                        url,
                        pageSpacing: 0,
                    );
                    }
                  }
                )
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {
                if (await requestPermission(Permission.storage) == true) {
                  downloadFileDetailBap(url, fileName);
                } else {
                  showSnackbarPermission(context);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
}

Future<String?>getToken()async{
  return await TokenManager.getToken();
}

void showDialogPdfBapAuditRegion(BuildContext context, String title, String url, String fileName) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: CustomColors.white,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
              width: double.maxFinite,
              height: 400,
              child: Scaffold(
                appBar: AppBar(
                  titleSpacing: 5,
                  backgroundColor: CustomColors.white,
                  title: Text(title),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: FutureBuilder(
                  future: getToken(), 
                  builder: (_, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const SpinKitCircle(color: CustomColors.blue);
                    }else{
                      final token = snapshot.data;
                      return SfPdfViewer.network(
                        headers: {'Authorization': 'Bearer $token'},
                        url,
                        pageSpacing: 0,
                    );
                    }
                  }
                )
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {
                if (await requestPermission(Permission.storage) == true) {
                  downloadFileDetailBap(url, fileName);
                } else {
                  showSnackbarPermission(context);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
}

void uploadBapAuditRegion(BuildContext context, ControllerAuditRegion controllerAuditRegion, int? idBap) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: AppBar(
              title: Text('Upload BAP', style: CustomStyles.textBold18Px),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                  controllerAuditRegion.selectedFileName.value = '';
                }, icon: const Icon(Icons.close, color: CustomColors.grey, size: 25))
              ],
            ),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileBapAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.blue,
                      shape: CustomStyles.customRoundedButton
                    ),
                      onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                      ? () {
                            controllerAuditRegion.uploadBapAuditRegion(controllerAuditRegion.selectedFileName.value, idBap);
                            Get.back();
                         }
                      : null,
                      child: Text('Upload', style: CustomStyles.textMediumWhite15Px),
                    )),
                  const SizedBox(height: 15),
              ],
            ),
            
          );
        }
      );
  }

void uploadBapAuditArea(BuildContext context, ControllerAuditArea controllerAuditArea, int? idBap) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: AppBar(
              title: Text('Upload BAP', style: CustomStyles.textBold18Px),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                  controllerAuditArea.selectedFileName.value = '';
                }, icon: const Icon(Icons.close, color: CustomColors.grey, size: 25))
              ],
            ),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                Obx(() => Text(controllerAuditArea.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                TextButton(
                  onPressed: () =>
                      controllerAuditArea.pickFileBapAuditArea(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.blue,
                      shape: CustomStyles.customRoundedButton
                    ),
                      onPressed: controllerAuditArea.selectedFileName.value.isNotEmpty
                      ? () {
                            controllerAuditArea.uploadBapAuditArea(controllerAuditArea.selectedFileName.value, idBap);
                            Get.back();
                         }
                      : null,
                      child: Text('Upload', style: CustomStyles.textMediumWhite15Px),
                    )),
                  const SizedBox(height: 15),
              ],
            ),
            
          );
        }
      );
  }