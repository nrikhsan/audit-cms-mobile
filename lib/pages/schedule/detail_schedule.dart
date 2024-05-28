import 'dart:async';

import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/kka/widgetKka/widket_kka.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/input_lha_page_audit_region.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

//audit area
//main schedule
class DetailMainSchedulePageAuditArea extends StatefulWidget {
  final int mainScheduleId;
  const DetailMainSchedulePageAuditArea(
      {super.key, required this.mainScheduleId});

  @override
  State<DetailMainSchedulePageAuditArea> createState() =>
      _DetailMainSchedulePageAuditAreaState();
}

class _DetailMainSchedulePageAuditAreaState
    extends State<DetailMainSchedulePageAuditArea> {
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailMainScheduleAuditArea(widget.mainScheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal utama'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SwipeRefresh.material(
            stateStream: refreshController.stream,
            onRefresh: () {
              controllerAuditArea
                  .getDetailMainScheduleAuditArea(widget.mainScheduleId);
            },
            children: [
              SingleChildScrollView(
                child: Obx(() {
                final schedule =
                    controllerAuditArea.detailMainScheduleAuditArea.value;
                if (schedule == null) {
                  return const Center(
                      child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  final detail = schedule.schedule;
                  final kka = schedule.kka;
                  final lha = schedule.lha;
                  final status = detail?.status;
                  final suggestion = detail?.suggestion;
                  final startDate = DateTime.parse('${detail?.startDate}');
                  final endDateDate = DateTime.parse('${detail?.endDate}');
                  final outputStartDate =
                      DateFormat('dd-MM-yyyy').format(startDate);
                  final outputEndDate =
                      DateFormat('dd-MM-yyyy').format(endDateDate);

                  DateTime? startDateRealization =
                      detail?.startDateRealization != null
                          ? DateTime.parse(detail!.startDateRealization!)
                          : null;
                  DateTime? endDateRealization =
                      detail?.endDateRealization != null
                          ? DateTime.parse(detail!.endDateRealization!)
                          : null;

                  refreshController.add(SwipeRefreshState.hidden);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Auditor :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail!.user!.fullname}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Nama cabang :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail.branch!.name}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Tanggal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('$outputStartDate s/d $outputEndDate',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(detail.description ?? '-',
                          style: CustomStyles.textRegular13Px,
                          textAlign: TextAlign.justify),

                      Visibility(
                        visible: suggestion == null || status == 'APPROVE' ? false : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text('Saran reschedule :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(suggestion ?? '-', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      Text('Status :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          if (status == 'TODO')
                            Text('Belum dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'PROGRESS')
                            Text('Sedang dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'DONE')
                            Text('Sudah selesai',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'PENDING')
                            Text('Pending', style: CustomStyles.textMedium13Px),
                          if (status == 'REQUEST')
                            Text('Menunggu persetujuan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'APPROVE')
                            Text('Disetujui',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'REVISION')
                            Text('Revisi',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'REJECTED')
                            Text('Ditolak', style: CustomStyles.textMedium13Px),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Awal tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          startDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(startDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Akhir tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          endDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(endDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Kertas kerja audit',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          kka != null
                              ? SizedBox(
                                  width: 150,
                                  child: Card(
                                    elevation: 0,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: CustomColors.lightGrey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('File',
                                              style:
                                                  CustomStyles.textMedium15Px),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      CustomColors.green,
                                                  shape: CustomStyles
                                                      .customRoundedButton),
                                              onPressed: () async {
                                                if (await requestPermission(
                                                        Permission.storage) ==
                                                    true) {
                                                  downloadKKaAuditArea(
                                                      '${AppConstant.downloadKKa}${kka.filename}');
                                                } else {
                                                  showSnackbarPermission(
                                                      context);
                                                }
                                              },
                                              child: Text('Unduh',
                                                  style: CustomStyles
                                                      .textMediumWhite15Px)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Text('Auditor belum mengunggah KKA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('List laporan harian audit :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          lha != null
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: lha.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    final isFlag = lha[index].isFlag;
                                    return Card(
                                        elevation: 0,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: CustomColors.grey,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  isFlag == 1
                                                      ? Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .notifications_rounded,
                                                                color:
                                                                    CustomColors
                                                                        .red,
                                                                size: 20),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                                'Belum melakukan klarifikasi',
                                                                style: CustomStyles
                                                                    .textMediumRed15Px)
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                  'Cabang : ${lha[index].branch!.name}',
                                                  style: CustomStyles
                                                      .textBold15Px),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape: CustomStyles
                                                              .customRoundedButton),
                                                      onPressed: () {
                                                        final lhaId =
                                                            lha[index].id;
                                                        final level = detail
                                                            .user?.level?.name;
                                                        if (lhaId != null) {
                                                          Get.to(() =>
                                                              DetailLhaPageAuditArea(
                                                                  id: lhaId,
                                                                  level:
                                                                      level));
                                                        }
                                                      },
                                                      child: Text(
                                                          'Lihat rincian',
                                                          style: CustomStyles
                                                              .textMediumGreen15Px))
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  })
                              : Text('Auditor belum Membuat LHA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      )
                    ],
                  );
                }
              }))
            ],
          )),
    );
  }
}

//special schedule
class DetailSpecialSchedulePageAuditArea extends StatefulWidget {
  final int specialScheduleId;
  final String? startDate;
  final String? endDate;
  final String? kka;
  final String? createdBy;
  final int? userId;
  const DetailSpecialSchedulePageAuditArea(
      {super.key,
      required this.specialScheduleId,
      required this.startDate,
      required this.endDate,
      required this.kka,
      this.createdBy, this.userId});

  @override
  State<DetailSpecialSchedulePageAuditArea> createState() =>
      _DetailSpecialSchedulePageAuditAreaState();
}

class _DetailSpecialSchedulePageAuditAreaState
    extends State<DetailSpecialSchedulePageAuditArea> {
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  void checkScheduleInputLhaAndKka() {
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    DateTime startDate = inputFormat.parse(widget.startDate!);
    DateTime endDate = inputFormat.parse(widget.endDate!);

    String formattedStartDate = outputFormat.format(startDate);
    String formattedEndDate = outputFormat.format(endDate);

    DateTime today = DateTime.now();
    String formattedCurrentTime = outputFormat.format(today);

    startDate = DateTime.parse(formattedStartDate);
    endDate = DateTime.parse(formattedEndDate);
    today = DateTime.parse(formattedCurrentTime);

    if (today.isBefore(startDate)) {
      snackBarMessageRed('Alert','Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
    } else if (today.isAfter(endDate)) {
      snackBarMessageRed('Alert', 'Jadwal sudah berakhir');
    }else{
      Get.to(() => InputLhaAuditArea(scheduleId: widget.specialScheduleId));
    }
  }

  Future<String?>getToken()async{
    return await TokenManager.getToken();
    
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea
        .getDetailSpecialScheduleAuditArea(widget.specialScheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      floatingActionButton: widget.createdBy == 'PUSAT' ||
              widget.createdBy == 'LEAD'
          ? SpeedDial(
              elevation: 0,
              backgroundColor: CustomColors.orange,
              animatedIcon: AnimatedIcons.menu_close,
              renderOverlay: false,
              children: [
                SpeedDialChild(
                    backgroundColor: CustomColors.blue,
                    label: 'Tambah LHA',
                    labelBackgroundColor: CustomColors.blue,
                    labelStyle: CustomStyles.textMediumWhite15Px,
                    child: const Icon(Icons.add_rounded,
                        color: CustomColors.white),
                    onTap: ()async {
                      final tokenArea = await TokenManager.getToken();
                      Map<String, dynamic>decodedToken = Jwt.parseJwt(tokenArea!);
                      int? id = decodedToken['user']['id'];
                      if (widget.userId == id) {
                       checkScheduleInputLhaAndKka();
                      } else {
                        snackBarMessageRed('Alert', 'Jadwal ini bukan untuk anda');
                      }
                    }),
                SpeedDialChild(
                    backgroundColor: CustomColors.green,
                    label: 'Upload KKA',
                    labelBackgroundColor: CustomColors.green,
                    labelStyle: CustomStyles.textMediumWhite15Px,
                    child: const Icon(Icons.upload_file_rounded,
                        color: CustomColors.white),
                    onTap: () async {
                      
                      final lha = controllerAuditArea.detailSpecialScheduleAuditArea.value?.lha;

                      final tokenArea = await TokenManager.getToken();
                      Map<String, dynamic>decodedToken = Jwt.parseJwt(tokenArea!);
                      int? id = decodedToken['user']['id'];

                      if (widget.userId == id) {
                        if (lha != null) {
                        if (widget.kka != null) {
                          snackBarMessageGreen( 'Alert', 'Anda sudah mengunggah KKA');
                        } else {
                          showDialogUploadKkaAuditArea(widget.specialScheduleId);
                        }
                        } else {
                          snackBarMessageRed('Alert', 'Anda harus membuat LHA terlebih dahulu');
                        }
                      } else {
                        snackBarMessageRed('Alert', 'Jadwal ini bukan untuk anda');
                      }
                    }),
              ],
            )
          : null,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal khusus'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SwipeRefresh.material(
            stateStream: refreshController.stream,
            onRefresh: () {
              controllerAuditArea
                  .getDetailSpecialScheduleAuditArea(widget.specialScheduleId);
            },
            children: [
              SingleChildScrollView(child: Obx(() {
                if (controllerAuditArea.detailSpecialScheduleAuditArea.value ==
                    null) {
                  return const Center(
                      child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  final detail = controllerAuditArea
                      .detailSpecialScheduleAuditArea.value?.schedule;
                  final kka = controllerAuditArea
                      .detailSpecialScheduleAuditArea.value?.kka;
                  final lha = controllerAuditArea
                      .detailSpecialScheduleAuditArea.value?.lha;
                  final status = detail?.status;
                  final suggestion = detail?.suggestion;

                  final startDate = DateTime.parse('${detail?.startDate}');
                  final endDateDate = DateTime.parse('${detail?.endDate}');
                  final outputStartDate =
                      DateFormat('dd-MM-yyyy').format(startDate);
                  final outputEndDate =
                      DateFormat('dd-MM-yyyy').format(endDateDate);

                  DateTime? startDateRealization =
                      detail?.startDateRealization != null
                          ? DateTime.parse(detail!.startDateRealization!)
                          : null;
                  DateTime? endDateRealization =
                      detail?.endDateRealization != null
                          ? DateTime.parse(detail!.endDateRealization!)
                          : null;

                  refreshController.add(SwipeRefreshState.hidden);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Auditor :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail!.user!.fullname}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Nama cabang :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail.branch!.name}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Tanggal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('$outputStartDate s/d $outputEndDate',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(detail.description ?? '-',
                          style: CustomStyles.textRegular13Px,
                          textAlign: TextAlign.justify),

                        Visibility(
                        visible: suggestion == null || status == 'APPROVE' ? false : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text('Saran reschedule :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(suggestion ?? '-', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      Text('Status :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          if (status == 'TODO')
                            Text('Belum dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'PROGRESS')
                            Text('Sedang dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'DONE')
                            Text('Sudah selesai',
                                style: CustomStyles.textMedium13Px),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Awal tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          startDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(startDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Akhir tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          endDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(endDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Kertas kerja audit',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          kka != null
                              ? SizedBox(
                                  width: 150,
                                  child: Card(
                                    elevation: 0,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: CustomColors.lightGrey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('File',
                                              style:
                                                  CustomStyles.textMedium15Px),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      CustomColors.green,
                                                  shape: CustomStyles
                                                      .customRoundedButton),
                                              onPressed: () async {
                                                if (await requestPermission(
                                                        Permission.storage) ==
                                                    true) {
                                                  downloadKKaAuditArea(
                                                      '${AppConstant.downloadKKa}${kka.filename}');
                                                } else {
                                                  showSnackbarPermission(
                                                      context);
                                                }
                                              },
                                              child: Text('Unduh',
                                                  style: CustomStyles
                                                      .textMediumWhite15Px)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Text('Auditor belum mengunggah KKA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('List laporan harian audit :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          lha != null
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: lha.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return Card(
                                        elevation: 0,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: CustomColors.grey,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  lha[index].isFlag == 1
                                                      ? Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .notifications_rounded,
                                                                color:
                                                                    CustomColors
                                                                        .red,
                                                                size: 20),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                                'Belum melakukan klarifikasi',
                                                                style: CustomStyles
                                                                    .textMediumRed15Px)
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                  'Cabang : ${lha[index].branch!.name}',
                                                  style: CustomStyles
                                                      .textBold15Px),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape: CustomStyles
                                                              .customRoundedButton),
                                                      onPressed: () {
                                                        final lhaId =
                                                            lha[index].id;
                                                        final level = detail
                                                            .user?.level?.name;
                                                        if (lhaId != null) {
                                                          Get.to(() =>
                                                              DetailLhaPageAuditArea(
                                                                  id: lhaId,
                                                                  level:
                                                                      level));
                                                        }
                                                      },
                                                      child: Text(
                                                          'Lihat rincian',
                                                          style: CustomStyles
                                                              .textMediumGreen15Px))
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  })
                              : Text('Auditor belum Membuat LHA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      )
                    ],
                  );
                }
              })),
            ],
          )),
    );
  }

  void showDialogUploadKkaAuditArea(int id) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Upload Excel File"),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Obx(() => Text(controllerAuditArea.selectedFileName.value,
                    style: CustomStyles.textRegularGrey13Px)),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () =>
                      controllerAuditArea.pickFileKkaAuditArea(),
                  child: Text('Choose File',
                      style: CustomStyles.textMediumGreen15Px),
                ),
                const SizedBox(height: 10),
                Obx(() => TextButton(
                      onPressed: controllerAuditArea
                              .selectedFileName.value.isNotEmpty
                          ? () {
                              controllerAuditArea.uploadKkaAuditArea(
                                  controllerAuditArea.selectedFileName.value,
                                  id);
                              Get.back();
                            }
                          : null,
                      child: Text('Upload',
                          style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () {
                  controllerAuditArea.selectedFileName.value = '';
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        });
  }
}

//reschedule
class DetailReschedulePageAuditArea extends StatefulWidget {
  final int rescheduleId;
  const DetailReschedulePageAuditArea({super.key, required this.rescheduleId});

  @override
  State<DetailReschedulePageAuditArea> createState() =>
      _DetailReschedulePageAuditAreaState();
}

class _DetailReschedulePageAuditAreaState
    extends State<DetailReschedulePageAuditArea> {
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailRescheduleAuditArea(widget.rescheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail reschedule'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SwipeRefresh.material(
            stateStream: refreshController.stream,
            onRefresh: () {
              controllerAuditArea
                  .getDetailRescheduleAuditArea(widget.rescheduleId);
            },
            children: [
              SingleChildScrollView(child: Obx(() {
                if (controllerAuditArea.detailRescheduleAuditArea.value ==
                    null) {
                  return const Center(
                      child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  final detail = controllerAuditArea
                      .detailRescheduleAuditArea.value!.schedule;
                  final kka =
                      controllerAuditArea.detailRescheduleAuditArea.value!.kka;
                  final lha =
                      controllerAuditArea.detailRescheduleAuditArea.value!.lha;
                  final statusReschedules = detail?.status;
                  final suggestion = detail?.suggestion;

                  final startDate = DateTime.parse('${detail?.startDate}');
                  final endDateDate = DateTime.parse('${detail?.endDate}');
                  final outputStartDate =
                      DateFormat('dd-MM-yyyy').format(startDate);
                  final outputEndDate =
                      DateFormat('dd-MM-yyyy').format(endDateDate);

                  final newStartDate =
                      DateTime.parse('${detail?.newStartDate}');
                  final newEendDateDate =
                      DateTime.parse('${detail?.newEndDate}');
                  final outputNewStartDate =
                      DateFormat('dd-MM-yyyy').format(newStartDate);
                  final outputNewEndDate =
                      DateFormat('dd-MM-yyyy').format(newEendDateDate);

                  DateTime? startDateRealization =
                      detail?.startDateRealization != null
                          ? DateTime.parse(detail!.startDateRealization!)
                          : null;
                  DateTime? endDateRealization =
                      detail?.endDateRealization != null
                          ? DateTime.parse(detail!.endDateRealization!)
                          : null;

                  refreshController.add(SwipeRefreshState.hidden);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Auditor :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail!.user!.fullname}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Nama cabang :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail.branch!.name}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Tanggal jadwal lama :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('$outputStartDate s/d $outputEndDate',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Tanggal jadwal baru :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('$outputNewStartDate s/d $outputNewEndDate',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(detail.description ?? '-',
                          style: CustomStyles.textRegular13Px,
                          textAlign: TextAlign.justify),
                      
                      Visibility(
                        visible: suggestion == null || statusReschedules == 'APPROVE' ? false : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text('Saran reschedule :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(suggestion ?? '-', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      Text('Kategori :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail.category}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Status :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          if (statusReschedules == 'PENDING')
                            Text('Pending', style: CustomStyles.textMedium13Px),
                          if (statusReschedules == 'REQUEST')
                            Text('Menunggu persetujuan',
                                style: CustomStyles.textMedium13Px),
                          if (statusReschedules == 'APPROVE')
                            Text('Disetujui',
                                style: CustomStyles.textMedium13Px),
                          if (statusReschedules == 'REVISION')
                            Text('Revisi',
                                style: CustomStyles.textMedium13Px),
                          if (statusReschedules == 'REJECTED')
                            Text('Ditolak', style: CustomStyles.textMedium13Px),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Awal tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          startDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(startDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Akhir tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          endDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(endDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Kertas kerja audit',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          kka != null
                              ? SizedBox(
                                  width: 150,
                                  child: Card(
                                    elevation: 0,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: CustomColors.lightGrey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('File',
                                              style:
                                                  CustomStyles.textMedium15Px),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      CustomColors.green,
                                                  shape: CustomStyles
                                                      .customRoundedButton),
                                              onPressed: () async {
                                                if (await requestPermission(
                                                        Permission.storage) ==
                                                    true) {
                                                  downloadKKaAuditArea(
                                                      '${AppConstant.downloadKKa}${kka.filename}');
                                                } else {
                                                  showSnackbarPermission(
                                                      context);
                                                }
                                              },
                                              child: Text('Unduh',
                                                  style: CustomStyles
                                                      .textMediumWhite15Px)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Text('Anda belum mengunggah KKA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('List laporan harian audit :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          lha != null
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: lha.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return Card(
                                        elevation: 0,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: CustomColors.grey,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  lha[index].isFlag == 1
                                                      ? Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .notifications_rounded,
                                                                color:
                                                                    CustomColors
                                                                        .red,
                                                                size: 20),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                                'Perlu melakukan klarifikasi',
                                                                style: CustomStyles
                                                                    .textMediumRed15Px)
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                  'Cabang : ${lha[index].branch!.name}',
                                                  style: CustomStyles
                                                      .textBold15Px),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape: CustomStyles
                                                              .customRoundedButton),
                                                      onPressed: () {
                                                        final lhaId =
                                                            lha[index].id;
                                                        final level = detail
                                                            .user?.level?.name;
                                                        if (lhaId != null) {
                                                          Get.to(() =>
                                                              DetailLhaPageAuditArea(
                                                                  id: lhaId,
                                                                  level:
                                                                      level));
                                                        }
                                                      },
                                                      child: Text(
                                                          'Lihat rincian',
                                                          style: CustomStyles
                                                              .textMediumGreen15Px))
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  })
                              : Text('Anda belum Membuat LHA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      )
                    ],
                  );
                }
              })),
            ],
          )),
    );
  }
}

//audit region
//main schedule
class DetailMainScheduleAuditRegion extends StatefulWidget {
  final int mainScheduleId;
  final String? kka;
  final String startDate;
  final String endDate;
  const DetailMainScheduleAuditRegion(
      {super.key,
      required this.mainScheduleId,
      this.kka,
      required this.startDate,
      required this.endDate});

  @override
  State<DetailMainScheduleAuditRegion> createState() =>
      _DetailMainScheduleAuditRegionState();
}

class _DetailMainScheduleAuditRegionState
    extends State<DetailMainScheduleAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    controllerAuditRegion.getDetailMainScheduleAuditRegion(widget.mainScheduleId);
    super.initState();
  }

  void checkScheduleInputLhaAndKka() {
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    DateTime startDate = inputFormat.parse(widget.startDate);
    DateTime endDate = inputFormat.parse(widget.endDate);

    String formattedStartDate = outputFormat.format(startDate);
    String formattedEndDate = outputFormat.format(endDate);

    DateTime today = DateTime.now();
    String formattedCurrentTime = outputFormat.format(today);

    startDate = DateTime.parse(formattedStartDate);
    endDate = DateTime.parse(formattedEndDate);
    today = DateTime.parse(formattedCurrentTime);

    if (today.isBefore(startDate)) {
      snackBarMessageRed('Alert','Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
    } else if (today.isAfter(endDate)) {
      snackBarMessageRed('Alert', 'Jadwal sudah berakhir');
    }else{
      Get.to(() => InputLhaPageAuditRegion(scheduleId: widget.mainScheduleId));
    }
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion
        .getDetailMainScheduleAuditRegion(widget.mainScheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal utama'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      floatingActionButton: SpeedDial(
        elevation: 0,
        backgroundColor: CustomColors.orange,
        animatedIcon: AnimatedIcons.menu_close,
        renderOverlay: false,
        children: [
          SpeedDialChild(
              backgroundColor: CustomColors.blue,
              label: 'Tambah LHA',
              labelBackgroundColor: CustomColors.blue,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.add_rounded, color: CustomColors.white),
              onTap: () {
                setState(() {
                  checkScheduleInputLhaAndKka();
                });
              }),
          SpeedDialChild(
              backgroundColor: CustomColors.green,
              label: 'Upload KKA',
              labelBackgroundColor: CustomColors.green,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.upload_file_rounded,
                  color: CustomColors.white),
              onTap: () {
                final lha = controllerAuditRegion.detailMainSchedule.value?.lha;
                if (lha != null) {
                  if (widget.kka != null) {
                    snackBarMessageGreen('Alert', 'Anda sudah mengunggah KKA');
                  } else {
                      showDialogUploadKkaAuditRegion(widget.mainScheduleId);
                  }
                } else {
                  snackBarMessageRed(
                      'Alert', 'Anda harus membuat LHA terlebih dahulu');
                }
              }),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SwipeRefresh.material(
            stateStream: refreshController.stream,
            onRefresh: () {
              controllerAuditRegion
                  .getDetailMainScheduleAuditRegion(widget.mainScheduleId);
            },
            children: [
              SingleChildScrollView(child: Obx(() {
                final schedule = controllerAuditRegion.detailMainSchedule.value;
                if (schedule == null) {
                  return const Center(
                      child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  final detail = schedule.schedule;
                  final kka = schedule.kka;
                  final lha = schedule.lha;
                  final status = detail?.status;
                  final startDateSchedule =
                      DateTime.parse('${detail?.startDate}');
                  final endDateSchedule = DateTime.parse('${detail?.endDate}');

                  final startDateRealization =
                      detail?.startDateRealization != null
                          ? DateTime.parse('${detail?.startDateRealization}')
                          : null;
                  final endDateRealization = detail?.endDateRealization != null
                      ? DateTime.parse('${detail?.endDateRealization}')
                      : null;

                  refreshController.add(SwipeRefreshState.hidden);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Auditor :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail!.user!.fullname}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Nama cabang :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail.branch!.name}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Tanggal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          '${DateFormat('dd-MM-yyyy').format(startDateSchedule)} s/d ${DateFormat('dd-MM-yyyy').format(endDateSchedule)}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(detail.description ?? '-',
                          style: CustomStyles.textRegular13Px,
                          textAlign: TextAlign.justify),
                      const SizedBox(height: 20),
                      Text('Status :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          if (status == 'TODO')
                            Text('Belum dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'PROGRESS')
                            Text('Sedang dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'DONE')
                            Text('Sudah selesai',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'PENDING')
                            Text('Pending', style: CustomStyles.textMedium13Px),
                          if (status == 'REQUEST')
                            Text('Menunggu persetujuan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'APPROVE')
                            Text('Disetujui',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'REJECTED')
                            Text('Ditolak', style: CustomStyles.textMedium13Px),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Awal tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          startDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(startDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Akhir tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          endDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(endDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Kertas kerja audit',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          kka != null
                              ? SizedBox(
                                  width: 150,
                                  child: Card(
                                    elevation: 0,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: CustomColors.lightGrey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('File',
                                              style:
                                                  CustomStyles.textMedium15Px),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      CustomColors.green,
                                                  shape: CustomStyles
                                                      .customRoundedButton),
                                              onPressed: () async {
                                                if (await requestPermission(
                                                        Permission.storage) ==
                                                    true) {
                                                  downloadKKaAuditRegion(
                                                      '${AppConstant.downloadKKa}${kka.filename}');
                                                } else {
                                                  showSnackbarPermission(
                                                      context);
                                                }
                                              },
                                              child: Text('Unduh',
                                                  style: CustomStyles
                                                      .textMediumWhite15Px)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Text('Anda belum mengunggah KKA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('List laporan harian audit :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          lha != null
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: lha.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return Card(
                                        elevation: 0,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: CustomColors.grey,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  lha[index].isFlag == 1
                                                      ? Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .notifications_rounded,
                                                                color:
                                                                    CustomColors
                                                                        .red,
                                                                size: 20),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                                'Belum melakukan klarifikasi',
                                                                style: CustomStyles
                                                                    .textMediumRed15Px)
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                  'Cabang : ${lha[index].branch!.name}',
                                                  style: CustomStyles
                                                      .textBold15Px),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape: CustomStyles
                                                              .customRoundedButton),
                                                      onPressed: () {
                                                        final lhaId =
                                                            lha[index].id;
                                                        if (lhaId != null) {
                                                          Get.to(() =>
                                                              DetailLhaPageAuditRegion(
                                                                  id: lhaId));
                                                        }
                                                      },
                                                      child: Text(
                                                          'Lihat rincian',
                                                          style: CustomStyles
                                                              .textMediumGreen15Px))
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  })
                              : Text('Anda belum Membuat LHA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      )
                    ],
                  );
                }
              })),
            ],
          )),
    );
  }

  void showDialogUploadKkaAuditRegion(int id) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Upload Excel File"),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Obx(() => Text(controllerAuditRegion.selectedFileName.value,
                    style: CustomStyles.textRegularGrey13Px)),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileKkaAuditRegion(),
                  child: Text('Choose File',
                      style: CustomStyles.textMediumGreen15Px),
                ),
                const SizedBox(height: 10),
                Obx(() => TextButton(
                      onPressed: controllerAuditRegion
                              .selectedFileName.value.isNotEmpty
                          ? () {
                              setState(() {
                                controllerAuditRegion.uploadKkaAuditRegion(
                                  controllerAuditRegion.selectedFileName.value,
                                  id);
                                
                              });
                              Get.back();
                            }
                          : null,
                      child: Text('Upload',
                          style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () {
                  controllerAuditRegion.selectedFileName.value = '';
                   Navigator.of(context).pop();
                }
              ),
            ],
          );
        });
  }
}

//special schedule
class DetailSpecialScheduleAuditRegion extends StatefulWidget {
  final int specialScheduleId;
  final String? kka;
  final String startDate;
  final String endDate;
  const DetailSpecialScheduleAuditRegion(
      {super.key,
      required this.specialScheduleId,
      this.kka,
      required this.startDate,
      required this.endDate});

  @override
  State<DetailSpecialScheduleAuditRegion> createState() =>
      _DetailSpecialScheduleAuditRegionState();
}

class _DetailSpecialScheduleAuditRegionState
    extends State<DetailSpecialScheduleAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    controllerAuditRegion
        .getDetailSpecialScheduleAuditRegion(widget.specialScheduleId);
    super.initState();
  }

  void checkScheduleInputLhaAndKka() {
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    DateTime startDate = inputFormat.parse(widget.startDate);
    DateTime endDate = inputFormat.parse(widget.endDate);

    String formattedStartDate = outputFormat.format(startDate);
    String formattedEndDate = outputFormat.format(endDate);

    DateTime today = DateTime.now();
    String formattedCurrentTime = outputFormat.format(today);

    startDate = DateTime.parse(formattedStartDate);
    endDate = DateTime.parse(formattedEndDate);
    today = DateTime.parse(formattedCurrentTime);

    if (today.isBefore(startDate)) {
      snackBarMessageRed('Alert','Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
    } else if (today.isAfter(endDate)) {
      snackBarMessageRed('Alert', 'Jadwal sudah berakhir');
    }else{
      Get.to(() => InputLhaPageAuditRegion(scheduleId: widget.specialScheduleId));
    }
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion
        .getDetailSpecialScheduleAuditRegion(widget.specialScheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal khusus'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      floatingActionButton: SpeedDial(
        elevation: 0,
        backgroundColor: CustomColors.orange,
        animatedIcon: AnimatedIcons.menu_close,
        renderOverlay: false,
        children: [
          SpeedDialChild(
              backgroundColor: CustomColors.blue,
              label: 'Tambah LHA',
              labelBackgroundColor: CustomColors.blue,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.add_rounded, color: CustomColors.white),
              onTap: () {
                setState(() {
                  checkScheduleInputLhaAndKka();
                });
              }),
          SpeedDialChild(
              backgroundColor: CustomColors.green,
              label: 'Upload KKA',
              labelBackgroundColor: CustomColors.green,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.upload_file_rounded,
                  color: CustomColors.white),
              onTap: () {
                final lha =
                    controllerAuditRegion.detailSpecialSchedule.value?.lha;
                if (lha != null) {
                  if (widget.kka != null) {
                    snackBarMessageGreen('Alert', 'Anda sudah mengunggah KKA');
                  } else {
                    setState(() {
                      showDialogUploadKkaAuditRegion(widget.specialScheduleId);
                    });
                  }
                } else {
                  snackBarMessageRed(
                      'Alert', 'Anda harus membuat LHA terlebih dahulu');
                }
              }),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SwipeRefresh.material(
            stateStream: refreshController.stream,
            onRefresh: () {
              controllerAuditRegion.getDetailSpecialScheduleAuditRegion(
                  widget.specialScheduleId);
            },
            children: [
              SingleChildScrollView(child: Obx(() {
                if (controllerAuditRegion.detailSpecialSchedule.value == null) {
                  return const Center(
                      child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  final detail = controllerAuditRegion
                      .detailSpecialSchedule.value?.schedule;
                  final kka =
                      controllerAuditRegion.detailSpecialSchedule.value?.kka;
                  final lha =
                      controllerAuditRegion.detailSpecialSchedule.value?.lha;
                  
                  final status = detail?.status;
                  final startDateRealization =
                      detail?.startDateRealization != null
                          ? DateTime.parse('${detail?.startDateRealization}')
                          : null;
                  final endDateRealization = detail?.endDateRealization != null
                      ? DateTime.parse('${detail?.endDateRealization}')
                      : null;

                  final startDate = DateTime.parse('${detail?.startDate}');
                  final endDate = DateTime.parse('${detail?.endDate}');

                  refreshController.add(SwipeRefreshState.hidden);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Auditor :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail!.user!.fullname}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Nama cabang :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${detail.branch!.name}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Tanggal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          '${DateFormat('dd-MM-yyyy').format(startDate)} s/d ${DateFormat('dd-MM-yyyy').format(endDate)}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(detail.description ?? '-',
                          style: CustomStyles.textRegular13Px,
                          textAlign: TextAlign.justify),
                      const SizedBox(height: 20),
                      Text('Status :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          if (status == 'TODO')
                            Text('Belum dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'PROGRESS')
                            Text('Sedang dikerjakan',
                                style: CustomStyles.textMedium13Px),
                          if (status == 'DONE')
                            Text('Sudah selesai',
                                style: CustomStyles.textMedium13Px),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Awal tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          startDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(startDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Akhir tanggal proses :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text(
                          endDateRealization != null
                              ? DateFormat('dd-MM-yyyy')
                                  .format(endDateRealization)
                              : '-',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 20),
                      Text('Kertas kerja audit',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          kka != null
                              ? SizedBox(
                                  width: 150,
                                  child: Card(
                                    elevation: 0,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: CustomColors.lightGrey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('File',
                                              style:
                                                  CustomStyles.textMedium15Px),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      CustomColors.green,
                                                  shape: CustomStyles
                                                      .customRoundedButton),
                                              onPressed: () async {
                                                if (await requestPermission(
                                                        Permission.storage) ==
                                                    true) {
                                                  downloadKKaAuditRegion(
                                                      '${AppConstant.downloadKKa}${kka.filename}');
                                                } else {
                                                  showSnackbarPermission(
                                                      context);
                                                }
                                              },
                                              child: Text('Unduh',
                                                  style: CustomStyles
                                                      .textMediumWhite15Px)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Text('Anda belum mengunggah KKA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('List laporan harian audit :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          lha != null
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: lha.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return Card(
                                        elevation: 0,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: CustomColors.grey,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: [
                                                  lha[index].isFlag == 1
                                                      ? Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .notifications_rounded,
                                                                color:
                                                                    CustomColors
                                                                        .red,
                                                                size: 20),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                                'Belum melakukan klarifikasi',
                                                                style: CustomStyles
                                                                    .textMediumRed15Px)
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                  'Cabang : ${lha[index].branch!.name}',
                                                  style: CustomStyles
                                                      .textBold15Px),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style: TextButton.styleFrom(
                                                          shape: CustomStyles
                                                              .customRoundedButton),
                                                      onPressed: () {
                                                        final lhaId =
                                                            lha[index].id;
                                                        if (lhaId != null) {
                                                          Get.to(() =>
                                                              DetailLhaPageAuditRegion(
                                                                  id: lhaId));
                                                        }
                                                      },
                                                      child: Text(
                                                          'Lihat rincian',
                                                          style: CustomStyles
                                                              .textMediumGreen15Px))
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  })
                              : Text('Anda belum Membuat LHA',
                                  style: CustomStyles.textRegular13Px)
                        ],
                      )
                    ],
                  );
                }
              })),
            ],
          )),
    );
  }

  void showDialogUploadKkaAuditRegion(int id) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Upload Excel File"),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Obx(() => Text(controllerAuditRegion.selectedFileName.value,
                    style: CustomStyles.textRegularGrey13Px)),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileKkaAuditRegion(),
                  child: Text('Choose File',
                      style: CustomStyles.textMediumGreen15Px),
                ),
                const SizedBox(height: 10),
                Obx(() => TextButton(
                      onPressed: controllerAuditRegion
                              .selectedFileName.value.isNotEmpty
                          ? () {
                              setState(() {
                                controllerAuditRegion.uploadKkaAuditRegion(
                                  controllerAuditRegion.selectedFileName.value,
                                  id);
                              });
                              Get.back();
                            }
                          : null,
                      child: Text('Upload',
                          style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () {
                  controllerAuditRegion.selectedFileName.value = '';
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        });
  }
}
