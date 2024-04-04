import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_revisi_lha_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListLhaCasesPageAuditArea extends StatefulWidget {
  final int lhaId;
  const ListLhaCasesPageAuditArea({super.key, required this.lhaId});

  @override
  State<ListLhaCasesPageAuditArea> createState() => _ListLhaCasesPageAuditAreaState();
}

class _ListLhaCasesPageAuditAreaState extends State<ListLhaCasesPageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.lhaId.value = widget.lhaId;
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        backgroundColor: CustomColors.white,
          appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Kasus LHA'),
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
              unselectedLabelStyle: const TextStyle(color: CustomColors.grey, fontFamily: 'RobotoMedium', fontSize: 13),
              labelStyle: const TextStyle(color: CustomColors.blue, fontFamily: 'RobotoMedium', fontSize: 13),
              tabs: const [
                Tab(text: 'Kasus'),
                Tab(text: 'Hasil revisi kasus'),
              ],
            ),
          ),

          body: TabBarView(
            children: [

              //revisi
              Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: PagedListView<int, LhaDetails>(
                    pagingController: controllerAuditArea.pagingControllerLhaRevisi,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (_, lha, index){
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
                  
                                          Text('Kasus : ${lha.cases}', style: CustomStyles.textBold15Px),
                                          Text('Kategori Kasus : ${lha.caseCategory}', style: CustomStyles.textBold15Px),
                  
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                      shape:
                                                          CustomStyles.customRoundedButton),
                                                  onPressed: () {
                                                    Get.to(() => EditLhaPageAuditArea(lhaId: lha.id!));
                                                  },
                                                  child: Text('Revisi',style: CustomStyles.textMediumBlue15Px)),
                  
                                              const SizedBox(width: 5),
                  
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                      shape: CustomStyles.customRoundedButton),
                                                  onPressed: () {
                                                      Get.to(() => DetaiCasesLhaPageAuditArea(lhaId: lha.id!));
                                                  },
                                                  child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  );
                      }
                    ),
                  ),
                ),
              ),

              //hasil revisi
              Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox()
                ),
              ),

            ]
          ),
      )
    );
  }
}

class EditLhaPageAuditArea extends StatefulWidget {
  final int lhaId;
  const EditLhaPageAuditArea(
      {super.key, required this.lhaId});

  @override
  State<EditLhaPageAuditArea> createState() => _EditLhaPageAuditAreaState();
}

class _EditLhaPageAuditAreaState extends State<EditLhaPageAuditArea> {
  final TextEditingController lhaDescriptionController = TextEditingController();
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();
  
  int? _cases;
  int? _caseCategory;
  int? _caseCategoryById;
  int? _selectedValueResearch;
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
              SizedBox(
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
                      hint: Text('Pilih divisi', style: CustomStyles.textRegular13Px),
                      value: _cases,
                      items: controllerAuditArea.caseAuditArea.map((cases){
                        return DropdownMenuItem(
                          value: cases.id,
                          child: Text('${cases.code}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _cases = value;
                        });
                      }
                    ),
                  )
                ),
              ),

              const SizedBox(height: 20),
              Text('Kategori kasus :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              SizedBox(
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
                          value: caseCategory.id,
                          child: Text('${caseCategory.name}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _caseCategory = value;
                          final caseId = value;
                          if (caseId != null) {
                            controllerAuditArea.loadCaseCategoryById(caseId); 
                          }
                        });
                      }
                    ),
                  )
                ),
              ),

              const SizedBox(height: 20),
              Text('Kategori kasus by id :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              SizedBox(
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
                      hint: Text('Pilih kasus kategori by id', style: CustomStyles.textRegular13Px),
                      value: _caseCategoryById,
                      items: controllerAuditArea.caseCategoryById.map((caseCategoryById){
                        return DropdownMenuItem(
                          value: caseCategoryById.id,
                          child: Text('${caseCategoryById.name}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _caseCategoryById = value;
                        });
                      }
                    ),
                  )
                ),
              ),

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

              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      snakcBarMessageGreen('Berhasil', 'LHA berhasil di revisi');
                      controllerAuditArea.revisiLha(widget.lhaId, _cases!, _caseCategoryById!, lhaDescriptionController.text, 
                      suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!);
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
