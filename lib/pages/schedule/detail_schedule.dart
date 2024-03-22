import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
import 'package:audit_cms/pages/lha/input_lha_page_audit_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//audit area
class DetailSChedulePageAuditAreaState extends StatefulWidget {
  final int id;
  const DetailSChedulePageAuditAreaState({super.key, required this.id});

  @override
  State<DetailSChedulePageAuditAreaState> createState() =>
      _DetailSChedulePageAuditAreaStateState();
}

class _DetailSChedulePageAuditAreaStateState
    extends State<DetailSChedulePageAuditAreaState> {
  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailSchedule(widget.id);

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal'),
        titleTextStyle: CustomStyles.textBold18Px,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(child: Obx(() {
          final detail = controllerAuditArea.detailScheduleAuditArea.value;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Auditor :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.auditor}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.scheduleDescription}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),
                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.dateProcess}',
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
                                openKkaDoc(detail.kka!.kkaDoc);
                              },
                              child: Text('Lihat',
                                  style: CustomStyles.textMediumWhite15Px)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: detail.lha!.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final lha = detail.lha![index];
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(lha.research! ? Icons.notifications_rounded : null, color: CustomColors.red, size: 20),
                                  Text('${lha.inputDate}',
                                      style: CustomStyles.textBold15Px),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text('Auditor : ${lha.auditor}',
                                  style: CustomStyles.textMedium15Px),
                              const SizedBox(height: 5),
                              Text('Cabang : ${lha.branch}',
                                  style: CustomStyles.textMedium15Px),
                              const SizedBox(height: 5),
                              Text('Area : ${lha.area}',
                                  style: CustomStyles.textMedium15Px),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.green),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => EditLhaPageAuditArea(id: lha.id!, lhaDescription: lha.lhaDescription!)));
                                      },
                                      child: Text('Edit',
                                          style: CustomStyles
                                              .textMediumWhite15Px)),
                                  const SizedBox(width: 5),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    DetailLhaPageAuditArea(id: lha.id!)));
                                      },
                                      child: Text('Lihat rincian',
                                          style:
                                              CustomStyles.textMediumWhite15Px))
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
  
  void openKkaDoc(String? kkaDoc)async {
    if (await canLaunch(kkaDoc!)) {
    await launch(
      kkaDoc,
      forceSafariVC: false,
      forceWebView: false,
      enableJavaScript: true,
    );
  } else {
    throw 'Could not launch $kkaDoc';
  }
  }
}

//audit region
class DetailScheduleAuditRegion extends StatefulWidget {
  final int id;
  const DetailScheduleAuditRegion({super.key, required this.id});

  @override
  State<DetailScheduleAuditRegion> createState() =>
      _DetailScheduleAuditRegionState();
}

class _DetailScheduleAuditRegionState extends State<DetailScheduleAuditRegion> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailScheduleAuditRegion(widget.id);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail jadwal'),
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
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const InputLhaPageAuditRegion()));
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
          final detail = controllerAuditRegion.detailScheduleAuditRegion.value;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Nama cabang :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.branch}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.startDate} s/d ${detail.endDate}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Uraian jadwal :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.scheduleDescription}',
                    style: CustomStyles.textRegular13Px,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),
                Text('Status :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.status}', style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                Text('Tanggal proses :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 5),
                Text('${detail.dateProcess}',
                    style: CustomStyles.textRegular13Px),
                const SizedBox(height: 20),
                
                Text('List laporan harian audit :',
                    style: CustomStyles.textBold15Px),
                const SizedBox(height: 15),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: detail.lha!.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final lha = detail.lha![index];
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(lha.research == 0 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 20),
                                  Text('${lha.inputDate}',
                                      style: CustomStyles.textBold15Px),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text('Divisi : ${lha.division}',
                                  style: CustomStyles.textMedium15Px),
                              const SizedBox(height: 5),
                              Text('Kategori SOP : ${lha.sopCategory}',
                                  style: CustomStyles.textMedium15Px),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.blue),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditRegion(id: detail.id!));
                                      },
                                      child: Text('Lihat rincian',
                                          style:
                                              CustomStyles.textMediumWhite15Px))
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
