import 'package:audit_cms/data/controller/controllers.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:flutter/material.dart';
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
  final ControllerAllData controllerAllData = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAllData.getDetailSchedule(widget.id);

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
          final detail = controllerAllData.detailSchedule.value;
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
                      if (lha.research == true) {
                        return Card(
                            elevation: 0,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: CustomColors.lightGrey,
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
                                      const Icon(
                                          Icons.notifications_active_rounded,
                                          color: CustomColors.red,
                                          size: 20),
                                      Text('${lha.inputDate}',
                                          style: CustomStyles.textBold15Px),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text('${lha.auditor}',
                                      style: CustomStyles.textMedium15Px),
                                  const SizedBox(height: 5),
                                  Text('${lha.branch}',
                                      style: CustomStyles.textMedium15Px),
                                  const SizedBox(height: 5),
                                  Text('${lha.area}',
                                      style: CustomStyles.textMedium15Px),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: CustomStyles
                                                  .customRoundedButton,
                                              backgroundColor:
                                                  CustomColors.blue),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        DetailLhaPageAuditArea(
                                                            id: lha.id!)));
                                          },
                                          child: Text('Lihat rincian',
                                              style: CustomStyles
                                                  .textMediumWhite15Px))
                                    ],
                                  )
                                ],
                              ),
                            ));
                      } else {
                        return Card(
                            elevation: 0,
                            color: CustomColors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: CustomColors.lightGrey,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('${lha.inputDate}',
                                          style: CustomStyles.textBold15Px),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text('${lha.auditor}',
                                      style: CustomStyles.textMedium15Px),
                                  const SizedBox(height: 5),
                                  Text('${lha.branch}',
                                      style: CustomStyles.textMedium15Px),
                                  const SizedBox(height: 5),
                                  Text('${lha.area}',
                                      style: CustomStyles.textMedium15Px),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: CustomStyles
                                                  .customRoundedButton,
                                              backgroundColor:
                                                  CustomColors.blue),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        DetailLhaPageAuditArea(
                                                            id: lha.id!)));
                                          },
                                          child: Text('Lihat rincian',
                                              style: CustomStyles
                                                  .textMediumWhite15Px))
                                    ],
                                  )
                                ],
                              ),
                            ));
                      }
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
  const DetailScheduleAuditRegion({super.key});

  @override
  State<DetailScheduleAuditRegion> createState() =>
      _DetailScheduleAuditRegionState();
}

class _DetailScheduleAuditRegionState extends State<DetailScheduleAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
