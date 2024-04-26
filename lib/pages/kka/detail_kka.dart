import 'dart:async';

import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/kka/widgetKka/widket_kka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

//audit area
class KkaDetailAuditArea extends StatefulWidget {
  final int id;
  const KkaDetailAuditArea({super.key, required this.id});

  @override
  State<KkaDetailAuditArea> createState() => _KkaDetailAuditAreaState();
}

class _KkaDetailAuditAreaState extends State<KkaDetailAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailKkaAuditArea(widget.id);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail KKA'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
      ),
      body: SwipeRefresh.material(
        stateStream: refreshController.stream, 
        onRefresh: (){
          controllerAuditArea.getDetailKkaAuditArea(widget.id);
        },
        children: [
          Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            final detailKka = controllerAuditArea.detailKkaAuditArea.value;
            if (detailKka == null) {
              return const Center(
                child: SpinKitCircle(color: CustomColors.blue));
            } else {
              refreshController.add(SwipeRefreshState.hidden);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Nama auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailKka.user!.fullname}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),
                  
                  Text('Nama cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailKka.branch!.name}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Periode pemeriksaan :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(
                      '${detailKka.startDate} s/d ${detailKka.endDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Tanggal jadwal :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(
                      '${detailKka.schedule!.startDate} s/d ${detailKka.schedule!.endDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('File kerta kerja audit :',
                      style: CustomStyles.textBold15Px),
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
                                  downloadKKaAuditArea('${AppConstant.downloadKKa}${detailKka.filename}');
                                },
                                child: Text('Unduh',
                                    style: CustomStyles.textMediumWhite15Px)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
        )
      )
    ]));
  }
}

//audit region
class KkaDetailAuditRegion extends StatefulWidget {
  final int id;
  const KkaDetailAuditRegion({super.key, required this.id});

  @override
  State<KkaDetailAuditRegion> createState() => _KkaDetailAuditRegionState();
}

class _KkaDetailAuditRegionState extends State<KkaDetailAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailKkaAuditRegion(widget.id);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail KKA'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
      ),
      body: SwipeRefresh.material(
        stateStream: refreshController.stream,
        onRefresh: (){
          controllerAuditRegion.getDetailKkaAuditRegion(widget.id);
        },
        children: [
          Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            final detailKka = controllerAuditRegion.detailKkaAuditRegion.value;
            if (detailKka == null) {
              return const Center(
                  child: SpinKitCircle(color: CustomColors.blue));
            } else {
              refreshController.add(SwipeRefreshState.hidden);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Nama auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailKka.user!.fullname}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),
                  
                  Text('Nama cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailKka.branch!.name}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Periode pemeriksaan :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(
                      '${detailKka.startDate} s/d ${detailKka.endDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('Tanggal jadwal :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(
                      '${detailKka.schedule!.startDate} s/d ${detailKka.schedule!.endDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 15),

                  Text('File kerta kerja audit :',
                      style: CustomStyles.textBold15Px),
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
                                  downloadKKaAuditRegion('${AppConstant.downloadKKa}${detailKka.filename}');
                                },
                                child: Text('Unduh',
                                    style: CustomStyles.textMediumWhite15Px)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
        )
      ),
        ],
      )
    );
  }
}
