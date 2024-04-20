import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/input_bap_page.audit_region.dart';
import 'package:audit_cms/pages/bap/widgetBap/widget_alert_bap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


//audit area
class DetailBapPageAuditArea extends StatefulWidget {
  final int id;
  const DetailBapPageAuditArea({super.key, required this.id});

  @override
  State<DetailBapPageAuditArea> createState() => _DetailBapPageAuditAreaState();
}

class _DetailBapPageAuditAreaState extends State<DetailBapPageAuditArea> {
  
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

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

                  Text('Kode BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.code}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Kode Klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.clarification!.code}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.user!.fullname}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Batas evaluasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.clarification!.evaluationLimitation}', style: CustomStyles.textRegular13Px),
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
                                  showDialogPdfBapAuditArea(context, 'File BAP', '${AppConstant.fileBap}${bap.filename}');
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
}

//audit region
class DetailBapAuditRegion extends StatefulWidget {
  final int id;
  const DetailBapAuditRegion({super.key, required this.id});

  @override
  State<DetailBapAuditRegion> createState() => _DetailBapAuditRegionState();
}

class _DetailBapAuditRegionState extends State<DetailBapAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailBapAuditRegion(widget.id);
    print(widget.id);
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
          final fileBap = bap.filename;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Kode BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.code}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Kode Klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.clarification!.code}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.user!.fullname}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Batas evaluasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${bap.clarification!.evaluationLimitation}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('File BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      fileBap != null ?
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
                                  showDialogPdfBapAuditRegion(context, 'File BAP', '${AppConstant.fileBap}$fileBap');
                                },
                                child: Text('Lihat', style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ) : SizedBox(
                    width: 218,
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
                            Text('Upload BAP', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  Get.to(() => InputBapPageAuditRegion(bapId: bap.id));
                                },
                                child: Text('Upload', style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}