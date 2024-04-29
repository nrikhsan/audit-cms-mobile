import 'dart:async';

import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
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
import 'package:permission_handler/permission_handler.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

//audit area
//main schedule
class DetailMainSchedulePageAuditArea extends StatefulWidget {
  final int mainScheduleId;
  const DetailMainSchedulePageAuditArea({super.key, required this.mainScheduleId});

  @override
  State<DetailMainSchedulePageAuditArea> createState() =>
      _DetailMainSchedulePageAuditAreaState();
}

class _DetailMainSchedulePageAuditAreaState extends State<DetailMainSchedulePageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

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
        child: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
          controllerAuditArea.getDetailMainScheduleAuditArea(widget.mainScheduleId);
        },
        children: [
          SingleChildScrollView(
          child: Obx(() {
            final schedule = controllerAuditArea.detailMainScheduleAuditArea.value;
          if (schedule == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = schedule.schedule;
            final kka = schedule.kka;
            final lha = schedule.lha;
            final startDate = detail?.startDateRealization;
            final endDate = detail?.endDateRealization;
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail!.user!.fullname}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.description}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),

                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Awal tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(startDate != null ? '${detail.startDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(endDate != null ? '${detail.endDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Wrap(
                  children: [
                    kka != null ? 
                    SizedBox(
                      width: 150,
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.lightGrey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('File', style: CustomStyles.textMedium15Px),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColors.green,
                                      shape: CustomStyles.customRoundedButton),
                                  onPressed: () async {
                                   if (await requestPermission(Permission.storage) == true) {
                                     downloadKKaAuditArea('${AppConstant.downloadKKa}${kka.filename}');
                                   } else {
                                     showSnackbarPermission(context);
                                   }
                                  },
                                  child: Text('Unduh',
                                      style: CustomStyles.textMediumWhite15Px)),
                            ],
                          ),
                        ),
                      ),
                    ) : Text('Auditor belum mengunggah KKA', style: CustomStyles.textRegular13Px)
                  ],
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    lha != null ?
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final isFlag = lha[index].isFlag;
                      return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  isFlag == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),

                              Text('Cabang : ${lha[index].branch!.name}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        final lhaId = lha[index].id;
                                        if (lhaId != null) {
                                          Get.to(() => DetailLhaPageAuditArea(id:lhaId));
                                        }
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    }) : Text('Auditor belum Membuat LHA', style: CustomStyles.textRegular13Px)
                  ],
                )
              ],
            );
          }
        }))
        ],)
      ),
    );
  }
}

//special schedule
class DetailSpecialSchedulePageAuditArea extends StatefulWidget {
  final int specialScheduleId;
  const DetailSpecialSchedulePageAuditArea({super.key, required this.specialScheduleId});

  @override
  State<DetailSpecialSchedulePageAuditArea> createState() => _DetailSpecialSchedulePageAuditAreaState();
}

class _DetailSpecialSchedulePageAuditAreaState extends State<DetailSpecialSchedulePageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailSpecialScheduleAuditArea(widget.specialScheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal khusus'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
          controllerAuditArea.getDetailSpecialScheduleAuditArea(widget.specialScheduleId);
        },
        children: [
          SingleChildScrollView(
          child: Obx(() {
          if (controllerAuditArea.detailSpecialScheduleAuditArea.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = controllerAuditArea.detailSpecialScheduleAuditArea.value?.schedule;
            final kka = controllerAuditArea.detailSpecialScheduleAuditArea.value?.kka;
            final lha = controllerAuditArea.detailSpecialScheduleAuditArea.value?.lha;
            final startDate = detail?.startDateRealization;
            final endDate = detail?.endDateRealization;
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail!.user!.fullname}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.description}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),
                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Awal tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(startDate != null ? '${detail.startDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(endDate != null ? '${detail.endDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Wrap(
                  children: [
                    kka != null ? 
                    SizedBox(
                      width: 150,
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.lightGrey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('File', style: CustomStyles.textMedium15Px),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColors.green,
                                      shape: CustomStyles.customRoundedButton),
                                  onPressed: () async {
                                    if (await requestPermission(Permission.storage) == true) {
                                     downloadKKaAuditArea('${AppConstant.downloadKKa}${kka.filename}');
                                   } else {
                                     showSnackbarPermission(context);
                                   }
                                  },
                                  child: Text('Unduh',
                                      style: CustomStyles.textMediumWhite15Px)),
                            ],
                          ),
                        ),
                      ),
                    ) : Text('Auditor belum mengunggah KKA', style: CustomStyles.textRegular13Px)
                  ],
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    lha != null ?
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  lha[index].isFlag == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),

                              Text('Cabang : ${lha[index].branch!.name}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        final lhaId = lha[index].id;
                                        if (lhaId != null) {
                                          Get.to(() => DetailLhaPageAuditArea(id:lhaId));
                                        }
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    }) : Text('Auditor belum Membuat LHA', style: CustomStyles.textRegular13Px)
                  ],
                )
              ],
            );
          }
        })),
        ],)
      ),
    );
  }
}

//reschedule
class DetailReschedulePageAuditArea extends StatefulWidget {
  final int rescheduleId;
  const DetailReschedulePageAuditArea({super.key, required this.rescheduleId});

  @override
  State<DetailReschedulePageAuditArea> createState() => _DetailReschedulePageAuditAreaState();
}

class _DetailReschedulePageAuditAreaState extends State<DetailReschedulePageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

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
        child: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
          controllerAuditArea.getDetailRescheduleAuditArea(widget.rescheduleId);
        },
        children: [
          SingleChildScrollView(
            child: Obx(() {
          if (controllerAuditArea.detailRescheduleAuditArea.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = controllerAuditArea.detailRescheduleAuditArea.value!.schedule;
            final kka = controllerAuditArea.detailRescheduleAuditArea.value!.kka;
            final lha = controllerAuditArea.detailRescheduleAuditArea.value!.lha;
            final startDate = detail?.startDateRealization;
            final endDate = detail?.endDateRealization;
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail!.user!.fullname}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.description}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),
                Text('Kategori :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.category}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
               Text('Awal tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(startDate != null ? '${detail.startDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(endDate != null ? '${detail.endDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Wrap(
                  children: [
                    kka != null ?
                    SizedBox(
                  width: 150,
                  child: Card(
                    elevation: 0,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: CustomColors.lightGrey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('File', style: CustomStyles.textMedium15Px),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: CustomColors.green,
                                  shape: CustomStyles.customRoundedButton),
                              onPressed: () async {
                                if (await requestPermission(Permission.storage) == true) {
                                     downloadKKaAuditArea('${AppConstant.downloadKKa}${kka.filename}');
                                   } else {
                                     showSnackbarPermission(context);
                                   }
                              },
                              child: Text('Unduh',
                                  style: CustomStyles.textMediumWhite15Px)),
                        ],
                      ),
                    ),
                  ),
                ) : Text('Anda belum mengunggah KKA', style: CustomStyles.textRegular13Px)
                  ],
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    lha != null ?
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  lha[index].isFlag == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Perlu melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),

                              Text('Cabang : ${lha[index].branch!.name}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        final lhaId = lha[index].id;
                                        if (lhaId != null) {
                                          Get.to(() => DetailLhaPageAuditArea(id:lhaId));
                                        }
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    }) : Text('Anda belum Membuat LHA', style: CustomStyles.textRegular13Px)
                  ],
                )
              ],
            );
          }
        })),
        ],)
      ),
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
  const DetailMainScheduleAuditRegion({super.key, required this.mainScheduleId, this.kka, required this.startDate, required this.endDate});

  @override
  State<DetailMainScheduleAuditRegion> createState() =>
      _DetailMainScheduleAuditRegionState();
}

class _DetailMainScheduleAuditRegionState extends State<DetailMainScheduleAuditRegion> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  void checkScheduleInputLhaAndKka(){
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

  if (today.isAfter(startDate) || today.isBefore(endDate)) {
      Get.to(() => InputLhaPageAuditRegion(scheduleId: widget.mainScheduleId));
  } else {
      snakcBarMessageRed('Alert', 'Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
    }
  }


  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailMainScheduleAuditRegion(widget.mainScheduleId);
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
                  onTap: (){
                    checkScheduleInputLhaAndKka();
                  }
                ),
              SpeedDialChild(
                backgroundColor: CustomColors.green,
                  label: 'Upload KKA',
                  labelBackgroundColor: CustomColors.green,
                  labelStyle: CustomStyles.textMediumWhite15Px,
                  child: const Icon(Icons.upload_file_rounded, color: CustomColors.white),
                  onTap: (){
                    final lha = controllerAuditRegion.detailMainSchedule.value?.lha;
                    if (lha != null) {
                      if (widget.kka != null) {
                        snakcBarMessageGreen('Alert', 'Anda sudah mengunggah KKA');
                      } else {
                        showDialogUploadKkaAuditRegion(widget.mainScheduleId);
                      }
                    } else {
                      snakcBarMessageRed('Alert', 'Anda harus membuat LHA terlebih dahulu');
                    }
                      }
                    ),
                  ],
                ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
          controllerAuditRegion.getDetailMainScheduleAuditRegion(widget.mainScheduleId);
        },
        children: [
          SingleChildScrollView(
          child: Obx(() {
            final schedule = controllerAuditRegion.detailMainSchedule.value;
          if (schedule == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = schedule.schedule;
            final kka = schedule.kka;
            final lha = schedule.lha;
            final startDate = detail?.startDateRealization;
            final endDate = detail?.endDateRealization;
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail!.user!.fullname}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.description}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),

                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Awal tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(startDate != null ? '${detail.startDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(endDate != null ? '${detail.endDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Wrap(
                  children: [
                    kka != null ? 
                    SizedBox(
                      width: 150,
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.lightGrey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('File', style: CustomStyles.textMedium15Px),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColors.green,
                                      shape: CustomStyles.customRoundedButton),
                                  onPressed: () async {
                                   if (await requestPermission(Permission.storage) == true) {
                                     downloadKKaAuditRegion('${AppConstant.downloadKKa}${kka.filename}');
                                   } else {
                                     showSnackbarPermission(context);
                                   }
                                  },
                                  child: Text('Unduh',
                                      style: CustomStyles.textMediumWhite15Px)),
                            ],
                          ),
                        ),
                      ),
                    ) : Text('Anda belum mengunggah KKA', style: CustomStyles.textRegular13Px)
                  ],
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    lha != null ?
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  lha[index].isFlag == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),

                              Text('Cabang : ${lha[index].branch!.name}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        final lhaId = lha[index].id;
                                        if (lhaId != null) {
                                          Get.to(() => DetailLhaPageAuditRegion(id:lhaId));
                                        }
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    }) : Text('Anda belum Membuat LHA', style: CustomStyles.textRegular13Px)
                  ],
                )
              ],
            );
          }
        })),
        ],)
      ),
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

                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileKkaAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => TextButton(
                      onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                      ? () {
                            controllerAuditRegion.uploadKkaAuditRegion(controllerAuditRegion.selectedFileName.value, id);
                            Get.back();
                         }
                      : null,
                      child: Text('Upload', style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
      );
  }
}

//special schedule
class DetailSpecialScheduleAuditRegion extends StatefulWidget {
  final int specialScheduleId;
  final String? kka;
  final String startDate;
  final String endDate;
  const DetailSpecialScheduleAuditRegion({super.key, required this.specialScheduleId, this.kka, required this.startDate, required this.endDate});

  @override
  State<DetailSpecialScheduleAuditRegion> createState() => _DetailSpecialScheduleAuditRegionState();
}

class _DetailSpecialScheduleAuditRegionState extends State<DetailSpecialScheduleAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  void checkScheduleInputLhaAndKka(){
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

  if (today.isAfter(startDate) || today.isBefore(endDate)) {
      Get.to(() => InputLhaPageAuditRegion(scheduleId: widget.specialScheduleId));
      
  } else {
      snakcBarMessageRed('Alert', 'Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
    }
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailSpecialScheduleAuditRegion(widget.specialScheduleId);
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
              onTap: (){
                checkScheduleInputLhaAndKka();
              }
          ),
          SpeedDialChild(
              backgroundColor: CustomColors.green,
              label: 'Upload KKA',
              labelBackgroundColor: CustomColors.green,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.upload_file_rounded, color: CustomColors.white),
              onTap: (){
                final lha = controllerAuditRegion.detailSpecialSchedule.value?.lha;
                if (lha != null) {
                      if (widget.kka != null) {
                        snakcBarMessageGreen('Alert', 'Anda sudah mengunggah KKA');
                      } else {
                        showDialogUploadKkaAuditRegion(widget.specialScheduleId);
                      }
                    } else {
                      snakcBarMessageRed('Alert', 'Anda harus membuat LHA terlebih dahulu');
                    }
              }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
          controllerAuditRegion.getDetailSpecialScheduleAuditRegion(widget.specialScheduleId);
        },
        children: [
          SingleChildScrollView(child: Obx(() {
          if (controllerAuditRegion.detailSpecialSchedule.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = controllerAuditRegion.detailSpecialSchedule.value?.schedule;
            final kka = controllerAuditRegion.detailSpecialSchedule.value?.kka;
            final lha = controllerAuditRegion.detailSpecialSchedule.value?.lha;
            final startDate = detail?.startDateRealization;
            final endDate = detail?.endDateRealization;
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail!.user!.fullname}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch!.name}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.description}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),
                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Awal tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(startDate != null ? '${detail.startDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text(endDate != null ? '${detail.endDateRealization}' : '-',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Wrap(
                  children: [
                    kka != null ? 
                    SizedBox(
                      width: 150,
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: CustomColors.lightGrey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('File', style: CustomStyles.textMedium15Px),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColors.green,
                                      shape: CustomStyles.customRoundedButton),
                                  onPressed: () async {
                                    if (await requestPermission(Permission.storage) == true) {
                                     downloadKKaAuditRegion('${AppConstant.downloadKKa}${kka.filename}');
                                   } else {
                                     showSnackbarPermission(context);
                                   }
                                  },
                                  child: Text('Unduh',
                                      style: CustomStyles.textMediumWhite15Px)),
                            ],
                          ),
                        ),
                      ),
                    ) : Text('Anda belum mengunggah KKA', style: CustomStyles.textRegular13Px)
                  ],
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    lha != null ?
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  lha[index].isFlag == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),

                              Text('Cabang : ${lha[index].branch!.name}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        final lhaId = lha[index].id;
                                        if (lhaId != null) {
                                         Get.to(() => DetailLhaPageAuditRegion(id:lhaId));
                                        }
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    }) : Text('Anda belum Membuat LHA', style: CustomStyles.textRegular13Px)
                  ],
                )
              ],
            );
          }
        })),
        ],)
      ),
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

                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileKkaAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => TextButton(
                  onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                      ? () {
                    controllerAuditRegion.uploadKkaAuditRegion(controllerAuditRegion.selectedFileName.value, id);
                    Get.back();
                  }
                      : null,
                  child: Text('Upload', style: CustomStyles.textMediumBlue15Px),
                )),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
    );
  }
}

