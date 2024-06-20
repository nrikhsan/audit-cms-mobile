import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_alert_and_download_clarification.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//audit area
class DocumentClarificationAuditArea extends StatefulWidget {
  final String? fileName;
  final String? status;
  final int id;
  const DocumentClarificationAuditArea({super.key, this.fileName, this.status, required this.id});

  @override
  State<DocumentClarificationAuditArea> createState() => _DocumentClarificationAuditAreaState();
}

class _DocumentClarificationAuditAreaState extends State<DocumentClarificationAuditArea> {

  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

      bool isUploadButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _updateButtonState(widget.status!);
  }

  void _updateButtonState(String status) {
    setState(() {
      isUploadButtonEnabled = (status == 'UPLOAD');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    const SizedBox(height: 25,),
                  SizedBox(
                  width: double.maxFinite,
                  height: 670,
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
                      onPressed:() async{
                        if (await requestPermission(Permission.storage) == true) {
                          downloadFileClarificationAuditArea('${AppConstant.downloadClarification}${widget.fileName}', '${widget.fileName}',controllerAuditArea);

                           setState(() {
                              isUploadButtonEnabled = true;
                           });
                          
                        } else {
                          showSnackbarPermission(context);
                        }
                      },
                      child: Text('Download', style: CustomStyles.textMediumWhite15Px)),
                      
                      const SizedBox(width: 5),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green),
                      onPressed: isUploadButtonEnabled ? () {
                        uploadClarificationAuditArea(context, widget.id, controllerAuditArea);
                      }: null,
                      child: Text(widget.status == 'UPLOAD' ? 'Upload': 'Upload',
                          style: CustomStyles.textMediumWhite15Px)),
                ],
              )
            ]) 
          )
        ));
  }

  Future<String?>getToken()async{
    return await TokenManager.getToken();
  }
}

//audit region
class DocumentClarificationPageAuditRegion extends StatefulWidget {
  final String? fileName;
  final String? status;
  final int id;
  const DocumentClarificationPageAuditRegion({super.key, required this.fileName, required this.id, this.status});

  @override
  State<DocumentClarificationPageAuditRegion> createState() =>
      _DocumentClarificationPageAuditRegionState();
}

class _DocumentClarificationPageAuditRegionState
    extends State<DocumentClarificationPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));

  bool isUploadButtonEnabled = false;
  @override
  void initState() {
    _updateButtonState(widget.status!);
    super.initState();
  }

  void _updateButtonState(String status) {
    setState(() {
      isUploadButtonEnabled = (status == 'UPLOAD');
    });
  }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
                  children: [
                  const SizedBox(height: 25,),
                  SizedBox(
                  width: double.maxFinite,
                  height: 670,
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
                      onPressed:() async{
                        if (await requestPermission(Permission.storage) == true) {
                          downloadFileClarificationAuditRegion('${AppConstant.downloadClarification}${widget.fileName}', controllerAuditRegion, widget.fileName!);
                          setState(() {
                            isUploadButtonEnabled = true;
                          });
                        } else {
                          showSnackbarPermission(context);
                        }
                      },
                      child: Text('Download', style: CustomStyles.textMediumWhite15Px)),
                      
                      const SizedBox(width: 5),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green),
                      onPressed: isUploadButtonEnabled ? () {
                        uploadClarificationAuditRegion(context, widget.id, controllerAuditRegion);
                      }: null,
                      child: Text(widget.status == 'UPLOAD' ? 'Upload': 'Upload',
                          style: CustomStyles.textMediumWhite15Px)),
                ],
              )
            ]) 
          )
        ));
  }

  Future<String?>getToken()async{
    return await TokenManager.getToken();
  }
}
