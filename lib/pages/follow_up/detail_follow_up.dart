import 'dart:async';

import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class DetailFollowUpPageAuditArea extends StatefulWidget {
  final int? id;

  const DetailFollowUpPageAuditArea({super.key, required this.id});

  @override
  State<DetailFollowUpPageAuditArea> createState() =>
      _DetailFollowUpPageAuditAreaState();
}

class _DetailFollowUpPageAuditAreaState
    extends State<DetailFollowUpPageAuditArea> {
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    controllerAuditArea.followUpDetailId.value = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailFollowUpAuditArea(controllerAuditArea.followUpDetailId.value);
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          title: const Text('Detail tindak lanjut'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          backgroundColor: CustomColors.white,
        ),
        body: Obx(() {
          final followUp = controllerAuditArea.detailFollowUpAuditArea.value;
          if (followUp == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            refreshController.add(SwipeRefreshState.hidden);
            return SwipeRefresh.material(
              stateStream: refreshController.stream,
              onRefresh: () {
                controllerAuditArea.getDetailFollowUpAuditArea(widget.id);
              },
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kode Tindak lanjut :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.code}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 15),
                      Text('Status :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.status}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 15),
                      Text('Auditor :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.user!.fullname}',
                          style: CustomStyles.textRegular13Px),
                      
                      const SizedBox(height: 15),
                      Text('Tanggal klarifikasi :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.clarification!.evaluationLimitation}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 15),
                      Text('Kode klarifikasi :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.clarification!.code}',
                          style: CustomStyles.textRegular13Px),
                      const SizedBox(height: 15),
                       Visibility(
                            visible: followUp.penalty!.isEmpty ? false : true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sanksi :', style: CustomStyles.textBold15Px),
                                const SizedBox(height: 5),
                                ListView.builder(
                                shrinkWrap: true,
                                itemCount: followUp.penalty?.length,
                                itemBuilder: (_, index){
                                    final name = followUp.penalty?[index].name;
                                    return Text('\u2022  ${name ?? 'Belum ada sanksi'}', style: CustomStyles.textRegular13Px);
                                  }
                                ),
                              ],
                            )
                          ),
                      const SizedBox(height: 15),
                      Visibility(
                            visible: followUp.penaltyRelization!.isEmpty ? false : true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Relaisasi sanksi :', style: CustomStyles.textBold15Px),
                                const SizedBox(height: 5),
                                ListView.builder(
                                shrinkWrap: true,
                                itemCount: followUp.penaltyRelization?.length,
                                itemBuilder: (_, index){
                                    final name = followUp.penaltyRelization?[index].name;
                                    return Text('\u2022  ${name ?? 'Belum ada realisasi sanksi'}', style: CustomStyles.textRegular13Px);
                                  }
                                ),
                              ],
                            )
                          ),
                      
                      const SizedBox(height: 15),
                      Text('Alasan :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.note}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),

                      const SizedBox(height: 15),
                      Text('Perihal :', style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      Text('${followUp.description}', style: CustomStyles.textRegular13Px, textAlign: TextAlign.justify),
                    
                      const SizedBox(height: 15),
                      Text('File tindak lanjut :',
                          style: CustomStyles.textBold15Px),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 140,
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: CustomColors.lightGrey)),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text('File',
                                    style: CustomStyles.textMedium15Px),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: CustomStyles.customRoundedButton,
                                        backgroundColor: CustomColors.green),
                                    onPressed: () async {
                                      showDialogPdfFileDetailFollowUp(
                                          context,
                                          'File tindak lanjut',
                                          followUp.filename!);
                                    },
                                    child: Text('Lihat',
                                        style:
                                            CustomStyles.textMediumWhite15Px))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            );
          }
        }));
  }
}
