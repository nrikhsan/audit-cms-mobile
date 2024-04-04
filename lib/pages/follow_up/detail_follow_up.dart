import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

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
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('No Tindak lanjut :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.code}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.user!.fullname}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.clarification!.evaluationLimitation}', style: CustomStyles.textRegular13Px),

                // const SizedBox(height: 15),
                // Text('Cabang :', style: CustomStyles.textBold15Px),
                // const SizedBox(height: 5),
                // Text('${followUp.branch}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Sanksi :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.penalty}', style: CustomStyles.textRegular13Px),

                const SizedBox(height: 15),
                Text('Alasan :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${followUp.description}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),

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
                                   showDialogPdfFileDetailFollowUp(context, 'File tindak lanjut', 'file_tindak_lanjut', followUp.filePath!);
                                },
                                child: Text('Unduh', style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ),

                // const SizedBox(height: 15),
                //   Text('File klarifikasi :', style: CustomStyles.textBold15Px),
                //   const SizedBox(height: 5),
                //   SizedBox(
                //     width: 140,
                //     child: Card(
                //       shape: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide:
                //               const BorderSide(color: CustomColors.lightGrey)),
                //       elevation: 0,
                //       child: Padding(
                //         padding: const EdgeInsets.all(5),
                //         child: Row(
                //           children: [
                //             Text('File', style: CustomStyles.textMedium15Px),
                //             const SizedBox(width: 10),
                //             ElevatedButton(
                //                 style: ElevatedButton.styleFrom(
                //                     shape: CustomStyles.customRoundedButton,
                //                     backgroundColor: CustomColors.green),
                //                 onPressed: () async {
                //                   showDialogPdfFileDetailFollowUp(context, 'File klarifikasi', 'file_klarifikasi', followUp.filePath!);
                //                 },
                //                 child: Text('Lihat',
                //                     style: CustomStyles.textMediumWhite15Px))
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),

                  // const SizedBox(height: 20),
                  // Text('File BAP :', style: CustomStyles.textBold15Px),
                  // const SizedBox(height: 5),
                  // SizedBox(
                  //   width: 140,
                  //   child: Card(
                  //     shape: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide:
                  //             const BorderSide(color: CustomColors.lightGrey)),
                  //     elevation: 0,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(5),
                  //       child: Row(
                  //         children: [
                  //           Text('File', style: CustomStyles.textMedium15Px),
                  //           const SizedBox(width: 10),
                  //           ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   shape: CustomStyles.customRoundedButton,
                  //                   backgroundColor: CustomColors.blue),
                  //               onPressed: () async {
                  //                 showDialogPdfFileDetailFollowUp(context, 'File BAP', 'file_bap', followUp.bapDoc!);
                  //               },
                  //               child: Text('Lihat',
                  //                   style: CustomStyles.textMediumWhite15Px))
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
              ],
            ),
          )
          );
        }
      })
    );
  }
}