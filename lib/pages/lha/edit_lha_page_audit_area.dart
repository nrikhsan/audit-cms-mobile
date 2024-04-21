import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                     Get.back();
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
