import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_category_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputLhaPageAuditRegion extends StatefulWidget {
  final int scheduleId;
  const InputLhaPageAuditRegion({super.key, required this.scheduleId});

  @override
  State<InputLhaPageAuditRegion> createState() => _InputLhaPageAuditRegionState();
}

class _InputLhaPageAuditRegionState extends State<InputLhaPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  DataCaseAuditRegion? _cases;
  DataCaseCategory? _caseCategory;
  int? _selectedValueResearch;
  int? _selectedSuggest;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text('Input laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        backgroundColor: CustomColors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: CustomColors.grey, width: 1),
                        
                      )
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: Text('Pilih kasus', style: CustomStyles.textRegular13Px),
                      value: controllerAuditRegion.caseId.value,
                      items: controllerAuditRegion.caseAuditRegion.map((cases){
                        return DropdownMenuItem(
                          value: cases.id,
                          child: Text('${cases.code}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          controllerAuditRegion.selectCase(value);
                          controllerAuditRegion.loadCaseCategoryAuditRegion(value);
                          controllerAuditRegion.caseCategoryId.value = null;
                        });
                      }
                    ),
                  )
                ),
              )),

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: CustomColors.grey, width: 1),
                        
                      )
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: Text('Pilih kasus kategori', style: CustomStyles.textRegular13Px),
                      value: controllerAuditRegion.caseCategoryId.value,
                      items: controllerAuditRegion.caseCategory.map((caseCategory){
                        return DropdownMenuItem(
                          value: caseCategory.id,
                          child: Text('${caseCategory.name}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          controllerAuditRegion.selectCaseCategory(value);
                          
                        });
                      }
                    ),
                  )
                ),
              )),

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
                      selected: _selectedValueResearch == index,
                      onSelected: (bool selected){
                        setState(() {
                          _selectedValueResearch = selected ? index: null;
                          
                        });
                      },
                    );
                  }
                ).toList(),
              ),

              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('List LHA', style: CustomStyles.textBold15Px),
                      TextButton(
                          style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton
                          ),
                          onPressed: ()async{
                            if (lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || _selectedValueResearch == null) {
                                snakcBarMessageRed('Gagal', 'Tidak boleh ada field yang kosong');
                            }else{
                              controllerAuditRegion.addToLocalLhaAuditRegion(controllerAuditRegion.caseId.value, controllerAuditRegion.caseCategoryId.value, lhaDescriptionController.text,
                              suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!);
                            }
                          },
                          child: Text('Tambah LHA', style: CustomStyles.textBoldGreen13Px))
                    ],
                  ),

                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllerAuditRegion.dataListLocalLhaAuditRegion.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditRegion.dataListLocalLhaAuditRegion[index];
                        return Card(
                              elevation: 0,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: CustomColors.grey)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text('${data.caseCategoryId}', style: CustomStyles.textBold13Px),
                                    const SizedBox(height: 10),
                                    Text('${data.description}', style: CustomStyles.textRegular13Px, maxLines: 5, overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                
                                GestureDetector(
                                  child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                                  onTap: ()async{
                                    controllerAuditRegion.deleteLocalLha(data.caseId!);
                                  },
                                )
                              ],
                            ),
                          )
                        );
                      }
                  )),
                ],
              ),

              const SizedBox(height: 25),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CustomStyles.customRoundedButton,
                    backgroundColor: CustomColors.blue
                  ),
                  onPressed: (){
                    if (lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || _selectedValueResearch == null) {
                          snakcBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong');
                        }else if(_selectedValueResearch == 1){
                          controllerAuditRegion.inputLhaAuditRegion(widget.scheduleId);
                          controllerAuditRegion.pagingControllerClarification.refresh();
                          controllerAuditRegion.pagingControllerLha.refresh();
                          Get.to(() => const ClarificationPageAuditRegion());
                      }else{
                        controllerAuditRegion.inputLhaAuditRegion(widget.scheduleId);
                          controllerAuditRegion.pagingControllerLha.refresh();
                          Get.offAll(() => BotNavAuditRegion());
                      }
                  },
                  child: Text('Simpan Lha', style: CustomStyles.textMediumWhite15Px)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}