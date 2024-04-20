import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/input_identification_clarification_page.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void filterClarificationAuditArea(
    BuildContext context,
    TextEditingController startDateController,
    TextEditingController endDateController,
    TextEditingController auditorController,
    ControllerAuditArea controllerAuditArea) {
  showModalBottomSheet(
      backgroundColor: CustomColors.white,
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: CustomColors.white,
                  title: const Text('Filter data klarifikasi'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  actions: [
                    IconButton(
                        onPressed: () {
                          auditorController.clear();
                          startDateController.clear();
                          endDateController.clear();
                          controllerAuditArea.resetFilterClarification();
                        },
                        icon: const Icon(Icons.refresh_rounded,
                            color: CustomColors.grey, size: 25)),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: auditorController,
                  onChanged: (auditor) => auditorController.text = auditor,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    hintText: 'Auditor...',
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.lightGrey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.lightGrey)),
                  ),
                ),
                
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
                          value: controllerAuditArea.branchCla.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchCla.value = value;
                            print(controllerAuditArea.branchCla.value);
                          }
                      ),
                    )
                ),
              )),
                const SizedBox(height: 20),
                TextField(
                  controller: startDateController,
                  onChanged: (startDate) =>
                      startDateController.text = startDate,
                  readOnly: true,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    hintText: 'Mulai dari...',
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.lightGrey, size: 25),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.lightGrey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.lightGrey)),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));

                    if (picked != null) {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: endDateController,
                  onChanged: (endDate) => endDateController.text = endDate,
                  readOnly: true,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    hintText: 'Sampai dengan...',
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.lightGrey, size: 25),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.lightGrey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.lightGrey)),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));

                    if (picked != null) {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
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
                          controllerAuditArea.filterClarificationAuditArea(
                              auditorController.text,
                              controllerAuditArea.branchCla.value,
                              startDateController.text,
                              endDateController.text);
                          Get.back();
                        },
                        child: Text('Simpan data filter',
                            style: CustomStyles.textMediumWhite15Px)))
              ],
            ),
          ),
        );
      });
}


void showBottomSheetFilterClarificationAuditRegion(
    BuildContext context,
    TextEditingController startDateController,
    TextEditingController endDateController,
    ControllerAuditRegion controllerAuditRegion) {
  showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              left: 15,
              right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: const Text('Filter data jadwal'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                ),
                const SizedBox(height: 10),
                TextField(
                  readOnly: true,
                  controller: startDateController,
                  onChanged: (startDate) =>
                      startDateController.text = startDate,
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
                          borderSide:
                              const BorderSide(color: CustomColors.grey))),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));
                    if (picked != null) {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  readOnly: true,
                  controller: endDateController,
                  onChanged: (endDate) => endDateController.text = endDate,
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
                          borderSide:
                              const BorderSide(color: CustomColors.grey))),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));
                    if (picked != null) {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: [
                    startDateController.text.isNotEmpty ||
                            endDateController.text.isNotEmpty
                        ? SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.red),
                                onPressed: () {
                                  startDateController.clear();
                                  endDateController.clear();
                                  controllerAuditRegion
                                      .resetFilterClarification();
                                  Get.back();
                                },
                                child: Text('Reset data filter',
                                    style: CustomStyles.textMediumWhite15Px)))
                        : SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () {
                                  controllerAuditRegion
                                      .filterClarification(
                                          startDateController.text,
                                          endDateController.text);
                                  Get.back();
                                },
                                child: Text('Simpan data filter',
                                    style: CustomStyles.textMediumWhite15Px)),
                          )
                  ],
                )
              ],
            ),
          ),
        );
      });
}

void showDialogPdfClarificationPdfAuditArea(BuildContext context, String title, String fileName) async {
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
                      print(fileName);
                      final data = snapshot.data;
                    return SfPdfViewer.network(
                      headers: {'Authorization': 'Bearer $data'},
                      '${AppConstant.documentClarification}$fileName',
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
                downloadFileClarification('${AppConstant.downloadClarification}$fileName');
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
}

void downloadFileClarification(String url) async {
  final Dio dio = Dio();
  Map<Permission, PermissionStatus> statuses =
      await [Permission.storage].request();

  if (statuses[Permission.storage]!.isGranted) {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'klarifikasi_$timestamp.pdf';
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
  } else {
    snakcBarMessageRed('Gagal', 'permintaan akses ditolak');
  }
}

Future<String?>getToken()async{
  return await TokenManager.getToken();
}

void uploadClarificationAuditRegion(BuildContext context, int id, ControllerAuditRegion controllerAuditRegion) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Upload PDF File"),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 10),

                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileClarificationAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => TextButton(
                      onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                      ? () {
                            controllerAuditRegion.uploadClarificationAuditRegion(controllerAuditRegion.selectedFileName.value,
                            id);
                            Get.to(() => InputIdentificationClarificationAuditRegionPage(clarificationId: id));
                         }
                      : null,
                      child: Text('Upload', style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
      );
  }
