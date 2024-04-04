import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_alert_and_download_clarification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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
                                downloadFileDetailClarification('file_klarifikasi', clarification.clarificationDoc!);
                              },
                              child: Text('Download',
                                  style: CustomStyles.textMediumWhite15Px)),
                                  
                        const SizedBox(width: 5),
                        ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: CustomStyles.customRoundedButton,
                                  backgroundColor: CustomColors.green),
                              onPressed: () {
                                uploadClarificationAuditRegion(context, clarification.id!, controllerAuditRegion);
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
        })
      );
  }
}