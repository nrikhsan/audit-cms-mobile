import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ListRevisionLhaCasesPageAuditArea extends StatefulWidget {
  const ListRevisionLhaCasesPageAuditArea({super.key});

  @override
  State<ListRevisionLhaCasesPageAuditArea> createState() => _ListRevisionLhaCasesPageAuditAreaState();
}

class _ListRevisionLhaCasesPageAuditAreaState extends State<ListRevisionLhaCasesPageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    // controllerAuditArea.lhaId.value = widget.lhaId;
    // print(widget.lhaId);
    return Scaffold(
            appBar:  AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Hasil revisi LHA'),
            titleSpacing: 5,
            titleTextStyle: CustomStyles.textBold18Px,
            leading: IconButton(onPressed: (){
               Get.offAll(() => BotNavePageAuditArea());
            },
            icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
            
          ),
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
                  
                                          Text('Kasus : ${lha.cases!.name}', style: CustomStyles.textBold15Px),
                                          Text('Kategori Kasus : ${lha.caseCategory!.name}', style: CustomStyles.textBold15Px),
                  
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
              );
  }
}

class EditLhaPageAuditArea extends StatefulWidget {
  final int lhaId;
  final String cases;
  final String caseCategory;
  final int selectedValueResearch;
  const EditLhaPageAuditArea(
      {super.key, required this.lhaId, required this.cases, required this.caseCategory, required this.selectedValueResearch});

  @override
  State<EditLhaPageAuditArea> createState() => _EditLhaPageAuditAreaState();
}

class _EditLhaPageAuditAreaState extends State<EditLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();
  
  int? _selectedSuggest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          title: const Text('Edit laporan harian audit'),
          backgroundColor: CustomColors.white,
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded,
                  size: 25, color: CustomColors.black)),
        ),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text('Divisi :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Text(widget.cases, style: CustomStyles.textRegular13Px),

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Text(widget.caseCategory, style: CustomStyles.textRegular13Px),

              const SizedBox(height: 15),
              Text('Uraian temuan :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(lhaDescriptionController, 'Masukan rekomendasi sementara...'),

              const SizedBox(height: 15),
              Text('Rekomendasi sementara :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(temporaryRecommendationController, 'Masukan rekomendasi sementara...'),

              const SizedBox(height: 15),
              Text('Rekomendasi permanent :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(permanentRecommendationController, 'Masukan rekomendasi permanent...'),
              
              const SizedBox(height: 15),
              Text('Rekomendasi atau saran :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak ada' : 'Ada', style: CustomStyles.textMedium13Px), 
                      selected: _selectedSuggest == index,
                      onSelected: (bool selected){
                        setState(() {
                          _selectedSuggest = selected ? index: null;
                        });
                      },
                    );
                  }
                ).toList(),
              ),

              const SizedBox(height: 15),
              if(_selectedSuggest == 1)
              fomrInputRecommendationOrSuggest(suggestController, 'Masukan rekomendasi atau saran...'),

              const SizedBox(height: 15),
              Text('Penelusuran :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                    2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak ada' : 'Ada', style: CustomStyles.textMedium13Px),
                      selected: widget.selectedValueResearch == index,
                      onSelected: (bool selected){},
                    );
                  }
                ).toList(),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      controllerAuditArea.revisiLha(widget.lhaId, lhaDescriptionController.text, 
                      suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text);
                     Get.to(() => const ListRevisionLhaCasesPageAuditArea());
                    },
                    child:
                        Text('Revisi LHA', style: CustomStyles.textMediumWhite15Px)),
              )
            ],
          ),
        ),
        )
    );
  }
}
