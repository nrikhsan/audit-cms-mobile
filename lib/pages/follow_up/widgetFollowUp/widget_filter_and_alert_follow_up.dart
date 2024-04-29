import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/detail_follow_up.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void showFilterFollowUp(BuildContext context, TextEditingController startDateController, TextEditingController endDateController, 
TextEditingController auditorController, ControllerAuditArea controllerAuditArea){
  showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: CustomColors.white,
      context: context, 
      builder: (_){
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50
          ),
          width: double.maxFinite,
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    title: const Text('Filter data tindak lanjut'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),
                    
                    actions: [
                    IconButton(
                      onPressed: (){
                      auditorController.clear();
                      startDateController.clear();
                      endDateController.clear();
                      controllerAuditArea.resetFilterFollowUp();
                      },
                        icon: const Icon(Icons.refresh_rounded, color: CustomColors.grey, size: 25)
                      ),
                  ],
                  ),

                  const SizedBox(height: 25),


                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: auditorController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Auditor...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text('Dengan cabang', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          )
                      ),
                      child: DropdownButton(
                          iconEnabledColor: CustomColors.blue,
                          borderRadius: BorderRadius.circular(10),
                          value: controllerAuditArea.branchFollowUp.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchFollowUp.value = value;
                            print(controllerAuditArea.branchFollowUp.value);
                          }
                      ),
                    )
                ),
              )),

                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: startDateController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue
                          ),
                          onPressed: (){
                            controllerAuditArea.filterDataFollowUpAuditArea(auditorController.text, controllerAuditArea.branchFollowUp.value, startDateController.text, endDateController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
                  )
                ],
              ),
            ),
        );
      }
    );
}

void showAlertFollowUpAuditArea(BuildContext context, int? id) {
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Tindak lanjut', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Center(
              child: Column(
                children: [
                   SizedBox(
                    width: double.maxFinite,
                     child: TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                       Get.to(() => DetailFollowUpPageAuditArea(id: id!));
                      },
                      child: Text('Detail tindak lanjut', style: CustomStyles.textMediumWhite15Px)
                     ),
                   ),

                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.red
                      ),
                        onPressed: (){
                            Get.back();
                        },
                        child: Text('Kembali', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        );
      }
    );
  }

  // sudah di fixing
  void downloadFollowUpFile(String url) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'tindak_lanjut_$timestamp.pdf';
      String savePath = dir.path + "/$saveName";

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
        snakcBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
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
        snakcBarMessageRed('Gagal', 'Terjadi kesalahan saat mengunduh laporan');
      }
    }
}

showDialogPdfFileDetailFollowUp(BuildContext context, String title, String fileName) {
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final data = snapshot.data;
                    return SfPdfViewer.network(
                      headers: {'Authorization': 'Bearer $data'},
                      '${AppConstant.followUpDocument}$fileName',
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
                  downloadFollowUpFile('${AppConstant.downloadFollowUp}$fileName');
               }else{
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