import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailFollowUpPageAuditArea extends StatefulWidget {
  final int id;
  const DetailFollowUpPageAuditArea({super.key, required this.id});

  @override
  State<DetailFollowUpPageAuditArea> createState() => _DetailFollowUpPageAuditAreaState();
}

class _DetailFollowUpPageAuditAreaState extends State<DetailFollowUpPageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailFollowUpAuditArea(widget.id);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text('Detail tindak lanjut'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        backgroundColor: CustomColors.white,
      ),
      body: Obx((){
        final followUp = controllerAuditArea.detailFollowUpAuditArea.value;
        if (followUp == null) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          return SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('No klarifikasi :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.noKlarifikasi}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.auditor}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.dateFollowUp}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.branch}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Sanksi :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.penalty}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Alasan :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.reason}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),

                const SizedBox(height: 15),
                  Text('File tindak lanjut :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 140,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.orange),
                                onPressed: () async {
                                  await showDialogPdfFollowUpDoc(followUp.followUpDoc, context);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 15),
                  Text('File klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 140,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.green),
                                onPressed: () async {
                                  await showDialogPdfClarificationPdfAuditArea(
                                      followUp.clarificationDoc, context);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Text('File BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 140,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  await showDialogBapAuditArea(
                                      followUp.bapDoc, context);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
          );
        }
      })
    );
  }

  Future<void> showDialogPdfClarificationPdfAuditArea(
      String? clarificationDoc, BuildContext context) async {
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
                  title: const Text('File klarifikasi'),
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
                  clarificationDoc!,
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
                    String saveName = 'Klarifikasi_audit_$timestamp.pdf';
                    String savePath = dir.path + "/$saveName";
                    print(savePath);

                    try {
                      await Dio().download(clarificationDoc, savePath,
                          onReceiveProgress: (received, total) {
                        if (total != -1) {
                          print((received / total * 100).toStringAsFixed(0) +"%");
                        }
                      });
                      Get.snackbar('Berhasil', 'File $saveName berhasil di unduh', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.green);
                    } catch (error) {
                      throw Exception(error);
                    }
                  }
                } else {
                  Get.snackbar('Ditolak', 'Permintaan izin ditolak', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.red);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
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
                      await Dio().download(bapDoc, savePath,
                          onReceiveProgress: (received, total) {
                        if (total != -1) {
                          print((received / total * 100).toStringAsFixed(0) +"%");
                        }
                      });
                      Get.snackbar('Berhasil', 'File $saveName berhasil di unduh', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.green);
                    } catch (error) {
                      throw Exception(error);
                    }
                  }
                } else {
                  Get.snackbar('Ditolak', 'Permintaan izin ditolak', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }
  
  showDialogPdfFollowUpDoc(String? followUpDoc, BuildContext context) {
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
                  title: const Text('File tindak lanjut'),
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
                  followUpDoc!,
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
                    String saveName = 'tindak_lanjut_audit_$timestamp.pdf';
                    String savePath = dir.path + "/$saveName";
                    print(savePath);

                    try {
                      await Dio().download(followUpDoc, savePath,
                          onReceiveProgress: (received, total) {
                        if (total != -1) {
                          print((received / total * 100).toStringAsFixed(0) +"%");
                        }
                      });
                      Get.snackbar('Berhasil', 'File $saveName berhasil di unduh', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.green);
                    } catch (error) {
                      throw Exception(error);
                    }
                  }
                } else {
                  Get.snackbar('Ditolak', 'Permintaan izin ditolak', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }
}