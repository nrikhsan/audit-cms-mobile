import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
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
              Navigator.pop(context);
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
