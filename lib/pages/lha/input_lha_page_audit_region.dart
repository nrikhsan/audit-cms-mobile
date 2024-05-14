import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_category_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//audit area
class InputLhaAuditArea extends StatefulWidget {
  final int scheduleId;
  const InputLhaAuditArea({super.key, required this.scheduleId});

  @override
  State<InputLhaAuditArea> createState() => _InputLhaAuditAreaState();
}

class _InputLhaAuditAreaState extends State<InputLhaAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  int? _selectedValueResearch;
  int? _selectedSuggest;
  DataCaseAuditArea?_case;
  DataCaseCategory?_caseCategory;

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
                      value: _case,
                      items: controllerAuditArea.caseAuditArea.map((cases){
                        return DropdownMenuItem(
                          value: cases,
                          child: Text('${cases.code}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _case = value;
                          controllerAuditArea.loadCaseCategory(_case?.id);
                          _caseCategory = null;
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
                      value: _caseCategory,
                      items: controllerAuditArea.caseCategory.map((caseCategory){
                        return DropdownMenuItem(
                          value: caseCategory,
                          child: SizedBox(width: 280, child: Text('${caseCategory.name}', style: CustomStyles.textMedium13Px, overflow: TextOverflow.ellipsis, maxLines: 1))
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _caseCategory = value;
                          
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
                          if (_selectedSuggest == 0 || _selectedSuggest == null) {
                            suggestController.clear();
                          }
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
                            if (_case == null || _caseCategory == null || lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || _selectedValueResearch == null) {
                                snackBarMessageRed('Gagal', 'Tidak boleh ada field yang kosong');
                            }else{
                              controllerAuditArea.addToLocalLhaAuditArea(_case?.id, _caseCategory?.id, lhaDescriptionController.text,
                              suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!, _case?.name, _caseCategory?.name);
                              resetValue();
                            }
                          },
                          child: Text('Tambah LHA', style: CustomStyles.textBoldGreen13Px))
                    ],
                  ),

                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalLhaAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalLhaAuditArea[index];
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
                                    Text('${data.caseName?.name}', style: CustomStyles.textBold13Px),
                                    const SizedBox(height: 10),
                                    SizedBox(width: 250 ,child: Text('${data.caseCategoryName?.name}', style: CustomStyles.textRegular13Px, overflow: TextOverflow.ellipsis, maxLines: 1)),
                                  ],
                                ),
                                
                                GestureDetector(
                                  child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                                  onTap: ()async{
                                    controllerAuditArea.deleteLocalLha(data.caseId!);
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
                      if(controllerAuditArea.dataListLocalLhaAuditArea.isEmpty){
                        snackBarMessageRed('Gagal', 'Data list kasus LHA tidak boleh kosong');
                      }else{
                        controllerAuditArea.inputLhaAuditArea(widget.scheduleId);
                          controllerAuditArea.pagingControllerLhaAuditArea.refresh();
                          Get.back();
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

  void resetValue(){
    setState(() {
      _case = null;
      _caseCategory = null;
      lhaDescriptionController.clear();
      temporaryRecommendationController.clear();
      permanentRecommendationController.clear();
      _selectedSuggest = null;
      _selectedValueResearch = null;
    });
  }
}

// audit region
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

  int? _selectedValueResearch;
  int? _selectedSuggest;
  DataCaseAuditRegion? _case;
  DataCaseCategoryAuditRegion? _caseCategory;


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
                      value: _case,
                      items: controllerAuditRegion.caseAuditRegion.map((cases){
                        return DropdownMenuItem(
                          value: cases,
                          child: Text('${cases.code}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _case = value;
                          controllerAuditRegion.loadCaseCategoryAuditRegion(_case?.id);
                          _caseCategory = null;
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
                      value: _caseCategory,
                      items: controllerAuditRegion.caseCategory.map((caseCategory){
                        return DropdownMenuItem(
                          value: caseCategory,
                          child: SizedBox(width: 280, child: Text('${caseCategory.name}', style: CustomStyles.textMedium13Px, overflow: TextOverflow.ellipsis, maxLines: 1))
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _caseCategory = value;
                          
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
                          if (_selectedSuggest == 0 || _selectedSuggest == null) {
                            suggestController.clear();
                          }
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
                            if (_case == null || _caseCategory == null || lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || _selectedValueResearch == null) {
                                snackBarMessageRed('Gagal', 'Tidak boleh ada field yang kosong');
                            }else{
                              controllerAuditRegion.addToLocalLhaAuditRegion(_case?.id, _caseCategory?.id, lhaDescriptionController.text,
                              suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!, _case?.name, _caseCategory?.name);
                              resetValue();
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
                                    Text('${data.caseName?.name}', style: CustomStyles.textBold13Px),
                                    const SizedBox(height: 10),
                                    SizedBox(width: 250 ,child: Text('${data.caseCategoryName?.name}', style: CustomStyles.textRegular13Px, overflow: TextOverflow.ellipsis, maxLines: 1)),
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
                      if(controllerAuditRegion.dataListLocalLhaAuditRegion.isEmpty){
                        snackBarMessageRed('Gagal', 'Data list kasus LHA tidak boleh kosong');
                      }else{
                        controllerAuditRegion.inputLhaAuditRegion(widget.scheduleId);
                          controllerAuditRegion.pagingControllerLha.refresh();
                          Get.back();
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

  void resetValue(){
    setState(() {
      _case = null;
      _caseCategory = null;
      lhaDescriptionController.clear();
      temporaryRecommendationController.clear();
      permanentRecommendationController.clear();
      _selectedSuggest = null;
      _selectedValueResearch = null;
    });
  }
}

class InputCaseLhaAuditArea extends StatefulWidget {
  final int lhaDetailId;
  const InputCaseLhaAuditArea({super.key, required this.lhaDetailId});

  @override
  State<InputCaseLhaAuditArea> createState() => _InputCaseLhaAuditAreaState();
}

class _InputCaseLhaAuditAreaState extends State<InputCaseLhaAuditArea> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  int? _selectedSuggest;
  int? selectValueResearch;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text('Tambah kasus LHA'),
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
                          child: SizedBox(width: 250, child: Text('${caseCategory.name}', style: CustomStyles.textMedium15Px, overflow: TextOverflow.ellipsis, maxLines: 1))
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
                          if (_selectedSuggest == 0 || _selectedSuggest == null) {
                            suggestController.clear();
                          }
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
                      selected: selectValueResearch == index,
                      onSelected: (bool selected){
                        setState(() {
                          selectValueResearch = selected ? index: null;
                          
                        });
                      },
                    );
                  }
                ).toList(),
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
                    if (lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || selectValueResearch == null) {
                          snackBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong');
                        }else if(selectValueResearch == 1){
                          controllerAuditRegion.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditRegion.caseId.value, controllerAuditRegion.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          Get.to(() => const ClarificationPageAuditArea());
                      }else{
                        controllerAuditRegion.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditRegion.caseId.value, controllerAuditRegion.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          Get.back();
                      } 
                    
                  },
                  child: Text('Tambah kasus', style: CustomStyles.textMediumWhite15Px)
                ),
              )
            ]
          )
    )
      ));
  }
}


class InputCaseLhaAuditRegion extends StatefulWidget {
  final int lhaDetailId;
  const InputCaseLhaAuditRegion({super.key, required this.lhaDetailId});

  @override
  State<InputCaseLhaAuditRegion> createState() => _InputCaseLhaAuditRegionState();
}

class _InputCaseLhaAuditRegionState extends State<InputCaseLhaAuditRegion> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  int? _selectedSuggest;
  int? selectValueResearch;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text('Tambah kasus LHA'),
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
                          child: SizedBox(width: 250, child: Text('${caseCategory.name}', style: CustomStyles.textMedium15Px, overflow: TextOverflow.ellipsis, maxLines: 1))
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
                          if (_selectedSuggest == 0 || _selectedSuggest == null) {
                            suggestController.clear();
                          }
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
                      selected: selectValueResearch == index,
                      onSelected: (bool selected){
                        setState(() {
                          selectValueResearch = selected ? index: null;
                          
                        });
                      },
                    );
                  }
                ).toList(),
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
                    if (lhaDescriptionController.text.isEmpty || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || selectValueResearch == null) {
                          snackBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong');
                        }else if(selectValueResearch == 1){
                          controllerAuditRegion.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditRegion.caseId.value, controllerAuditRegion.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          Get.to(() => const ClarificationPageAuditRegion());
                      }else{
                        controllerAuditRegion.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditRegion.caseId.value, controllerAuditRegion.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          Get.back();
                      } 
                    
                  },
                  child: Text('Tambah kasus', style: CustomStyles.textMediumWhite15Px)
                ),
              )
            ]
          )
    )
      ));
  }
}