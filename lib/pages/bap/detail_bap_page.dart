import 'dart:async';

import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/helper/styles/formatter.dart';
import 'package:audit_cms/pages/bap/widgetBap/widget_alert_bap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swipe_refresh/swipe_refresh.dart';


//audit area
class DetailBapPageAuditArea extends StatefulWidget {
  final int? id;
  final String? level;
  const DetailBapPageAuditArea({super.key, required this.id, required this.level});

  @override
  State<DetailBapPageAuditArea> createState() => _DetailBapPageAuditAreaState();
}

class _DetailBapPageAuditAreaState extends State<DetailBapPageAuditArea> {
  
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState>refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    controllerAuditArea.bapId.value = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailBapAuditArea(controllerAuditArea.bapId.value);
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
      body: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
        controllerAuditArea.getDetailBapAuditArea(widget.id);
      },
      children: [
        Obx((){
        final bap = controllerAuditArea.detailBapAuditArea.value;
        if (bap == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          final fileBap = bap.filename;
          final nominalLoss = bap.clarification?.nominalLoss != null ? CurrencyFormat.convertToIdr(bap.clarification?.nominalLoss, 0) : null;
          final evaluationLimitation = DateTime.parse('${bap.clarification?.evaluationLimitation}');
          refreshController.add(SwipeRefreshState.hidden);
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

                  Text('Nominal kerugian :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(nominalLoss ?? '-', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Batas evaluasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(DateFormat('dd-MM-yyyy').format(evaluationLimitation), style: CustomStyles.textRegular13Px),
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
                  ) : Wrap(
                    children: [
                      widget.level == 'AREA' ?
                      SizedBox(
                    width: 195,
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
                            Text('File BAP', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  uploadBapAuditArea(context, controllerAuditArea, bap.id);
                                },
                                child: Text('Upload', style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ): Text('Auditor ini belum mengunggah BAP', style: CustomStyles.textRegular13Px),
                    ],
                  )
                  ])
                ],
              ),
            ),
          );
        }
      }),
      ])
    );
  }
}

//audit region
class DetailBapAuditRegion extends StatefulWidget {
  final int? id;
  const DetailBapAuditRegion({super.key, required this.id});

  @override
  State<DetailBapAuditRegion> createState() => _DetailBapAuditRegionState();
}

class _DetailBapAuditRegionState extends State<DetailBapAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  StreamController<SwipeRefreshState> refreshController = StreamController();
  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    controllerAuditRegion.bapId.value = widget.id;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailBapAuditRegion(controllerAuditRegion.bapId.value);
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
      body: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
        controllerAuditRegion.getDetailBapAuditRegion(widget.id);
      },
      children: [
        Obx((){
        final bap = controllerAuditRegion.detailBapAuditRegion.value;
        if (bap == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          final fileBap = bap.filename;
          final nominalLoss = bap.clarification?.nominalLoss != null ? CurrencyFormat.convertToIdr(bap.clarification?.nominalLoss, 0) : null;
          final evaluationLimitation = DateTime.parse('${bap.clarification?.evaluationLimitation}');
          refreshController.add(SwipeRefreshState.hidden);
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

                  Text('Nominal kerugian :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(nominalLoss ?? 'Tidak ada nominal kerugian', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                  const SizedBox(height: 20),

                  Text('Batas evaluasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(DateFormat('dd-MM-yyyy').format(evaluationLimitation), style: CustomStyles.textRegular13Px),
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
                    width: 195,
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
                            Text('File BAP', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  uploadBapAuditRegion(context, controllerAuditRegion, bap.id);
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
      ],)
    );
  }
}