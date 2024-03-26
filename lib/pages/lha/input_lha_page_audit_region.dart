import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_division_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_sop_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputLhaPageAuditRegion extends StatefulWidget {
  const InputLhaPageAuditRegion({super.key});

  @override
  State<InputLhaPageAuditRegion> createState() => _InputLhaPageAuditRegionState();
}

class _InputLhaPageAuditRegionState extends State<InputLhaPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();
  
  final TextEditingController descriptionFindingsController = TextEditingController();
  final TextEditingController temporaryRecommendationController = TextEditingController();
  final TextEditingController permanentRecommendationController = TextEditingController();
  final TextEditingController suggestController = TextEditingController();

  int? _selecteDivision;
  int? _selectSop;
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
                          value: division.id,
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
              TextField(
                controller: descriptionFindingsController,
                onChanged: (desc) => descriptionFindingsController.text = desc,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan uraian temuan...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

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
                          value: sop.id,
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
              TextField(
                controller: temporaryRecommendationController,
                onChanged: (temporary) => temporaryRecommendationController.text = temporary,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan rekomendasi sementara...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Rekomendasi permanent :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              TextField(
                controller: permanentRecommendationController,
                onChanged: (permanent) => permanentRecommendationController.text = permanent,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan rekomendasi permanent...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

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
              TextField(
                controller: suggestController,
                onChanged: (suggest) => suggestController.text = suggest,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan rekomendasi atau saran...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

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
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP, 
                              colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{
                              controllerAuditRegion.addToLocalLhaAuditRegion(_selecteDivision!, descriptionFindingsController.text, 
                              _selectSop!, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!, suggestController.text);
                            }
                          },
                          child: Text('Tambah LHA', style: CustomStyles.textBoldGreen13Px))
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Uraian temuan', style: CustomStyles.textMedium13Px),
                    ],
                  ),

                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAuditRegion.dataListLocalLhaAuditRegion.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditRegion.dataListLocalLhaAuditRegion[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text('${data.findingDescription}', style: CustomStyles.textRegular13Px, maxLines: 5, overflow: TextOverflow.ellipsis),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                Get.snackbar('Alert', 'Data berhasil dihapus', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                              },
                            )
                          ],  
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
                          Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }else if(_selectedValueResearch == 1){
                          controllerAuditRegion.inputLhaAuditRegion(_selecteDivision!, descriptionFindingsController.text, 
                          _selectSop!, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!, suggestController.text);
                          Get.snackbar('Alert', 'Lha berhasil dibuat', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.green);
                          Get.to(() => const ClarificationPageAuditRegion());
                      }else{
                        controllerAuditRegion.inputLhaAuditRegion(_selecteDivision!, descriptionFindingsController.text, 
                          _selectSop!, temporaryRecommendationController.text, permanentRecommendationController.text, _selectedValueResearch!, suggestController.text);
                          Get.snackbar('Alert', 'Lha berhasil dibuat', snackPosition: SnackPosition.TOP, 
                            colorText: CustomColors.white, backgroundColor: CustomColors.green);
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