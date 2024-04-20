import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_alert_and_download_clarification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentClarificationPageAuditRegion extends StatefulWidget {
  final String? fileName;
  final int id;
  const DocumentClarificationPageAuditRegion({super.key, required this.fileName, required this.id});

  @override
  State<DocumentClarificationPageAuditRegion> createState() =>
      _DocumentClarificationPageAuditRegionState();
}

class _DocumentClarificationPageAuditRegionState
    extends State<DocumentClarificationPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));
      
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                widget.fileName != null ?
                Column(
                  children: [
                    SizedBox(
                width: double.maxFinite,
                height: 600,
                child: FutureBuilder(
                  future: getToken(),
                  builder: (_, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final data = snapshot.data;
                    return SfPdfViewer.network(
                      headers: {'Authorization': 'Bearer $data'},
                      '${AppConstant.documentClarification}${widget.fileName}',
                      pageSpacing: 0,
                      );
                    }
                  }
                )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: () async {
                        downloadFileClarification('${AppConstant.downloadClarification}${widget.fileName}');
                        controllerAuditRegion.pagingControllerClarification.refresh();
                      },
                      child: Text('Download',
                          style: CustomStyles.textMediumWhite15Px)),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green),
                      onPressed: () {
                        uploadClarificationAuditRegion(context, widget.id, controllerAuditRegion);
                      },
                      child: Text('Upload',
                          style: CustomStyles.textMediumWhite15Px)),
                ],
              )
                  ],
                ) : Obx((){
                  return Column(
                  children: [
                    SizedBox(
                width: double.maxFinite,
                height: 600,
                child: FutureBuilder(
                  future: getToken(),
                  builder: (_, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final data = snapshot.data;
                    return SfPdfViewer.network(
                      headers: {'Authorization': 'Bearer $data'},
                      '${AppConstant.documentClarification}${controllerAuditRegion.dataInputClarification.value?.clarification?.fileName}',
                      pageSpacing: 0,
                      );
                    }
                  }
                )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: () async {
                        downloadFileClarification('${AppConstant.downloadClarification}${controllerAuditRegion.dataInputClarification.value?.clarification?.fileName}');
                        
                      },
                      child: Text('Download',
                          style: CustomStyles.textMediumWhite15Px)),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green),
                      onPressed: () {
                        uploadClarificationAuditRegion(context, controllerAuditRegion.dataInputClarification.value!.clarification!.id!, controllerAuditRegion);
                      },
                      child: Text('Upload',
                          style: CustomStyles.textMediumWhite15Px)),
                ],
              )
                  ],
                );
                })
              ],
            )
          )
        ));
  }

  Future<String?>getToken()async{
    return await TokenManager.getToken();
  }
}
