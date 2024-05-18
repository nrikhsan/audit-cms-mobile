import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class DocumentFollowUpPage extends StatefulWidget {
  final String? fileName;
  final int? followUpId;
  const DocumentFollowUpPage({super.key, required this.fileName, required this.followUpId});

  @override
  State<DocumentFollowUpPage> createState() => _DocumentFollowUpPageState();
}

class _DocumentFollowUpPageState extends State<DocumentFollowUpPage> {


  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
              children: [
                FutureBuilder(
                  future: getToken(), 
                  builder: (_, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final token = snapshot.data;
                      return Center(
                        child: Wrap(
                          children: [
                            widget.fileName == null ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 25),
                                Text('Dokumen tidak tersedia', style: CustomStyles.textMedium18Px),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CustomStyles.customRoundedButton,
                                      backgroundColor: CustomColors.blue
                                    ),
                                    onPressed: () async{
                                      if (widget.fileName == null) {
                                        snackBarMessageRed('Gagal', 'File tidak tersedia');
                                      } else {
                                          if (await requestPermission(Permission.storage) == true) {
                                          downloadFollowUpFile('${AppConstant.downloadFollowUp}${widget.fileName}');
                                        } else {
                                          showSnackbarPermission(context);
                                        }
                                      }
                                    }, 
                                    child: Text('Download file', style: CustomStyles.textMediumWhite15Px)
                                  ),
                                )
                              ],
                            )
                            : SingleChildScrollView(
                              child: Column(
                              children: [
                                const SizedBox(height: 25),
                                Container(
                                  width: double.maxFinite,
                                  height: 670,
                                  child: SfPdfViewer.network(
                                    headers: {'Authorization': 'Bearer $token'},
                                  '${AppConstant.followUpDocument}${widget.fileName}'
                                  ),
                                ),
                        
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.blue
                                        ),
                                        onPressed: () async{
                                          if (await requestPermission(Permission.storage) == true) {
                                            downloadFollowUpFile('${AppConstant.downloadFollowUp}${widget.fileName}');
                                          } else {
                                            showSnackbarPermission(context);
                                          }
                                        }, 
                                        child: Text('Download', style: CustomStyles.textMediumWhite15Px)
                                      ),
                                    ),

                                    const SizedBox(width: 5),

                                    SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.green
                                        ),
                                        onPressed: () async{
                                          uploadFollowUpAuditArea(context, widget.followUpId!, controllerAuditArea);
                                        }, 
                                        child: Text('Upload', style: CustomStyles.textMediumWhite15Px)
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                            )
                          ],
                        ),
                      );
                    }
                  }
                ),
              ],
            ),
            )
          )
    );
  }
}

Future<String?> getToken()async{
  return await TokenManager.getToken();
}