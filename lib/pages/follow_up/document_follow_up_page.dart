import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class DocumentFollowUpPage extends StatefulWidget {
  const DocumentFollowUpPage({super.key});

  @override
  State<DocumentFollowUpPage> createState() => _DocumentFollowUpPageState();
}

class _DocumentFollowUpPageState extends State<DocumentFollowUpPage> {


  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.loadFollowUpDocumentAuditArea();
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Obx((){
        final document = controllerAuditArea.documentFollowUpAuditArea.value;
        if (document == null) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          return Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 590,
                  child: SfPdfViewer.network(
                    document.followUpDoc!),
                ),

                const SizedBox(height: 15),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CustomStyles.customRoundedButton,
                      backgroundColor: CustomColors.blue
                    ),
                    onPressed: () async{
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
                      await Dio().download(document.followUpDoc!, savePath,
                          onReceiveProgress: (received, total) {
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
                  Get.snackbar('Alert', 'Permintaan izin ditolak', 
                        snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white
                      );
                }
                    Get.offAll(() => BotNavePageAuditArea());
                    }, 
                    child: Text('Download file', style: CustomStyles.textMediumWhite15Px)
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
}