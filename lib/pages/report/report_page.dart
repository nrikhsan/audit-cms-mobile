import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

//audit area
class ReportPageAuditArea extends StatefulWidget {
  const ReportPageAuditArea({super.key});

  @override
  State<ReportPageAuditArea> createState() => _ReportPageAuditAreaState();
}

class _ReportPageAuditAreaState extends State<ReportPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getReportAuditArea(branchController.text, startDateController.text, endDateController.text);
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Laporan'),
            titleTextStyle: CustomStyles.textBold18Px),
        body: SingleChildScrollView(
          child: Obx((){
          if (controllerAuditArea.reportAuditArea.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          }else{
          final report = controllerAuditArea.reportAuditArea.value;
          return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dengan cabang', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                controller: branchController,
                onChanged: (branch) => branchController.text = branch,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Cabang...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.grey))),
              ),
              const SizedBox(height: 15),
              Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                controller: startDateController,
                onChanged: (startDate) => startDateController.text = startDate,
                readOnly: true,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.grey, size: 20),
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    hintText: 'Mulai dari...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
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
                    setState(() {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: endDateController,
                onChanged: (endDate) => endDateController.text = endDate,
                readOnly: true,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.grey, size: 20),
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    hintText: 'Sampai dengan...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
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
                    setState(() {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    });
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
                      onPressed: ()async {
                        Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

                        if (statuses[Permission.storage]!.isGranted) {
                          var dir = await DownloadsPathProvider.downloadsDirectory;
                          if (dir != null) {
                            String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
                            String saveName = 'laporan_audit_$timestamp.xlsx';
                            String savePath = dir.path + "/$saveName";
                            print(savePath);

                            try {
                              await Dio().download(report!.reportDoc!, savePath,onReceiveProgress: (received, total) {
                                if (total != -1) {
                                  print((received / total * 100).toStringAsFixed(0) +"%");
                                }
                              });
                                Get.snackbar('Berhasil', 'File $saveName berhasil di unduh', 
                                snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.green, colorText: CustomColors.white
                              );
                            } catch (error) {
                              throw Exception(error);
                            }
                          }
                        } else {
                          Get.snackbar('Alert', 'Permintaan izin ditolak', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white
                          );
                        }
                      },
                      child: Text('Download laporan',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    )
            ],
          ),
        );
          }
        }),
        )
      );
  }
}

//audit region
class ReportPageAuditRegion extends StatefulWidget {
  const ReportPageAuditRegion({super.key});

  @override
  State<ReportPageAuditRegion> createState() => _ReportPageAuditRegionState();
}

class _ReportPageAuditRegionState extends State<ReportPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getReportAuditRegion(startDateController.text, endDateController.text);
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Laporan'),
          titleTextStyle: CustomStyles.textBold18Px,
        ),
        body: Obx((){
          if (controllerAuditRegion.reportAuditRegion.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          }else{
            final report = controllerAuditRegion.reportAuditRegion.value;
            return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                controller: startDateController,
                onChanged: (startDate) => startDateController.text = startDate,
                readOnly: true,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.grey, size: 20),
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    hintText: 'Mulai dari...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
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
                    setState(() {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                controller: endDateController,
                onChanged: (endDate) => endDateController.text = endDate,
                readOnly: true,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.grey, size: 20),
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    hintText: 'Sampai dengan...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
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
                    setState(() {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    });
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
                      onPressed: ()async {
                        Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

                        if (statuses[Permission.storage]!.isGranted) {
                          var dir = await DownloadsPathProvider.downloadsDirectory;
                          if (dir != null) {
                            String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
                            String saveName = 'laporan_audit_$timestamp.xlsx';
                            String savePath = dir.path + "/$saveName";
                            print(savePath);

                            try {
                              await Dio().download(report!.reportDoc!, savePath,onReceiveProgress: (received, total) {
                                if (total != -1) {
                                  print((received / total * 100).toStringAsFixed(0) +"%");
                                }
                              });
                                Get.snackbar('Berhasil', 'File $saveName berhasil di unduh', 
                                snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.green, colorText: CustomColors.white
                              );
                            } catch (error) {
                              throw Exception(error);
                            }
                          }
                        } else {
                          Get.snackbar('Alert', 'Permintaan izin ditolak', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white
                          );
                        }
                      },
                      child: Text('Download laporan',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                )
            ],
          ),
        );
          }
        })
    );
  }
}
