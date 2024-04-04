import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
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
  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailLhaAuditArea(widget.id);

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail laporan harian audit'),
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
                    const SizedBox(height: 20),
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
                                        Get.to(() => EditLhaPageAuditArea(lhaId: lha[index].id!));
                                      },
                                      child: Text('Revisi',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetaiCasesLhaPageAuditArea(lhaId: lha[index].id!));
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
      ),
    );
  }
}

//audit area
class DetaiCasesLhaPageAuditArea extends StatefulWidget {
  final int lhaId;
  const DetaiCasesLhaPageAuditArea({super.key, required this.lhaId});

  @override
  State<DetaiCasesLhaPageAuditArea> createState() => _DetailCasesLhaPageAuditAreaState();
}

class _DetailCasesLhaPageAuditAreaState extends State<DetaiCasesLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  @override
  Widget build(BuildContext context) {
    controllerAuditArea.loadDetailRevisionLha(widget.lhaId);
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
        child: Obx((){
          final detailLha = controllerAuditArea.detailRevisonLha.value;
          if (detailLha == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            final research = detailLha.isResearch;
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
                            
                            Text('Kategori kasus :', style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text('${detailLha.caseCategory!.name}',
                            style: CustomStyles.textRegular13Px),
                          ],
                        ),
                        
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: CustomStyles.customRoundedButton,
                                backgroundColor: CustomColors.green),
                            onPressed: () {},
                            child: Text('${detailLha.cases!.code}',
                                style: CustomStyles.textMediumWhite15Px))
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    Text('Kategori :', style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.description}',
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
                    Text('Rekomendasi/saran :',
                        style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.suggestion}',
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
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailLhaAuditRegion(widget.id);
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail laporan harian audit'),
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
            final research = detailLha.research;
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
                            Text('Tanggal input Lha :',
                                style: CustomStyles.textBold15Px),
                            const SizedBox(height: 5),
                            Text('${detailLha.inputDate}',
                                style: CustomStyles.textRegular13Px),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: CustomStyles.customRoundedButton,
                                backgroundColor: CustomColors.green),
                            onPressed: () {},
                            child: Text('${detailLha.lhaCase}',
                                style: CustomStyles.textMediumWhite15Px))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('Auditor :', style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.auditor}',
                        style: CustomStyles.textRegular13Px),
                    const SizedBox(height: 20),
                    Text('Cabang :', style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.branch}',
                        style: CustomStyles.textRegular13Px),
                    const SizedBox(height: 20),
                    Text('Kategori SOP :', style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.sopCategory}',
                        style: CustomStyles.textRegular13Px),
                    const SizedBox(height: 20),
                    Text('Uraian temuan :', style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.lhaDescription}',
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
                    Text('Rekomendasi/saran :',
                        style: CustomStyles.textBold15Px),
                    const SizedBox(height: 5),
                    Text('${detailLha.recommendationOrSuggest}',
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
