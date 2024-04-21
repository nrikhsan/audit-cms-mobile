import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
import 'package:audit_cms/pages/lha/input_lha_page_audit_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

//audit area
class DetailLhaPageAuditArea extends StatefulWidget {
  final int id;
  const DetailLhaPageAuditArea({super.key, required this.id});

  @override
  State<DetailLhaPageAuditArea> createState() => _DetailLhaPageAuditAreaState();
}

class _DetailLhaPageAuditAreaState extends State<DetailLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailLhaAuditArea(widget.id);
    return Scaffold(
      appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Detail LHA'),
            titleSpacing: 5,
            titleTextStyle: CustomStyles.textBold18Px,
            leading: IconButton(onPressed: (){
              Get.back();
            },
                icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
      ),
                backgroundColor: CustomColors.white,
                body: SingleChildScrollView(
                  child: Obx(() {
                    final detailLha = controllerAuditArea.detailLhaAuditArea.value;
                    if (detailLha == null) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final research = detailLha.isResearch;
                      final lha = detailLha.lhaDetails;
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
                              Text('Tanggal mulai LHA sesuai jadwal :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text('${detailLha.schedule!.startDate}',
                                  style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 20),
                              Text('Tanggal selesai LHA sesuai jadwal :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text('${detailLha.schedule!.endDate}',
                                  style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 20),
                              Text('Penelusuran :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text(research == 1 ? 'Ada' : 'Tidak ada'),
                              

                              const SizedBox(height: 20),
                              Text('Kasus :', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: lha!.length,
                                itemBuilder: (_, index){
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
                                            lha[index].isResearch == 1 ?
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
                                        Text('Kasus : ${lha[index].cases}', style: CustomStyles.textBold15Px),
                                        const SizedBox(height: 5),
                                        Text('Kategori kasus : ${lha[index].caseCategory}', style: CustomStyles.textBold15Px),

                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                    shape:
                                                        CustomStyles.customRoundedButton),
                                                onPressed: () {
                                                  final lhaId = lha[index].id;
                                                  final cases = lha[index].cases;
                                                  final caseCategory = lha[index].caseCategory;
                                                  final research = lha[index].isResearch;
                                                  
                                                  if (lhaId != null) {
                                                    Get.to(() => EditLhaPageAuditArea(lhaId: lhaId, cases: cases!, caseCategory: caseCategory!, 
                                                    selectedValueResearch: research!));
                                                  }
                                                },
                                                child: Text('Revisi',style: CustomStyles.textMediumBlue15Px)),

                                            const SizedBox(width: 5),

                                            TextButton(
                                                style: TextButton.styleFrom(
                                                    shape: CustomStyles.customRoundedButton),
                                                onPressed: () {
                                                  final caseId = lha[index].id;
                                                  if (caseId != null) {
                                                    Get.to(() => DetaiCasesLhaPageAuditArea(caseId: caseId));
                                                  }
                                                },
                                                child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
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
                )
              );
  }
}

//audit area
class DetaiCasesLhaPageAuditArea extends StatefulWidget {
  final int caseId;
  const DetaiCasesLhaPageAuditArea({super.key, required this.caseId});

  @override
  State<DetaiCasesLhaPageAuditArea> createState() =>
      _DetailCasesLhaPageAuditAreaState();
}

class _DetailCasesLhaPageAuditAreaState
    extends State<DetaiCasesLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea =
      Get.put(ControllerAuditArea(Get.find()));
  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailCaseLhaAuditArea(widget.caseId);
    controllerAuditArea.loadRevisiLha(widget.caseId);
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
              Scaffold(
                body: SingleChildScrollView(
                  child: Obx(() {
                    final detailLha = controllerAuditArea.detailCase.value;
                    if (detailLha == null) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      final research = detailLha.isResearch;
                      final casesCategory = detailLha.caseCategory?.name;
                      final suggestion = detailLha.suggestion;
                      final cases = detailLha.cases;
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
                                    Text('Kategori kasus :',
                                        style: CustomStyles.textBold15Px),
                                    const SizedBox(height: 5),
                                    Text(casesCategory ?? '-',
                                        style: CustomStyles.textRegular13Px),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: CustomStyles.customRoundedButton,
                                        backgroundColor: CustomColors.green),
                                    onPressed: () {},
                                    child: Text(cases?.code ?? '-',
                                        style: CustomStyles.textMediumWhite15Px))
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text('Kategori :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text(cases?.name ?? '-', style: CustomStyles.textRegular13Px),
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
                          ],
                        ),
                      );
                    }
                  }),
                ),
              ),

              //2. list revision LHA audit area
              Scaffold(
                  backgroundColor: CustomColors.white,
                    body: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Obx((){
                        if (controllerAuditArea.isLoading.value) {
                          return  const Center(child: SpinKitCircle(color: CustomColors.blue,));
                        } else {
                          return ListView.builder(
                        itemCount: controllerAuditArea.lhaRevision.length,
                        itemBuilder: (_, index){
                        final lha = controllerAuditArea.lhaRevision[index];
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
                                                lha.isResearch == 1 ?
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
                                            Text('No. Revisi : ${lha.revisionNumber}', style: CustomStyles.textBold15Px),
                                            Text('Kasus : ${lha.cases!.name}', style: CustomStyles.textBold15Px),
                                            Text('Kategori Kasus : ${lha.caseCategory!.name}', style: CustomStyles.textBold15Px),
                                            
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                    TextButton(
                                                    style: TextButton.styleFrom(
                                                        shape:
                                                            CustomStyles.customRoundedButton),
                                                    onPressed: () {
                                                      final caseId = lha.id;
                                                      if(caseId != null){
                                                        Get.to(() => DetailRevisionLhaAuditArea(caseId: caseId));
                                                      }
                                                    },
                                                    child: Text('Lihat rincian',style: CustomStyles.textMediumGreen15Px)),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    );
                      }
                    );
                    }
                  })
                ),
              )
            ]
          ),
      )
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
  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailRevision(widget.caseId);
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Obx(() {
          final detailLha = controllerAuditArea.detailRevisionLha.value;
          if (detailLha == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final research = detailLha.isResearch;
            final casesCategory = detailLha.caseCategory?.name;
            final suggestion = detailLha.suggestion;
            final cases = detailLha.cases;
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
                          Text('Kategori kasus :',
                              style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text(casesCategory ?? '-',
                              style: CustomStyles.textRegular13Px),
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.green),
                          onPressed: () {},
                          child: Text(cases?.code ?? '-',
                              style: CustomStyles.textMediumWhite15Px))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Kategori :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(cases?.name ?? '-', style: CustomStyles.textRegular13Px),
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
                  Text('${detailLha.temporaryRecommendations}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Rekomendasi permanen :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.permanentRecommendations}',
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
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailLhaAuditRegion(widget.id);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail revisi laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          final detailLha = controllerAuditRegion.detailLhaAuditRegion.value;
          if (detailLha == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final research = detailLha.isResearch;
            final lha = detailLha.lhaDetails;
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
                  Text('${detailLha.schedule!.startDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Tanggal selesai LHA sesuai jadwal :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detailLha.schedule!.endDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Penelusuran :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(research == 1 ? 'Ada' : 'Tidak ada'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kasus :', style: CustomStyles.textBold15Px),
                      TextButton(
                        onPressed: (){
                          final lhaDetailId = detailLha.id;
                          if (lhaDetailId != null) {
                            Get.to(() => InputCaseLhaAuditRegion(lhaDetailId: lhaDetailId));
                          }
                        }, child: Text('Tambah kasus', style: CustomStyles.textMediumGreen15Px)
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lha!.length,
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
                                      lha[index].isResearch == 1
                                          ? Row(
                                              children: [
                                                const Icon(
                                                    Icons.notifications_rounded,
                                                    color: CustomColors.red,
                                                    size: 20),
                                                const SizedBox(width: 5),
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
                                  Text('Kasus : ${lha[index].cases}',
                                      style: CustomStyles.textBold15Px),
                                  const SizedBox(height: 5),
                                  Text(
                                      'Kategori kasus : ${lha[index].caseCategory}',
                                      style: CustomStyles.textBold15Px),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      
                                    
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              shape: CustomStyles
                                                  .customRoundedButton),
                                          onPressed: () {
                                            Get.to(() =>
                                                DetaiCasesLhaPageAuditRegion(
                                                    lhaId: lha[index].id!));
                                          },
                                          child: Text('Lihat rincian',
                                              style: CustomStyles
                                                  .textMediumGreen15Px)),
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
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailCasesLhaAuditRegion(widget.lhaId);
    print(widget.lhaId);
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
      body: SingleChildScrollView(
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
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.green),
                          onPressed: () {},
                          child: Text(cases?.code ?? '-',
                              style: CustomStyles.textMediumWhite15Px))
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
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
