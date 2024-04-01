import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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
                      downloadFollowUpFile('file_tindak_lanjut', document.followUpDoc!);
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