import 'dart:async';

import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
import 'package:audit_cms/pages/lha/input_lha_page_audit_region.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

//audit area
class DetailLhaPageAuditArea extends StatefulWidget {
  final int id;
  final String? level;
  const DetailLhaPageAuditArea({super.key, required this.id, required this.level});

  @override
  State<DetailLhaPageAuditArea> createState() => _DetailLhaPageAuditAreaState();
}

class _DetailLhaPageAuditAreaState extends State<DetailLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  StreamController<SwipeRefreshState> refreshConroller = StreamController();

  @override
  void initState() {
    refreshConroller.add(SwipeRefreshState.loading);
    controllerAuditArea.lhaId.value = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailLhaAuditArea(controllerAuditArea.lhaId.value);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Detail LHA'),
            titleSpacing: 5,
            titleTextStyle: CustomStyles.textBold18Px),
                body: SwipeRefresh.material(
                  stateStream: refreshConroller.stream,
                  onRefresh: () {
                    controllerAuditArea.getDetailLhaAuditArea(widget.id);
                  },
                  children: [
                    SingleChildScrollView(
                  child: Obx(() {
                    final detailLha = controllerAuditArea.detailLhaAuditArea.value;
                    if (detailLha == null) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      refreshConroller.add(SwipeRefreshState.hidden);
                      final research = detailLha.isResearch;
                      final lha = detailLha.lhaDetails;
                      final createdBy = detailLha.user?.level?.name;

                      final startDateSchedule = DateTime.parse('${detailLha.schedule?.startDate}');
                      final endDateSchedule = DateTime.parse('${detailLha.schedule?.endDate}');

                      DateFormat outputFormat = DateFormat('yyyy-MM-dd');

                      DateTime startDate = outputFormat.parse(detailLha.schedule!.startDate!);
                      DateTime endDate = outputFormat.parse(detailLha.schedule!.endDate!);

                      String formattedStartDate = outputFormat.format(startDate);
                      String formattedEndDate = outputFormat.format(endDate);

                      DateTime today = DateTime.now();
                      String formattedCurrentTime = outputFormat.format(today);

                      startDate = DateTime.parse(formattedStartDate);
                      endDate = DateTime.parse(formattedEndDate);
                      today = DateTime.parse(formattedCurrentTime);

                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Auditor :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text('${detailLha.user!.fullname}',
                                  style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 20),
                              Text('Cabang :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text('${detailLha.branch!.name}',
                                  style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 20),
                              Text('Tanggal mulai LHA sesuai jadwal :',
                                  style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text(DateFormat('dd-MM-yyyy').format(startDateSchedule),
                                  style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 20),
                              Text('Tanggal selesai LHA sesuai jadwal :',
                                  style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text(DateFormat('dd-MM-yyyy').format(endDateSchedule),
                                  style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 20),
                              Text('Penelusuran :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text(research == 1 ? 'Ada' : 'Tidak ada'),
                              
                              const SizedBox(height: 20),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('List temuan :', style: CustomStyles.textBold15Px),
                                  Wrap(
                                    children: [
                                      widget.level == 'AREA' ?
                                      TextButton(
                                      onPressed: (){
                                        final lhaDetailId = detailLha.id;
                                        if (lhaDetailId != null) {
                                          if (today.isBefore(startDate)) {
                                            snackBarMessageRed('Alert','Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
                                          } else if(today.isAfter(endDate)) {
                                            snackBarMessageRed('Alert', 'Jadwal sudah berakhir');
                                          }else{
                                            Get.to(() => InputCaseLhaAuditArea(lhaDetailId: lhaDetailId));
                                          }
                                        }
                                      }, child: Text('Tambah temuan', style: CustomStyles.textMediumGreen15Px)
                                    ): const SizedBox()
                                    ],
                                  )
                                  ],
                                ),
                              const SizedBox(height: 5),
                              
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: lha!.length,
                                itemBuilder: (_, index){

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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${lha[index].cases}',
                                          style: CustomStyles.textMedium13Px),
                                          Visibility(
                                            visible: lha[index].isResearch == 1 ? true : false,
                                            child: Text('Perlu klarifikasi', style: CustomStyles.textMediumRed13Px,),
                                          ),
                                        ],
                                      ),
                                  const SizedBox(height: 5),
                                  const Divider(
                                    color: CustomColors.lightGrey,
                                    height: 10,
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(width: double.maxFinite, child: Text('Kategori kasus : ${lha[index].caseCategory}', style: CustomStyles.textRegular13Px, overflow: TextOverflow.ellipsis, maxLines: 2)),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Wrap(
                                        children: [
                                          widget.level == 'AREA' && lha[index].statusFlow == 0 ?
                                          SizedBox(
                                            height: 33,
                                            child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: CustomColors.red,
                                                shape: CustomStyles
                                                    .customRoundedButton),
                                            onPressed: () {
                                              alertDeleteWidget(
                                                context, 
                                                'Hapus kasus', 
                                                'Apakah anda yakin untuk menghapus kasus ini?',
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: CustomColors.green,
                                                        shape: CustomStyles.customRoundedButton
                                                      ),
                                                      onPressed: (){
                                                        controllerAuditArea.deletCaseLha(lha[index].id);
                                                        Get.back();
                                                      }, 
                                                      child: Text('Ya', style: CustomStyles.textMediumWhite15Px)
                                                    ),
                                                    const SizedBox(width: 5),
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: CustomColors.red,
                                                        shape: CustomStyles.customRoundedButton
                                                      ),
                                                      onPressed: (){
                                                        Get.back();
                                                      }, 
                                                      child: Text('Tidak', style: CustomStyles.textMediumWhite15Px)
                                                    )
                                                  ],
                                                )
                                              );
                                            },
                                            child: Text('Hapus',
                                                style: CustomStyles
                                                    .textMediumWhite13Px)),
                                          ): const SizedBox(),
                                        ],
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        height: 33,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: CustomColors.blue,
                                                shape: CustomStyles
                                                    .customRoundedButton),
                                            onPressed: () {
                                             final lhaId = lha[index].id;
                                              if (lhaId != null) {
                                                Get.to(() => TabBarViewCasesLhaPageAuditArea(caseId: lhaId, level: createdBy));
                                              }
                                            },
                                            child: Text('Lihat rincian',
                                                style: CustomStyles
                                                    .textMediumWhite13Px)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                                }
                              )
                            ],
                          ),
                        );
                      }   
                  }),
                )],
                )
              );
  }
}

//audit area
class TabBarViewCasesLhaPageAuditArea extends StatefulWidget {
  final int caseId;
  final String? level;
  const TabBarViewCasesLhaPageAuditArea({super.key, required this.caseId, required this.level});

  @override
  State<TabBarViewCasesLhaPageAuditArea> createState() =>  _TabBarViewCasesLhaPageAuditAreaState();
}

class _TabBarViewCasesLhaPageAuditAreaState extends State<TabBarViewCasesLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Detail Kasus LHA'),
            titleSpacing: 5,
            titleTextStyle: CustomStyles.textBold18Px,
            leading: IconButton(onPressed: (){
              Get.back();
            },
                icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: CustomColors.blue,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelStyle: const TextStyle(
                  color: CustomColors.grey,
                  fontFamily: 'RobotoMedium',
                  fontSize: 13),
              labelStyle: const TextStyle(
                  color: CustomColors.blue,
                  fontFamily: 'RobotoMedium',
                  fontSize: 13),
              tabs: const [
                Tab(text: 'Detail LHA'),
                Tab(text: 'Hasil Revisi LHA'),
              ],
            ),
          ),
          body: TabBarView(
            children: [

              //1. detail kasus LHA
              DetailLhaCaseAuditArea(lhaDetailid: widget.caseId, level: widget.level),

              //2. list revision LHA audit area
              ListRevisionPageAuditArea(lhaDetailid: widget.caseId)
            ]
          ),
      )
    );
  }
}

//audit area
class DetailLhaCaseAuditArea extends StatefulWidget {
  final int lhaDetailid;
  final String? level;
  const DetailLhaCaseAuditArea({super.key, required this.lhaDetailid, required this.level});

  @override
  State<DetailLhaCaseAuditArea> createState() => _DetailLhaCaseAuditAreaState();
}

class _DetailLhaCaseAuditAreaState extends State<DetailLhaCaseAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailCaseLhaAuditArea(widget.lhaDetailid);
    return Scaffold(
                backgroundColor: CustomColors.white,
                body: SwipeRefresh.material(
                  stateStream: refreshController.stream,
                  onRefresh: (){
                    controllerAuditArea.getDetailCaseLhaAuditArea(widget.lhaDetailid);
                  },
                  children: [
                    SingleChildScrollView(
                  child: Obx(() {
                    final detailLha = controllerAuditArea.detailCase.value;
                    if (detailLha == null) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final research = detailLha.isResearch;
                      final casesCategory = detailLha.caseCategory?.name;
                      final suggestion = detailLha.suggestion;
                      final cases = detailLha.cases;
                      final lhaId = detailLha.id;
                      final statusFlow = detailLha.statusFlow;
                      refreshController.add(SwipeRefreshState.hidden);
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text('Kasus :', style: CustomStyles.textBold15Px),
                                    const SizedBox(height: 5),
                                    Text(cases?.name ?? '-', style: CustomStyles.textRegular13Px),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.grey),
                                      onPressed: () {},
                                      child: Text(cases?.code ?? '-',
                                          style: CustomStyles.textMediumWhite15Px)),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text('Kategori kasus :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(casesCategory ?? '-', style: CustomStyles.textRegular13Px),
                            
                            const SizedBox(height: 20),
                            Text('Uraian temuan :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(detailLha.description ?? '-',
                                style: CustomStyles.textRegular13Px,
                                textAlign: TextAlign.justify),
                            const SizedBox(height: 20),
                            Text('Rekomendasi sementara :',
                                style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(detailLha.temporaryRecommendation ?? '-',
                                style: CustomStyles.textRegular13Px,
                                textAlign: TextAlign.justify),
                            const SizedBox(height: 20),
                            Text('Rekomendasi permanen :',
                                style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(detailLha.permanentRecommendation ?? '-',
                                style: CustomStyles.textRegular13Px,
                                textAlign: TextAlign.justify),
                            const SizedBox(height: 20),
                            Text('Rekomendasi/saran :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(suggestion ?? '-',
                                style: CustomStyles.textRegular13Px,
                                textAlign: TextAlign.justify),
                            const SizedBox(height: 20),
                            Text('Penelusuran :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(research == 1 ? 'Ada' : 'Tidak ada'),

                            const SizedBox(height: 20),
                            Text('Status :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(statusFlow == 1 ? 'Terkirim ke pusat' : 'Belum terkirim'),

                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CustomStyles.customRoundedButton,
                                  backgroundColor: CustomColors.green,

                                ),
                                onPressed: statusFlow == 0 ?  (){
                                  controllerAuditArea.sendCaseLha(detailLha.id);
                                } : null,
                                child: Text(statusFlow == 1 ? 'Terkirim ke pusat' : 'Kirim ke pusat', style: CustomStyles.textMediumWhite15Px)
                              )
                            ),

                            SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CustomStyles.customRoundedButton,
                                  backgroundColor: CustomColors.blue
                                ),
                                onPressed: statusFlow == 0 ?(){
                                  Get.to(() => EditLhaPageAuditArea(lhaId: lhaId, cases: cases?.name, caseCategory: detailLha.caseCategory?.name, 
                                        selectedValueResearch: research, lhaDescription: detailLha.description, temRec: detailLha.temporaryRecommendation, 
                                        perRec: detailLha.permanentRecommendation, suggest: suggestion));
                                }: null, 
                                child: Text('Revisi', style: CustomStyles.textMediumWhite15Px)
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                )
                  ]
                )
              );
  }
}

//audit area
class ListRevisionPageAuditArea extends StatefulWidget {
  final int lhaDetailid;
  const ListRevisionPageAuditArea({super.key, required this.lhaDetailid});

  @override
  State<ListRevisionPageAuditArea> createState() => _ListRevisionPageAuditAreaState();
}

class _ListRevisionPageAuditAreaState extends State<ListRevisionPageAuditArea> {

  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.loadRevisiLha(widget.lhaDetailid);
    return Scaffold(
                  backgroundColor: CustomColors.white,
                    body: Padding(
                      padding: const EdgeInsets.all(15),
                      child: RefreshIndicator(
                        onRefresh: ()async{
                          controllerAuditArea.loadRevisiLha(widget.lhaDetailid);
                        },
                        child: Obx((){
                      return ListView.builder(
                        itemCount: controllerAuditArea.lhaRevision.length,
                        itemBuilder: (_, index){
                        final lha = controllerAuditArea.lhaRevision[index];
                        final numberRevision = lha.revisionNumber;
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
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                   
                                                    Visibility(
                                                      visible: lha.isResearch == 1 ? true : false,
                                                      child: Text('Perlu klarifikasi', style: CustomStyles.textMediumRed13Px),
                                                    ),
                                                    Text('${lha.cases!.name}', style: CustomStyles.textMedium13Px),
                                                  ],
                                                ),
                                            
                                            const SizedBox(height: 5),
                                            const Divider(
                                              color: CustomColors.lightGrey,
                                              height: 10
                                            ),
                    
                                            const SizedBox(height: 15),
                                            Wrap(
                                              children: [
                                                numberRevision == 0 ? 
                                                Text('Original', style: CustomStyles.textBold15Px) :
                                                Text('No Revisi : $numberRevision', style: CustomStyles.textBold15Px),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            
                                            const SizedBox(height: 5),
                                            Text('Kategori Kasus : ${lha.caseCategory!.name}', style: CustomStyles.textRegular13Px, overflow: TextOverflow.ellipsis, maxLines: 2),
                                            
                                            const SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                    SizedBox(
                                                      height: 33,
                                                      child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: CustomColors.blue,
                                                          shape:
                                                              CustomStyles.customRoundedButton),
                                                      onPressed: () {
                                                        final caseId = lha.id;
                                                        if(caseId != null){
                                                          Get.to(() => DetailRevisionLhaAuditArea(caseId: caseId));
                                                        }
                                                      },
                                                      child: Text('Lihat rincian',style: CustomStyles.textMediumWhite13Px)),
                                                    ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    );
                      }
                    );
                  }),
                      )
                ),
              );
  }
}

//audit area
class DetailRevisionLhaAuditArea extends StatefulWidget {
  final int caseId;
  const DetailRevisionLhaAuditArea({super.key, required this.caseId});

  @override
  State<DetailRevisionLhaAuditArea> createState() =>
      _DetailRevisionLhaAuditAreaState();
}


class _DetailRevisionLhaAuditAreaState
    extends State<DetailRevisionLhaAuditArea> {

  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  StreamController<SwipeRefreshState> refreshConroller = StreamController();

  @override
  void initState() {
    refreshConroller.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailRevision(widget.caseId);
    return Scaffold(
        backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail revisi kasus LHA'),
        titleTextStyle: CustomStyles.textBold18Px,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
      ),
      body: SwipeRefresh.material(
        stateStream: refreshConroller.stream,
         onRefresh: (){
          controllerAuditArea.getDetailRevision(widget.caseId);
         },
         children: [
          SingleChildScrollView(
        child: Obx(() {
          final detailLha = controllerAuditArea.detailRevisionLha.value;
          if (detailLha == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final research = detailLha.isResearch;
            final casesCategory = detailLha.caseCategory?.name;
            final suggestion = detailLha.suggestion;
            final cases = detailLha.cases;
            refreshConroller.add(SwipeRefreshState.hidden);
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text('Kasus :', style: CustomStyles.textBold15Px),
                                    Text(cases?.name ?? '-', style: CustomStyles.textRegular13Px),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.grey),
                                      onPressed: () {},
                                      child: Text(cases?.code ?? '-',
                                          style: CustomStyles.textMediumWhite15Px)),
                                )
                              ],
                            ),

                  const SizedBox(height: 5),
                  Text('Kategori kasus :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),

                  Text(casesCategory ?? '-', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),

                  Text('Uraian temuan :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(detailLha.description ?? '-',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi sementara :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(detailLha.temporaryRecommendations ?? '-',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi permanen :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(detailLha.permanentRecommendations ?? '-',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi/saran :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(suggestion ?? '-',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Penelusuran :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(research == 1 ? 'Ada' : 'Tidak ada'),
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
class DetailLhaPageAuditRegion extends StatefulWidget {
  final int id;
  const DetailLhaPageAuditRegion({super.key, required this.id});

  @override
  State<DetailLhaPageAuditRegion> createState() =>
      _DetailLhaPageAuditRegionState();
}

class _DetailLhaPageAuditRegionState extends State<DetailLhaPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));

      StreamController<SwipeRefreshState> refreshConroller = StreamController();

      @override
  void initState() {
    refreshConroller.add(SwipeRefreshState.loading);
    controllerAuditRegion.lhaId.value = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailLhaAuditRegion(controllerAuditRegion.lhaId.value);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail LHA'),
        titleTextStyle: CustomStyles.textBold18Px,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
      ),
      body: SwipeRefresh.material(stateStream: refreshConroller.stream, 
      onRefresh: (){
        controllerAuditRegion.getDetailLhaAuditRegion(widget.id);
      },
      children: [
        SingleChildScrollView(
        child: Obx(() {
          final detailLha = controllerAuditRegion.detailLhaAuditRegion.value;
          if (detailLha == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final research = detailLha.isResearch;
            final lha = detailLha.lhaDetails;

            final startDateSchedule = DateTime.parse('${detailLha.schedule?.startDate}');
            final endDateSchedule = DateTime.parse('${detailLha.schedule?.endDate}');

            DateFormat outputFormat = DateFormat('yyyy-MM-dd');

            DateTime startDate = outputFormat.parse(detailLha.schedule!.startDate!);
            DateTime endDate = outputFormat.parse(detailLha.schedule!.endDate!);

            String formattedStartDate = outputFormat.format(startDate);
            String formattedEndDate = outputFormat.format(endDate);

            DateTime today = DateTime.now();
            String formattedCurrentTime = outputFormat.format(today);

            startDate = DateTime.parse(formattedStartDate);
            endDate = DateTime.parse(formattedEndDate);
            today = DateTime.parse(formattedCurrentTime);

            refreshConroller.add(SwipeRefreshState.hidden);

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Auditor :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.user!.fullname}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.branch!.name}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Tanggal mulai LHA sesuai jadwal :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(DateFormat('dd-MM-yyyy').format(startDateSchedule),
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Tanggal selesai LHA sesuai jadwal :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(DateFormat('dd-MM-yyyy').format(endDateSchedule),
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Penelusuran :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(research == 1 ? 'Ada' : 'Tidak ada'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('List temuan :', style: CustomStyles.textBold15Px),
                      TextButton(
                        onPressed: (){
                          final lhaDetailId = detailLha.id;
                          if (lhaDetailId != null) {
                            if (today.isBefore(startDate)) {
                                snackBarMessageRed('Alert','Jadwal hanya dapat diproses ketika sudah sesuai dengan tanggal jadwal');
                              } else if(today.isAfter(endDate)) {
                                snackBarMessageRed('Alert', 'Jadwal sudah berakhir');
                              }else{
                                Get.to(() => InputCaseLhaAuditRegion(lhaDetailId: lhaDetailId));
                            }
                          }
                        }, child: Text('Tambah temuan', style: CustomStyles.textMediumGreen15Px)
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lha!.length,
                      itemBuilder: (_, index) {
                        final statusFlow = lha[index].statusFlow;
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${lha[index].cases}',
                                      style: CustomStyles.textMedium13Px),
                                      Visibility(
                                        visible: lha[index].isResearch == 1 ? true : false,
                                        child: Text('Perlu klarifikasi', style: CustomStyles.textMediumRed13Px,),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Divider(
                                    color: CustomColors.lightGrey,
                                    height: 10,
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(width: double.maxFinite, child: Text('Kategori kasus : ${lha[index].caseCategory}', style: CustomStyles.textRegular13Px, overflow: TextOverflow.ellipsis, maxLines: 2)),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Wrap(
                                        children: [
                                          statusFlow == 1 ? const SizedBox()
                                          : SizedBox(
                                            height: 33,
                                            child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: CustomColors.red,
                                                shape: CustomStyles
                                                    .customRoundedButton),
                                            onPressed: () {
                                              alertDeleteWidget(
                                                context, 
                                                'Hapus kasus', 
                                                'Apakah anda yakin untuk menghapus kasus ini?',
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: CustomColors.green,
                                                        shape: CustomStyles.customRoundedButton
                                                      ),
                                                      onPressed: (){
                                                        controllerAuditRegion.deletCaseLha(lha[index].id);
                                                        Get.back();
                                                      }, 
                                                      child: Text('Ya', style: CustomStyles.textMediumWhite15Px)
                                                    ),
                                                    const SizedBox(width: 5),
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: CustomColors.red,
                                                        shape: CustomStyles.customRoundedButton
                                                      ),
                                                      onPressed: (){
                                                        Get.back();
                                                      }, 
                                                      child: Text('Tidak', style: CustomStyles.textMediumWhite15Px)
                                                    )
                                                  ],
                                                )
                                              );
                                            },
                                            child: Text('Hapus',
                                                style: CustomStyles
                                                    .textMediumWhite13Px)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        height: 33,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: CustomColors.blue,
                                                shape: CustomStyles
                                                    .customRoundedButton),
                                            onPressed: () {
                                              Get.to(() =>
                                                  DetaiCasesLhaPageAuditRegion(lhaId: lha[index].id!));
                                            },
                                            child: Text('Lihat rincian',
                                                style: CustomStyles
                                                    .textMediumWhite13Px)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      })
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
class DetaiCasesLhaPageAuditRegion extends StatefulWidget {
  final int lhaId;
  const DetaiCasesLhaPageAuditRegion({super.key, required this.lhaId});

  @override
  State<DetaiCasesLhaPageAuditRegion> createState() =>
      _DetailCasesLhaPageAuditRegionState();
}

class _DetailCasesLhaPageAuditRegionState
    extends State<DetaiCasesLhaPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion =
      Get.put(ControllerAuditRegion(Get.find()));

      StreamController<SwipeRefreshState> refreshConroller = StreamController();

  @override
  void initState() {
    refreshConroller.add(SwipeRefreshState.loading);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailCasesLhaAuditRegion(widget.lhaId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail kasus laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
      ),
      body: SwipeRefresh.material(
        stateStream: refreshConroller.stream, 
        onRefresh: (){
        controllerAuditRegion.getDetailCasesLhaAuditRegion(widget.lhaId);
      },
      children: [
        SingleChildScrollView(
        child: Obx(() {
          final detailLha =
              controllerAuditRegion.detailCasesLhaAuditRegion.value;
          if (detailLha == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final research = detailLha.isResearch;
            final casesCategory = detailLha.caseCategory?.name;
            final suggestion = detailLha.suggestion;
            final cases = detailLha.cases;
            final statusFlow = detailLha.statusFlow;
            refreshConroller.add(SwipeRefreshState.hidden);
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kasus :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(cases?.name ?? '-',
                              style: CustomStyles.textRegular13Px),
                        ],
                      ),
                      SizedBox(
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.grey),
                                      onPressed: () {},
                                      child: Text(cases?.code ?? '-',
                                          style: CustomStyles.textMediumWhite15Px)),
                                )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Kategori kasus :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(casesCategory ?? '-',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Uraian temuan :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.description}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi sementara :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.temporaryRecommendation}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi permanen :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.permanentRecommendation}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi/saran :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(suggestion ?? '-',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Penelusuran :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(research == 1 ? 'Ada' : 'Tidak ada'),

                  const SizedBox(height: 20),
                  Text('Status :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(statusFlow == 1 ? 'Sudah diproses' : 'Belum diproses'),

                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: statusFlow == 0 ? (){
                        final lhaId = detailLha.id;
                        if (lhaId != null) {
                              Get.to(() => EditLhaPageAuditRegion(lhaId: lhaId, cases: cases?.name, caseCategory: detailLha.caseCategory?.name, 
                              selectedValueResearch: research, lhaDescription: detailLha.description, temRec: detailLha.temporaryRecommendation, perRec: detailLha.permanentRecommendation, suggest: suggestion));
                        }
                    }: null
                    , child: Text('Edit LHA', style: CustomStyles.textMediumWhite15Px)),
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
