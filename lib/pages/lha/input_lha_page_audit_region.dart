import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_division_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_sop_audit_region.dart';
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

  final ControllerAuditRegion controllerAuditRegion = Get.find();
  
  final TextEditingController descriptionFindingsController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  ModelListDivisionAuditRegion? _selecteDivision;
  ModelListSopAuditRegion? _selectSop;
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
                      value: _selecteDivision,
                      items: controllerAuditRegion.divisionAuditRegion.map((ModelListDivisionAuditRegion division){
                        return DropdownMenuItem(
                          value: division,
                          child: Text('${division.nameDivision}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _selecteDivision = value;
                        });
                      }
                    ),
                  )
                ),
              ),

              const SizedBox(height: 15),
              Text('Uraian temuan :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              formInputDescFinding(descriptionFindingsController),

              const SizedBox(height: 15),
              Text('Kategori SOP :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: CustomColors.grey, width: 1)
                      )
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: Text('Pilih kategori SOP', style: CustomStyles.textRegular13Px),
                      value: _selectSop,
                      items: controllerAuditRegion.sopAuditRegion.map((ModelListSopAuditRegion sop){
                        return DropdownMenuItem(
                          value: sop,
                          child: Text('${sop.sopName}', style: CustomStyles.textMedium15Px)
                          );
                      }).toList(), 
                      onChanged: (value)async{
                        setState(() {
                          _selectSop = value;
                        });
                      }
                    ),
                  )
                ),
              ),

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
                            if (_selecteDivision == null || descriptionFindingsController.text.isEmpty || _selectSop == null || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || _selectedValueResearch == null) {
                                snakcBarMessageRed('Gagal', 'Tidak boleh ada field yang kosong');
                            }else{
                              controllerAuditRegion.addToLocalLhaAuditRegion(_selecteDivision!.id!, _selectSop!.id!, descriptionFindingsController.text,
                              suggestController.text, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!, _selecteDivision!.nameDivision!, _selectSop!.sopName!);
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
                                    Text('${data.divisionName!.nameDivision}', style: CustomStyles.textBold13Px),
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
                    if (_selecteDivision == null || descriptionFindingsController.text.isEmpty || _selectSop == null || temporaryRecommendationController.text.isEmpty || permanentRecommendationController.text.isEmpty || _selectedSuggest == null || _selectedValueResearch == null) {
                          snakcBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong');
                        }else if(_selectedValueResearch == 1){
                          controllerAuditRegion.inputLhaAuditRegion(widget.scheduleId, 1);
                         snakcBarMessageGreen('Berhasil', 'Lha berhasil dibuat');
                          Get.to(() => const ClarificationPageAuditRegion());
                      }else{
                        controllerAuditRegion.inputLhaAuditRegion(widget.scheduleId, 1);
                          snakcBarMessageGreen('Berhasil', 'Lha berhasil dibuat');
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