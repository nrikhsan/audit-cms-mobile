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
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


//audit area
class DetailBapPageAuditArea extends StatefulWidget {
  final int id;
  const DetailBapPageAuditArea({super.key, required this.id});

  @override
  State<DetailBapPageAuditArea> createState() => _DetailBapPageAuditAreaState();
}

class _DetailBapPageAuditAreaState extends State<DetailBapPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailBapAuditArea(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail BAP'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
      ),
      body: Obx((){
        final bap = controllerAuditArea.detailBapAuditArea.value;
        if (bap == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          return Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  Text('No. BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.noBap}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('No. Klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.noClarification}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.auditor}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.branch}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Area :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.area}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Periode pemeriksaan :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.startDateExaminationPeriod} s/d ${bap.endDateExaminationPeriod}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('File BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 145,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  showDialogBapAuditArea(bap.bapDoc, context);
                                },
                                child: Text('Lihat', style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  showDialogBapAuditArea(String? bapDoc, BuildContext context) async {
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
                  title: const Text('File BAP'),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: SfPdfViewer.network(
                  bapDoc!,
                  pageSpacing: 0,
                  
                ),
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {

                Map<Permission, PermissionStatus> statuses =
                    await [Permission.storage].request();

                if (statuses[Permission.storage]!.isGranted) {
                  var dir = await DownloadsPathProvider.downloadsDirectory;
                  if (dir != null) {
                    String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
                    String saveName = 'bap_audit_$timestamp.pdf';
                    String savePath = dir.path + "/$saveName";
                    print(savePath);

                    try {
                      await Dio().download(bapDoc, savePath,onReceiveProgress: (received, total) {
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
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }
}

//audit region
class DetailBapAuditRegion extends StatefulWidget {
  final int id;
  const DetailBapAuditRegion({super.key, required this.id});

  @override
  State<DetailBapAuditRegion> createState() => _DetailBapAuditRegionState();
}

class _DetailBapAuditRegionState extends State<DetailBapAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailBapAuditRegion(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail BAP'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
      ),
      body: Obx((){
        final bap = controllerAuditRegion.detailBapAuditRegion.value;
        if (bap == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          return Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  Text('No. BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.noBap}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('No. Klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.noClarification}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.auditor}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.branch}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Area :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.area}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Periode pemeriksaan :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.startDateExaminationPeriod} s/d ${bap.endDateExaminationPeriod}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('File BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 145,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  showDialogBapAuditRegion(bap.bapDoc, context);
                                },
                                child: Text('Lihat', style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  showDialogBapAuditRegion(String? bapDoc, BuildContext context) async {
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
                  title: const Text('File BAP'),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: SfPdfViewer.network(
                  bapDoc!,
                  pageSpacing: 0,
                  
                ),
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {

                Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

                if (statuses[Permission.storage]!.isGranted) {
                  var dir = await DownloadsPathProvider.downloadsDirectory;
                  if (dir != null) {
                    String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
                    String saveName = 'bap_audit_$timestamp.pdf';
                    String savePath = dir.path + "/$saveName";
                    print(savePath);

                    try {
                      await Dio().download(bapDoc, savePath,onReceiveProgress: (received, total) {
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
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }
}