import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLhaPageAuditArea extends StatefulWidget {
  final int? lhaId;
  final String? cases;
  final String? caseCategory;
  final int? selectedValueResearch;
  final String? lhaDescription;
  final String? temRec;
  final String? perRec;
  final String? suggest;
  const EditLhaPageAuditArea(
      {super.key, required this.lhaId, required this.cases, required this.caseCategory, required this.selectedValueResearch, 
      required this.lhaDescription, required this.temRec, required this.perRec, required this.suggest});

  @override
  State<EditLhaPageAuditArea> createState() => _EditLhaPageAuditAreaState();
}

class _EditLhaPageAuditAreaState extends State<EditLhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  
  
  @override
  void initState() {
    lhaDescriptionController.text = widget.lhaDescription ?? '';
    temporaryRecommendationController.text = widget.temRec ?? '';
    permanentRecommendationController.text = widget.perRec ?? '';

    suggestController.text = widget.suggest ?? '';
    selectedSuggest = widget.suggest != null && widget.suggest!.isNotEmpty ? 1 : 0;
    
    super.initState();
  }

  @override
  void dispose() {
    lhaDescriptionController.dispose();
    temporaryRecommendationController.dispose();
    permanentRecommendationController.dispose();
    suggestController.dispose();
    super.dispose();
  }

  int? selectedSuggest;

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
              Text(widget.cases!, style: CustomStyles.textRegular13Px),

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Text(widget.caseCategory!, style: CustomStyles.textRegular13Px),

              const SizedBox(height: 20),
              Text('Uraian temuan :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              formEditLha(lhaDescriptionController, 'Masukan uraian temuan...'),

              const SizedBox(height: 15),
              Text('Perbaikan sementara :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(temporaryRecommendationController, 'Masukan perbaikan sementara...'),

              const SizedBox(height: 15),
              Text('Perbaikan permanent :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(permanentRecommendationController, 'Masukan perbaikan permanent...'),
              
              const SizedBox(height: 15),
              Text('Rekomendasi atau saran :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Wrap(
                runSpacing: 5,
                spacing: 5,
                children: List.generate(
                    2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak ada': 'Ada'), 
                      selected: selectedSuggest == index,
                      onSelected: (selected){
                        setState(() {
                          selectedSuggest = selected ? index : null;
                          if (selectedSuggest == 0) {
                            suggestController.clear();
                          }else if(selectedSuggest == null){
                            suggestController.clear();
                          }
                        });
                      });
                  }).toList()
              ),

              const SizedBox(height: 15),
              if (selectedSuggest == 1)
              formEditLha(suggestController, 'Masukan rekomendasi atau saran...'),
              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                       if (lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || selectedSuggest == null) {
                          snackBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong');
                      }else{
                         controllerAuditArea.revisiLha(widget.lhaId, lhaDescriptionController.text, 
                            suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text);
                          
                          Get.back();
                      }
                     
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

class EditLhaPageAuditRegion extends StatefulWidget {
  final int lhaId;
  final String? cases;
  final String? caseCategory;
  final int? selectedValueResearch;
  final String? lhaDescription;
  final String? temRec;
  final String? perRec;
  final String? suggest;
  const EditLhaPageAuditRegion({super.key, required this.lhaId, this.cases, this.caseCategory, this.selectedValueResearch, this.lhaDescription, this.temRec, this.perRec, this.suggest});

  @override
  State<EditLhaPageAuditRegion> createState() => _EditLhaPageAuditRegionState();
}

class _EditLhaPageAuditRegionState extends State<EditLhaPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  
  
  @override
  void initState() {
    lhaDescriptionController.text = widget.lhaDescription ?? '';
    temporaryRecommendationController.text = widget.temRec ?? '';
    permanentRecommendationController.text = widget.perRec ?? '';
    suggestController.text = widget.suggest ?? '';
    selectedSuggest = widget.suggest != null && widget.suggest!.isNotEmpty ? 1 : 0;
    super.initState();
  }

  int? selectedSuggest;

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
              Text(widget.cases!, style: CustomStyles.textRegular13Px),

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Text(widget.caseCategory!, style: CustomStyles.textRegular13Px),

              const SizedBox(height: 20),
              Text('Uraian temuan :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              formEditLha(lhaDescriptionController, 'Masukan uraian temuan...'),

              const SizedBox(height: 15),
              Text('Perbaikan sementara :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(temporaryRecommendationController, 'Masukan perbaikan sementara...'),

              const SizedBox(height: 15),
              Text('Perbaikan permanent :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              fomrInputRecommendationOrSuggest(permanentRecommendationController, 'Masukan perbaikan permanent...'),
              
              const SizedBox(height: 15),
              Text('Rekomendasi atau saran :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Wrap(
                runSpacing: 5,
                spacing: 5,
                children: List.generate(
                    2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak ada': 'Ada'), 
                      selected: selectedSuggest == index,
                      onSelected: (selected){
                        setState(() {
                          selectedSuggest = selected ? index : null;
                          if (selectedSuggest == 0) {
                            suggestController.clear();
                          }else if(selectedSuggest == null){
                            suggestController.clear();
                          }
                        });
                      });
                  }).toList()
              ),

              const SizedBox(height: 15),
              if (selectedSuggest == 1)
              formEditLha(suggestController, 'Masukan rekomendasi atau saran...'),
              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                       if (lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || selectedSuggest == null) {
                          snackBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong');
                      }else{
                         controllerAuditRegion.revisiLha(widget.lhaId, lhaDescriptionController.text, 
                            suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text);
                          
                          Get.back();
                      }
                     
                    },
                    child:
                        Text('Edit LHA', style: CustomStyles.textMediumWhite15Px)),
              )
            ],
          ),
        ),
        )
    );
  }
}