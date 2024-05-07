import 'dart:async';

import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/helper/styles/formatter.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_alert_and_download_clarification.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//audit area
class DetailClarificationPageAuditArea extends StatefulWidget {
  final int id;
  final String statusClarificaion;
  const DetailClarificationPageAuditArea({super.key, required this.id, required this.statusClarificaion});

  @override
  State<DetailClarificationPageAuditArea> createState() =>
      _DetailClarificationPageAuditAreaState();
}

class _DetailClarificationPageAuditAreaState extends State<DetailClarificationPageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState>refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailClarificationAuditArea(widget.id);

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text('Detail klarifikasi'),
        titleTextStyle: CustomStyles.textBold18Px,
        backgroundColor: CustomColors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded,
              color: CustomColors.black, size: 25),
        ),
      ),
      body: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
        controllerAuditArea.getDetailClarificationAuditArea(widget.id);
      },
      children: [
        SingleChildScrollView(
        child: Obx(() {
          final detail = controllerAuditArea.detailClarificationAuditArea.value;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final evaluation = detail.evaluation;
            final followUp = detail.isFollowUp;
            final fileName = detail.fileName;
            final nominalLoss = detail.nominalLoss != null ? CurrencyFormat.convertToIdr(detail.nominalLoss, 2) : null;
            refreshController.add(SwipeRefreshState.hidden);
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Auditor :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.user!.fullname}',
                              style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Kode :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.code}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Cabang :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Kasus :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.cases!.code}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Kategori kasus :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.caseCategory!.name}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Prioritas temuan :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.priority ?? '-', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Deskripsi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.description ?? '-', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Lokasi yang di audit :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.location ?? '-', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Auditee :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.auditee ?? '-', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Audit leader :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.auditeeLeader ?? '-', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Rekomendasi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.recomendation ?? '-', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),
                          
                          Text('Evaluasi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Wrap(
                            children: [
                              evaluation == 0 ? 
                              Text('Tidak ada', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                              : Text('Ada', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                            ],
                          ),
                          const SizedBox(height: 20),

                          Text('Status :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.status}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),

                          Text('Nominal kerugian :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(nominalLoss ?? '-', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),

                          Text('Batas evaluasi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(detail.evaluationLimitation ?? '-', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),

                          Text('Tindak lanjut :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Wrap(
                            children: [
                              followUp == 0 ? 
                              Text('Tidak', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                              : Text('Perlu di tindak lanjut', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                            ],
                          ),
                          const SizedBox(height: 20),

                  Text('File klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      fileName != null && widget.statusClarificaion == 'DONE' || widget.statusClarificaion == 'IDENTIFICATION' ?
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
                                    backgroundColor: CustomColors.green),
                                onPressed: () async {
                                  showDialogPdfClarificationPdfAuditArea(context, 'File klarifikasi', fileName!);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ) : Text('Auditor belum mengunggah klarifikasi', style: CustomStyles.textRegular13Px),
                    ]
                  )
                  
                ],
              ),
            );
          }
        }),
      ),
      ])
    );
  }
}

//audit region
class DetailClarificationAuditRegion extends StatefulWidget {
  final int id;
  const DetailClarificationAuditRegion({super.key, required this.id});

  @override
  State<DetailClarificationAuditRegion> createState() =>
      _DetailClarificationAuditRegionState();
}

class _DetailClarificationAuditRegionState extends State<DetailClarificationAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  StreamController<SwipeRefreshState>refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailClarificationAuditRegion(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail klarifikasi'),
        titleTextStyle: CustomStyles.textBold18Px,
        backgroundColor: CustomColors.white,
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const ClarificationPageAuditRegion());
          },
          icon: const Icon(Icons.arrow_back_rounded,
              color: CustomColors.black, size: 25),
        ),
      ),
      body: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
        controllerAuditRegion.getDetailClarificationAuditRegion(widget.id);
      },
      children: [
        SingleChildScrollView(
        child: Obx(() {
          final detail = controllerAuditRegion.detailClarificationAuditRegion.value;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final evaluation = detail.evaluation;
            final followUp = detail.isFollowUp;
            final nominalLoss = detail.nominalLoss != null ? CurrencyFormat.convertToIdr(detail.nominalLoss, 2) : null;
            refreshController.add(SwipeRefreshState.hidden);
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Auditor :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.user!.fullname}',
                              style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Kode :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.code}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Cabang :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Kasus :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.cases!.code}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Kategori kasus :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.caseCategory!.name}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Prioritas temuan :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.priority}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Deskripsi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.description}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Lokasi yang di audit :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.location}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Auditee :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.auditee}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Audit leader :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.auditeeLeader}', style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),

                          Text('Rekomendasi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.recomendation}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),
                          
                          Text('Evaluasi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Wrap(
                            children: [
                              evaluation == 0 ? 
                              Text('Tidak ada', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                              : Text('Ada', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                            ],
                          ),
                          const SizedBox(height: 20),

                          Text('Status :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.status}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),

                          Text('Nominal kerugian :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(nominalLoss ?? '', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),

                          Text('Batas evaluasi :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.evaluationLimitation}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          const SizedBox(height: 20),

                          Text('Tindak lanjut :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Wrap(
                            children: [
                              followUp == 0 ? 
                              Text('Tidak', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                              : Text('Perlu di tindak lanjut', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify)
                            ],
                          ),
                          const SizedBox(height: 20),
                          
                  const SizedBox(height: 20),
                  Text('File klarifikasi :', style: CustomStyles.textBold15Px),
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
                                    backgroundColor: CustomColors.green),
                                onPressed: () async {
                                  print(detail.fileName);
                                  showDialogPdfClarificationPdfAuditRegion(detail.fileName);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
      ],)
    );
  }
  
  void showDialogPdfClarificationPdfAuditRegion(String? fileName) async{
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: CustomColors.white,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
              width: double.maxFinite,
              height: 400,
              child: Scaffold(
                appBar: AppBar(
                  titleSpacing: 5,
                  backgroundColor: CustomColors.white,
                  title: const Text('File klarifikasi'),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: FutureBuilder(
                  future: getToken(),
                  builder: (_, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      print(fileName);
                      final data = snapshot.data;
                    return SfPdfViewer.network(
                      headers: {'Authorization': 'Bearer $data'},
                      '${AppConstant.documentClarification}$fileName',
                      pageSpacing: 0,
                      );
                    }
                  }
                )
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {
                if (await requestPermission(Permission.storage) == true) {
                  downloadFileClarification('${AppConstant.downloadReportClarification}$fileName');
                } else {
                  showSnackbarPermission(context);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }
}
  Future<String?>getToken()async{
    return await TokenManager.getToken();
  }
