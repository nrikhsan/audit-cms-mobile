import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/input_identification_clarification_page.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentClarificationPageAuditRegion extends StatefulWidget {
  final int id;
  const DocumentClarificationPageAuditRegion({super.key, required this.id});

  @override
  State<DocumentClarificationPageAuditRegion> createState() =>
      _DocumentClarificationPageAuditRegionState();
}

class _DocumentClarificationPageAuditRegionState
    extends State<DocumentClarificationPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDocumentClarificationAuditRegion(widget.id);
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: Obx(() {
          final clarification =
              controllerAuditRegion.documentClarificationAuditRegion.value;
          if (clarification == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 600,
                      child: SfPdfViewer.network(
                        clarification.clarificationDoc!,
                        pageSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: CustomStyles.customRoundedButton,
                                  backgroundColor: CustomColors.blue),
                              onPressed: () async {
                                Map<Permission, PermissionStatus> statuses =
                                    await [Permission.storage].request();

                                if (statuses[Permission.storage]!.isGranted) {
                                  var dir = await DownloadsPathProvider.downloadsDirectory;
                                  if (dir != null) {
                                    String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
                                    String saveName = 'klarifikasi_$timestamp.pdf';
                                    String savePath = dir.path + "/$saveName";
                                    print(savePath);

                                    try {
                                      await Dio().download(clarification.clarificationDoc!, savePath, onReceiveProgress: (received, total) {
                                        if (total != -1) {
                                          print((received / total * 100).toStringAsFixed(0) +"%");
                                        }
                                      });
                                      Get.snackbar('Berhasil',
                                          'File $saveName berhasil di unduh',
                                          snackPosition: SnackPosition.TOP,
                                          colorText: CustomColors.white,
                                          backgroundColor: CustomColors.green);
                                    } catch (error) {
                                      throw Exception(error);
                                    }
                                  }
                                } else {
                                  Get.snackbar(
                                      'Ditolak', 'Permintaan izin ditolak',
                                      snackPosition: SnackPosition.TOP,
                                      colorText: CustomColors.white,
                                      backgroundColor: CustomColors.red);
                                }
                              },
                              child: Text('Download',
                                  style: CustomStyles.textMediumWhite15Px)),
                                  
                        const SizedBox(width: 5),
                        ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: CustomStyles.customRoundedButton,
                                  backgroundColor: CustomColors.green),
                              onPressed: () {
                                uploadClarificationAuditRegion(clarification.id!);
                              },
                              child: Text('Upload',
                                  style: CustomStyles.textMediumWhite15Px)),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }
  
  void uploadClarificationAuditRegion(int id) {
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
                            controllerAuditRegion.uploadClarificationAuditRegion(controllerAuditRegion.selectedFileName.value);
                            Get.to(() => const InputIdentificationClarificationAuditRegionPage());
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
}
