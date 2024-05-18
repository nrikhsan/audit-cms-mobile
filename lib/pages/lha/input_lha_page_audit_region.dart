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
import 'package:dropdown_button2/dropdown_button2.dart';
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

  final TextEditingController caseEditingController = TextEditingController();
  final TextEditingController caseCategoryEditingController = TextEditingController();

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
                  child: DropdownButton2<DataCaseAuditArea>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.caseAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: _case,
                    onChanged: (value) {
                      setState(() {
                        _case = value;
                        controllerAuditArea.loadCaseCategory(_case?.id);
                        _caseCategory = null;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari kasus...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<DataCaseCategory>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus kategori',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.caseCategory
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: _caseCategory,
                    onChanged: (value) {
                      setState(() {
                        _caseCategory = value;
                        controllerAuditArea.selectCaseCategory(_caseCategory?.id);
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseCategoryEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseCategoryEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.name!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseCategoryEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

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

  final TextEditingController caseEditingController = TextEditingController();
  final TextEditingController caseCategoryEditingController = TextEditingController();

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
                  child: DropdownButton2<DataCaseAuditRegion>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditRegion.caseAuditRegion
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: _case,
                    onChanged: (value) {
                      setState(() {
                        _case = value;
                        controllerAuditRegion.loadCaseCategoryAuditRegion(_case?.id);
                        _caseCategory = null;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari kasus...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<DataCaseCategoryAuditRegion>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus kategori',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditRegion.caseCategory
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: _caseCategory,
                    onChanged: (value) {
                      setState(() {
                        _caseCategory = value;
                        controllerAuditRegion.selectCaseCategory(_caseCategory?.id);
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseCategoryEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseCategoryEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.name!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseCategoryEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

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
                        setState(() {
                          controllerAuditRegion.inputLhaAuditRegion(widget.scheduleId);
                          controllerAuditRegion.pagingControllerLha.refresh();
                        });
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
  
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  
  final TextEditingController lhaDescriptionController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  final TextEditingController caseEditingController = TextEditingController();
  final TextEditingController caseCategoryEditingController = TextEditingController();


  int? _selectedSuggest;
  int? selectValueResearch;

  void resetValue(){
    setState(() {
      controllerAuditArea.caseId.value = null;
      controllerAuditArea.caseCategoryId.value = null;
      lhaDescriptionController.clear();
      temporaryRecommendationController.clear();
      permanentRecommendationController.clear();
      _selectedSuggest = null;
      selectValueResearch = null;
    });
  }

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
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.caseAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: controllerAuditArea.caseId.value,
                    onChanged: (value) {
                      setState(() {
                        controllerAuditArea.selectCase(value);
                        controllerAuditArea.loadCaseCategory(value);
                        controllerAuditArea.caseCategoryId.value = null;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari kasus...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseName = controllerAuditArea.caseAuditArea.firstWhere((element) => element.id == item.value);
                        return caseName.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus kategori',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.caseCategory
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: controllerAuditArea.caseCategoryId.value,
                    onChanged: (value) {
                      setState(() {
                        controllerAuditArea.selectCaseCategory(value);
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseCategoryEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseCategoryEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseCategoryName = controllerAuditArea.caseCategory.firstWhere((element) => element.id == item.value);
                        return caseCategoryName.name!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseCategoryEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

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
                          controllerAuditArea.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditArea.caseId.value, controllerAuditArea.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          resetValue();
                          Get.to(() => const ClarificationPageAuditArea());
                      }else{
                        controllerAuditArea.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditArea.caseId.value, controllerAuditArea.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          resetValue();
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

  final TextEditingController caseEditingController = TextEditingController();
  final TextEditingController caseCategoryEditingController = TextEditingController();


  int? _selectedSuggest;
  int? selectValueResearch;

  void resetValue(){
    setState(() {
      controllerAuditRegion.caseId.value = null;
      controllerAuditRegion.caseCategoryId.value = null;
      lhaDescriptionController.clear();
      temporaryRecommendationController.clear();
      permanentRecommendationController.clear();
      _selectedSuggest = null;
      selectValueResearch = null;
    });
  }


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
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditRegion.caseAuditRegion
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: controllerAuditRegion.caseId.value,
                    onChanged: (value) {
                      setState(() {
                        controllerAuditRegion.selectCase(value);
                        controllerAuditRegion.loadCaseCategoryAuditRegion(value);
                        controllerAuditRegion.caseCategoryId.value = null;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari kasus...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseName = controllerAuditRegion.caseAuditRegion.firstWhere((element) => element.id == item.value);
                        return caseName.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kasus kategori',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditRegion.caseCategory
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: controllerAuditRegion.caseCategoryId.value,
                    onChanged: (value) {
                      setState(() {
                        controllerAuditRegion.selectCaseCategory(value);
                        controllerAuditRegion.selectCaseCategory(value);
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseCategoryEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseCategoryEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseCategoryName = controllerAuditRegion.caseCategory.firstWhere((element) => element.id == item.value);
                        return caseCategoryName.name!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseCategoryEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

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
                          resetValue();
                          Get.to(() => const ClarificationPageAuditRegion());
                      }else{
                        controllerAuditRegion.inputCaseLhaAuditRegion(widget.lhaDetailId, controllerAuditRegion.caseId.value, controllerAuditRegion.caseCategoryId.value, lhaDescriptionController.text, suggestController.text, 
                          temporaryRecommendationController.text, permanentRecommendationController.text, selectValueResearch!);
                          resetValue();
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