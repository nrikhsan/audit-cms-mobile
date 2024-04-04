import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/kka/widgetKka/widket_kka.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
import 'package:audit_cms/pages/lha/input_lha_page_audit_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

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
        child: SingleChildScrollView(
          child: Obx(() {
            final schedule = controllerAuditArea.detailMainScheduleAuditArea.value;
          if (schedule == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = schedule.schedule;
            final kka = schedule.kka;
            final lha = schedule.lha;
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
                Text('${detail.startDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),

                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.endDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
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
                                downloadKka(kka!.filePath!);
                              },
                              child: Text('Unduh',
                                  style: CustomStyles.textMediumWhite15Px)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha!.length,
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
                                          shape:
                                              CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => ListLhaCasesPageAuditArea(lhaId: lha[index].id!));
                                      },
                                      child: Text('Kasus',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditArea(id: lha[index].id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    })
              ],
            );
          }
        })
        ),
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
        child: SingleChildScrollView(
          child: Obx(() {
          if (controllerAuditArea.detailSpecialScheduleAuditArea.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = controllerAuditArea.detailSpecialScheduleAuditArea.value!.schedule;
            final kka = controllerAuditArea.detailSpecialScheduleAuditArea.value!.kka;
            final lha = controllerAuditArea.detailSpecialScheduleAuditArea.value!.lha;
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
                Text('${detail.startDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.endDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
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
                                downloadKka(kka!.filePath!);
                              },
                              child: Text('Unduh',
                                  style: CustomStyles.textMediumWhite15Px)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha!.length,
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
                                          shape:
                                              CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => ListLhaCasesPageAuditArea(lhaId: lha[index].id!));
                                      },
                                      child: Text('Kasus',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditArea(id: lha[index].id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    })
              ],
            );
          }
        })),
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
        child: SingleChildScrollView(child: Obx(() {
          if (controllerAuditArea.detailRescheduleAuditArea.value == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final detail = controllerAuditArea.detailRescheduleAuditArea.value!.schedule;
            final kka = controllerAuditArea.detailRescheduleAuditArea.value!.kka;
            final lha = controllerAuditArea.detailRescheduleAuditArea.value!.lha;
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
                Text('${detail.startDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.endDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
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
                                downloadKka(kka!.filePath!);
                              },
                              child: Text('Unduh',
                                  style: CustomStyles.textMediumWhite15Px)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 10),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha!.length,
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
                                          shape:
                                              CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => ListLhaCasesPageAuditArea(lhaId: lha[index].id!));
                                      },
                                      child: Text('Revisi',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditArea(id: lha[index].id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    })
              ],
            );
          }
        })),
      ),
    );
  }
}


//audit region
//main schedule
class DetailMainScheduleAuditRegion extends StatefulWidget {
  final int mainScheduleId;
  const DetailMainScheduleAuditRegion({super.key, required this.mainScheduleId});

  @override
  State<DetailMainScheduleAuditRegion> createState() =>
      _DetailMainScheduleAuditRegionState();
}

class _DetailMainScheduleAuditRegionState extends State<DetailMainScheduleAuditRegion> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

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
                        Navigator.push(context, MaterialPageRoute(builder: (_) => InputLhaPageAuditRegion(scheduleId: widget.mainScheduleId)));
                      }
                    ),
              SpeedDialChild(
                backgroundColor: CustomColors.green,
                  label: 'Upload KKA',
                  labelBackgroundColor: CustomColors.green,
                  labelStyle: CustomStyles.textMediumWhite15Px,
                  child: const Icon(Icons.upload_file_rounded, color: CustomColors.white),
                  onTap: (){
                          showDialogUploadKkaAuditRegion();
                        }
                    ),
                  ],
                ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(child: Obx(() {
          final detail = controllerAuditRegion.detailMainSchedule.value?.schedule;
          final lha = controllerAuditRegion.detailMainSchedule.value?.lha;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.user!.fullname}', style: CustomStyles.textRegular13Px),
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
                Text('${detail.startDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.endDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 15),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha!.length,
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
                                          shape:
                                              CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => ListLhaCasesPageAuditArea(lhaId: lha[index].id!));
                                      },
                                      child: Text('Revisi',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditArea(id: lha[index].id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    })
              ],
            );
          }
        })),
      ),
    );
  }
  
  void showDialogUploadKkaAuditRegion() {
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
                            controllerAuditRegion.uploadKkaAuditRegion(controllerAuditRegion.selectedFileName.value);
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
  const DetailSpecialScheduleAuditRegion({super.key, required this.specialScheduleId});

  @override
  State<DetailSpecialScheduleAuditRegion> createState() => _DetailSpecialScheduleAuditRegionState();
}

class _DetailSpecialScheduleAuditRegionState extends State<DetailSpecialScheduleAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailScheduleAuditRegion(widget.specialScheduleId);
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => InputLhaPageAuditRegion(scheduleId: widget.specialScheduleId)));
              }
          ),
          SpeedDialChild(
              backgroundColor: CustomColors.green,
              label: 'Upload KKA',
              labelBackgroundColor: CustomColors.green,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.upload_file_rounded, color: CustomColors.white),
              onTap: (){
                showDialogUploadKkaAuditRegion();
              }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(child: Obx(() {
          final detail = controllerAuditRegion.detailMainSchedule.value?.schedule;
          final lha = controllerAuditRegion.detailMainSchedule.value?.lha;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.user!.fullname}', style: CustomStyles.textRegular13Px),
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
                Text('${detail.startDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Akhir tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.endDateRealization}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Kertas kerja audit', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 15),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lha!.length,
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
                                          shape:
                                              CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => ListLhaCasesPageAuditArea(lhaId: lha[index].id!));
                                      },
                                      child: Text('Revisi',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditArea(id: lha[index].id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                    })
              ],
            );
          }
        })),
      ),
    );
  }
  void showDialogUploadKkaAuditRegion() {
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
                    controllerAuditRegion.uploadKkaAuditRegion(controllerAuditRegion.selectedFileName.value);
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

//reschedule
class DetailRescheduleAuditRegion extends StatefulWidget {
  final int rescheduleId;
  const DetailRescheduleAuditRegion({super.key, required this.rescheduleId});

  @override
  State<DetailRescheduleAuditRegion> createState() => _DetailRescheduleAuditRegionState();
}

class _DetailRescheduleAuditRegionState extends State<DetailRescheduleAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailScheduleAuditRegion(widget.rescheduleId);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail reschedule'),
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => InputLhaPageAuditRegion(scheduleId: widget.rescheduleId)));
              }
          ),
          SpeedDialChild(
              backgroundColor: CustomColors.green,
              label: 'Upload KKA',
              labelBackgroundColor: CustomColors.green,
              labelStyle: CustomStyles.textMediumWhite15Px,
              child: const Icon(Icons.upload_file_rounded, color: CustomColors.white),
              onTap: (){
                showDialogUploadKkaAuditRegion();
              }
          ),
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: SingleChildScrollView(child: Obx(() {
      //     final detail = controllerAuditRegion.detailScheduleAuditRegion.value;
      //     if (detail == null) {
      //       return const Center(child: SpinKitCircle(color: CustomColors.blue));
      //     } else {
      //       return Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.max,
      //         children: [
      //           Text('Nama cabang :', style: CustomStyles.textBold15Px),
      //           const SizedBox(height: 5),
      //           Text('${detail.branch}', style: CustomStyles.textRegular13Px),
      //           const SizedBox(height: 20),
      //           Text('Tanggal :', style: CustomStyles.textBold15Px),
      //           const SizedBox(height: 5),
      //           Text('${detail.startDate} s/d ${detail.endDate}',
      //               style: CustomStyles.textRegular13Px),
      //           const SizedBox(height: 20),
      //           Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
      //           const SizedBox(height: 5),
      //           Text('${detail.scheduleDescription}',
      //               style: CustomStyles.textRegular13Px,
      //               textAlign: TextAlign.justify),
      //           const SizedBox(height: 20),
      //           Text('Status :', style: CustomStyles.textBold15Px),
      //           const SizedBox(height: 5),
      //           Text('${detail.status}', style: CustomStyles.textRegular13Px),
      //           const SizedBox(height: 20),
      //           Text('Tanggal proses :', style: CustomStyles.textBold15Px),
      //           const SizedBox(height: 5),
      //           Text('${detail.dateProcess}',
      //               style: CustomStyles.textRegular13Px),
      //           const SizedBox(height: 20),

      //           Text('List laporan harian audit :',
      //               style: CustomStyles.textBold15Px),
      //           const SizedBox(height: 15),
      //           ListView.builder(
      //               physics: const NeverScrollableScrollPhysics(),
      //               itemCount: detail.lha!.length,
      //               shrinkWrap: true,
      //               itemBuilder: (_, index) {
      //                 final lha = detail.lha![index];
      //                 return Card(
      //                     elevation: 0,
      //                     shape: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                         borderSide: const BorderSide(
      //                           color: CustomColors.grey,
      //                         )),
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(15),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment:
      //                             MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Icon(lha.research == 0 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 20),
      //                               Text('${lha.inputDate}',
      //                                   style: CustomStyles.textBold15Px),
      //                             ],
      //                           ),
      //                           const SizedBox(height: 15),
      //                           Text('Cabang : ${lha.branch}',
      //                               style: CustomStyles.textMedium15Px),
      //                           const SizedBox(height: 10),
      //                           Text('Kategori SOP : ${lha.sopCategory}',
      //                               style: CustomStyles.textMedium15Px),

      //                           const SizedBox(height: 10),
      //                           Text('Tanggal LHA : ${lha.inputDate}',
      //                               style: CustomStyles.textMedium15Px),

      //                           const SizedBox(height: 15),
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.end,
      //                             children: [
      //                               ElevatedButton(
      //                                   style: ElevatedButton.styleFrom(
      //                                       shape:
      //                                       CustomStyles.customRoundedButton,
      //                                       backgroundColor: CustomColors.blue),
      //                                   onPressed: () {
      //                                     Get.to(() => DetailLhaPageAuditRegion(id: detail.id!));
      //                                   },
      //                                   child: Text('Lihat rincian',
      //                                       style:
      //                                       CustomStyles.textMediumWhite15Px))
      //                             ],
      //                           )
      //                         ],
      //                       ),
      //                     ));
      //               })
      //         ],
      //       );
      //     }
      //   })),
      // ),
    );
  }
  void showDialogUploadKkaAuditRegion() {
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
                    controllerAuditRegion.uploadKkaAuditRegion(controllerAuditRegion.selectedFileName.value);
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

