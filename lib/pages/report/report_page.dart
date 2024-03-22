import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final TextEditingController auditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Laporan'),
        titleTextStyle: CustomStyles.textBold18Px,
        actions: [
          IconButton(
              onPressed: () {
                showBottomSheetFilterReportAuditArea();
              },
              icon: const Icon(Icons.tune_rounded,
                  color: CustomColors.grey, size: 25))
        ],
      ),
      body: Obx(() {
        if (controllerAuditArea.isLoading.value) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        } else {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: controllerAuditArea.reportAuditArea.length,
                itemBuilder: (_, index) {
                  final report = controllerAuditArea.reportAuditArea[index];
                  return GestureDetector(
                    child: Card(
                      elevation: 0,
                      color: CustomColors.white,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Auditor : ${report.auditor}',
                                    style: CustomStyles.textBold15Px),
                                Text('${report.reportDate}',
                                    style: CustomStyles.textBold13Px),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('${report.branch}',
                                style: CustomStyles.textMedium13Px),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      openFileReportAuditArea(report.reportDoc);
                    },
                  );
                }),
          );
        }
      }),
    );
  }

  void openFileReportAuditArea(String? reportDoc) async {
    if (await canLaunch(reportDoc!)) {
      await launch(
        reportDoc,
        forceSafariVC: false,
        forceWebView: false,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $reportDoc';
    }
  }

  void showBottomSheetFilterReportAuditArea() {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
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
                    title: const Text('Filter data laporan'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    titleSpacing: 5,
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close_rounded,
                            color: CustomColors.black, size: 25)),
                  ),
                  const SizedBox(height: 25),
                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    cursorColor: CustomColors.blue,
                    controller: auditorController,
                    onChanged: (auditor) => auditorController.text = auditor,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Auditor...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.grey))),
                  ),
                  const SizedBox(height: 15),
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
                            borderSide:
                                const BorderSide(color: CustomColors.grey)),
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
                    onChanged: (startDate) =>
                        startDateController.text = startDate,
                    readOnly: true,
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
                          onPressed: () {
                            controllerAuditArea.filterReportAuditArea(
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
            ),
          );
        });
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
    return Scaffold(
      backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Laporan'),
          titleTextStyle: CustomStyles.textBold18Px,
        ),
        floatingActionButton: SpeedDial(
          elevation: 0,
          backgroundColor: CustomColors.orange,
          animatedIcon: AnimatedIcons.menu_close,
          renderOverlay: false,
          children: [
            SpeedDialChild(
              backgroundColor: CustomColors.blue,
              label: 'Upload laporan',
              labelBackgroundColor: CustomColors.blue,
              labelStyle: CustomStyles.textMediumWhite15Px,
                child: const Icon(Icons.add_rounded, color: CustomColors.white),
                onTap: () {
                  showAlertDialogUploadReportAuditRegion();
                }
              ),

              SpeedDialChild(
                backgroundColor: CustomColors.green,
                label: 'Filter data laporan',
                labelBackgroundColor: CustomColors.green,
                labelStyle: CustomStyles.textMediumWhite15Px,
                  child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                  onTap: () {
                    showDialogFilterDataReportAuditRegion();
                  }
                ),
        ]
      ),
      body: Obx((){
        if (controllerAuditRegion.isLoading.value) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        } else {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: controllerAuditRegion.reportListAuditRegion.length,
                itemBuilder: (_, index) {
                  final report = controllerAuditRegion.reportListAuditRegion[index];
                  return GestureDetector(
                    child: Card(
                      elevation: 0,
                      color: CustomColors.white,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Auditor : ${report.auditor}',
                                    style: CustomStyles.textBold15Px),
                                Text('${report.reportDate}',
                                    style: CustomStyles.textBold13Px),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text('${report.branch}',
                                style: CustomStyles.textMedium13Px),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      openFileReportAuditRegion(report.reportDoc);
                    },
                  );
                }),
          );
        }
      }),
    );
  }

  void showAlertDialogUploadReportAuditRegion() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Upload Excel File"),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 10),

                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileReportAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => TextButton(
                      onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                      ? () {
                            controllerAuditRegion.uploadReportAuditRegion(controllerAuditRegion.selectedFileName.value);
                            Get.back();
                         }
                      : null,
                      child: Text('Upload', style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
      );
  }

  void openFileReportAuditRegion(String? reportDoc) async {
    if (await canLaunch(reportDoc!)) {
      await launch(
        reportDoc,
        forceSafariVC: false,
        forceWebView: false,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $reportDoc';
    }
  }
  
  void showDialogFilterDataReportAuditRegion() {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
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
                    title: const Text('Filter data laporan'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    titleSpacing: 5,
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close_rounded,
                            color: CustomColors.black, size: 25)),
                  ),
                  
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
                        setState(() {
                          startDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 15),

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
                        setState(() {
                          endDateController.text =
                              DateFormat('yyyy-MM-dd').format(picked);
                        });
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
                        controllerAuditRegion.loadReportListAuditRegion();
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
                        controllerAuditRegion.filterReportAuditRegion(startDateController.text, endDateController.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                  ],
                )
                ],
              ),
            ),
          );
        });
  }
}
