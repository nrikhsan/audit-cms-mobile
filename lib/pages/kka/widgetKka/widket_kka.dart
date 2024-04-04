import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

void showFilterKkaAuditArea(
    BuildContext context,
    TextEditingController startDateController,
    TextEditingController endDateController,
    TextEditingController auditorController,
    TextEditingController branchController,
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
                            if (auditorController.text.isNotEmpty) {
                              auditorController.clear();
                              controllerAuditArea.resetFilterKka();
                              branchController.clear();
                              startDateController.clear();
                              endDateController.clear();
                              Get.back();
                            } else if (branchController.text.isNotEmpty) {
                              auditorController.clear();
                              controllerAuditArea.resetFilterKka();
                              branchController.clear();
                              startDateController.clear();
                              endDateController.clear();
                              Get.back();
                            } else if (startDateController.text.isNotEmpty ||
                                endDateController.text.isNotEmpty) {
                              auditorController.clear();
                              controllerAuditArea.resetFilterKka();
                              branchController.clear();
                              startDateController.clear();
                              endDateController.clear();
                              Get.back();
                            } else {
                              Get.snackbar('Alert', 'Reset data filter gagal',
                                  backgroundColor: CustomColors.red,
                                  colorText: CustomColors.white,
                                  snackPosition: SnackPosition.TOP);
                            }
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
                      onChanged: (auditor) => auditorController.text = auditor,
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
                  const SizedBox(height: 20),
                  Text('Dengan cabang :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                      cursorColor: CustomColors.blue,
                      onChanged: (branch) => branchController.text = branch,
                      controller: branchController,
                      decoration: InputDecoration(
                          label: const Text('Cabang...'),
                          labelStyle: CustomStyles.textMediumGrey15Px,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: CustomColors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: CustomColors.grey)))),
                  const SizedBox(height: 20),
                  Text('Dengan tanggal :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: startDateController,
                    onChanged: (startDate) =>
                        startDateController.text = startDate,
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
                    onChanged: (endDate) => endDateController.text = endDate,
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
                                startDateController.text,
                                endDateController.text,
                                auditorController.text,
                                branchController.text);
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
                  onChanged: (startDate) => startDateController.text = startDate,
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
                  onChanged: (endDate) => endDateController.text = endDate,
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
                                controllerAuditRegion.loadKkaAuditRegion();
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
                                controllerAuditRegion.filterKkaAuditRegion(startDateController.text, endDateController.text);
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

void downloadKka(String kkaDoc) async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.storage].request();

  if (statuses[Permission.storage]!.isGranted) {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'dokumen_kka_$timestamp.xlsx';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      try {
        await Dio().download(kkaDoc, savePath,
            onReceiveProgress: (received, total) {
          if (total != -1) {
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        });
        snakcBarMessageGreen('Berhasil', 'File $saveName berhasil di unduh');
      } catch (error) {
        throw Exception(error);
      }
    }
  } else {
    snakcBarMessageRed('Gagal', 'Permintaan izin ditolak');
  }
}
