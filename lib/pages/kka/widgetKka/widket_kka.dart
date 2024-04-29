import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void showFilterKkaAuditArea(
    BuildContext context,
    TextEditingController startDateController,
    TextEditingController endDateController,
    TextEditingController auditorController,
    ControllerAuditArea controllerAuditArea) {
  showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: CustomColors.white,
      context: context,
      builder: (_) {
        return Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: CustomColors.white,
                    title: const Text('Filter data KKA'),
                    titleSpacing: 5,
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close_rounded,
                            color: CustomColors.black, size: 25)),
                    actions: [
                      IconButton(
                          onPressed: () {
                            auditorController.clear();
                            startDateController.clear();
                            endDateController.clear();
                            controllerAuditArea.resetFilterKka();
                          },
                          icon: const Icon(Icons.refresh_rounded,
                              color: CustomColors.grey, size: 25)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Dengan auditor :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                      cursorColor: CustomColors.blue,
                      controller: auditorController,
                      decoration: InputDecoration(
                          label: const Text('Auditor...'),
                          labelStyle: CustomStyles.textMediumGrey15Px,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: CustomColors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: CustomColors.grey)))),

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
                          value: controllerAuditArea.branchKka.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchKka.value = value;
                            
                          }
                      ),
                    )
                ),
              )),
                  const SizedBox(height: 20),
                  Text('Dengan tanggal :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: startDateController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon:
                            const Icon(Icons.date_range_rounded, size: 25),
                        suffixIconColor: CustomColors.grey,
                        label: const Text('Mulai dari...'),
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.grey))),
                    onTap: () async {
                      DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100),
                      );

                      if (picker != null) {
                        startDateController.text =
                            DateFormat('yyyy-MM-dd').format(picker);
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: endDateController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon:
                            const Icon(Icons.date_range_rounded, size: 25),
                        suffixIconColor: CustomColors.grey,
                        label: const Text('Sampai dengan...'),
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.grey))),
                    onTap: () async {
                      DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100),
                      );

                      if (picker != null) {
                        endDateController.text =
                            DateFormat('yyyy-MM-dd').format(picker);
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue),
                          onPressed: () {
                            controllerAuditArea.filterkkaAuditArea(
                                auditorController.text,
                                controllerAuditArea.branchKka.value,
                                startDateController.text,
                                endDateController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter',
                              style: CustomStyles.textMediumWhite15Px)))
                ],
              ),
            ));
      });
}

void showFilterKkaAuditRegion(BuildContext context, TextEditingController startDateController, TextEditingController endDateController, ControllerAuditRegion controllerAuditRegion) {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: CustomColors.white,
      context: context,
      builder: (_){
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: CustomColors.white,
                title: const Text('Filter data KKA'),
                titleSpacing: 5,
                titleTextStyle: CustomStyles.textBold18Px,
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  }, 
                  icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                ),
              ),
              
              const SizedBox(height: 25),

                TextField(
                  readOnly: true,
                  controller: startDateController,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded, size: 25),
                    suffixIconColor: CustomColors.grey,
                    label: const Text('Mulai dari...'),
                    labelStyle: CustomStyles.textMediumGrey15Px,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                      )
                    ),
                    onTap: ()async{
                      DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001), 
                        lastDate: DateTime(2100),
                      );

                      if (picker != null) {
                          startDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                      }
                    },
                  ),
                const SizedBox(height: 15),
                TextField(
                  readOnly: true,
                  controller: endDateController,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded, size: 25),
                    suffixIconColor: CustomColors.grey,
                    label: const Text('Sampai dengan...'),
                    labelStyle: CustomStyles.textMediumGrey15Px,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                      )
                    ),
                    onTap: ()async{
                      DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001), 
                        lastDate: DateTime(2100),
                      );

                      if (picker != null) {
                          endDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  Wrap(
                    children: [
                      startDateController.text.isNotEmpty || endDateController.text.isNotEmpty
                      ? SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                            ),
                              onPressed: (){
                                startDateController.clear();
                                endDateController.clear();
                                controllerAuditRegion.resetFilterKka();
                                Get.back();
                            },
                              child: Text('Reset data filter', style: CustomStyles.textMediumWhite15Px)
                          )
                        )
                      : SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue
                            ),
                              onPressed: (){
                                controllerAuditRegion.filterKka(startDateController.text, endDateController.text);
                                Get.back();
                            },
                              child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                          )
                        )
                    ]
                  )
                ],
              ),
            )
        );
      }
    );
  }

//sudah di fixing
void downloadKKaAuditArea(String url) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_kka$timestamp.xlsx';
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

// sudah di fixing
void downloadKKaAuditRegion(String url) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_kka$timestamp.xlsx';
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