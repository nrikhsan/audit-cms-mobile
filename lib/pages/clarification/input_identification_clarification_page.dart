import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_recommendation.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/detail_bap_page.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_form_input_clarification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//audit area
class InputIdentifcationClarificationAuditArea extends StatefulWidget {
  final int clarificationId;
  const InputIdentifcationClarificationAuditArea({super.key, required this.clarificationId});

  @override
  State<InputIdentifcationClarificationAuditArea> createState() => _InputIdentifcationClarificationAuditAreaState();
}

class _InputIdentifcationClarificationAuditAreaState extends State<InputIdentifcationClarificationAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  int? _evaluation;
  final TextEditingController lossController = TextEditingController();
  int? _followUp;
  DataListPenaltyAuditArea? recommendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Identifikasi klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
              Text('Evaluasi klarifikasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip( 
                      label: Text(index == 0 ? 'Ditolak' : 'Diterima', style: CustomStyles.textMedium15Px), 
                      selected: _evaluation == index,
                      onSelected: (bool selected){
                        setState(() {
                          _evaluation = selected ? index: null;
                          if (_evaluation == 1 || _evaluation == null) {
                            lossController.clear();
                          }
                          
                        });
                      },
                    );
                  }
                ).toList()
              ),

              const SizedBox(height: 15),
              if(_evaluation == 0)
              formInputLoss(lossController),

              const SizedBox(height: 15),
              Text('Rekomendasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1, color: CustomColors.grey
                        )
                      )
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: Text('Pilih rekomendasi', style: CustomStyles.textRegular13Px),
                      value: recommendation,
                      items: controllerAuditArea.recommendationListAuditArea.map((recommendation){
                        return DropdownMenuItem(
                          value: recommendation,
                          child: Text('${recommendation.name}', style: CustomStyles.textMedium15Px)
                        );
                      }).toList(),
                      onChanged: (value)async{
                        setState(() {
                         recommendation = value;

                        });
                      }
                    ),
                  )
                ),
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('List rekomendasi', style: CustomStyles.textMedium15Px),
                  TextButton(
                    onPressed: (){
                        if (recommendation == null) {
                          Get.snackbar('Alert', 'Rekomendasi tidak boleh kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                        } else {
                          controllerAuditArea.addRecommendation(recommendation?.id, recommendation?.name);
                          clearRecommendation();
                        }
                      
                  }, child: Text('Tambah rekomendasi', style: CustomStyles.textMediumGreen13Px),
                  )
                ],
              ),

              const SizedBox(height: 20),

              Obx(() => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controllerAuditArea.recommendation.length,
                itemBuilder: (_, index){
                  final recommendationId = controllerAuditArea.recommendation[index];
                  final recommendationName = controllerAuditArea.recommendationListAuditArea.firstWhere((element) => element.id == recommendationId);
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${recommendationName.name}', style: CustomStyles.textMedium15Px),
                        IconButton(
                          onPressed: (){
                            controllerAuditArea.recommendation.removeAt(index);
                        }, icon: const Icon(Icons.delete, color: CustomColors.red))
                      ],
                    )
                  );
                }
              )),


              const SizedBox(height: 30),

              const SizedBox(height: 15),
              Text('Tindak lanjut : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak' : 'Ya', style: CustomStyles.textMedium15Px), 
                      selected: _followUp == index,
                      onSelected: (bool selected){
                        setState(() {
                          _followUp = selected ? index : null;
                        });
                      },
                    );
                  }
                ).toList()
              ),

              const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                            onPressed: () async {
                             String nominalLossText = lossController.text;

                              nominalLossText = nominalLossText.replaceAll('Rp', '');
                              nominalLossText = nominalLossText.replaceAll('.', '');

                              double? loss = nominalLossText.isNotEmpty ? double.parse(nominalLossText) : null;
                              final bapId = controllerAuditArea.dataInputIdentification.value?.bap?.id;
                              if (_evaluation == null || _followUp == null) {
                                Get.snackbar('Alert', 'Tidak boleh ada field yang kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else if(controllerAuditArea.recommendation.isEmpty){
                                Get.snackbar('Alert', 'List rekomendasi tidak boleh kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else{
                                if(loss != null){
                                controllerAuditArea.inputIdentificatinClarificationAuditArea(widget.clarificationId, _evaluation!, loss, _followUp!);
                                Get.off(() => DetailBapPageAuditArea(id: bapId, level: 'AREA'));
                              }else{
                                Get.offAll(() => BotNavePageAuditArea());
                                controllerAuditArea.inputIdentificatinClarificationAuditArea(widget.clarificationId, _evaluation!, 0, _followUp!);
                              }
                              }
                            },
                          child: Text('Simpan identifikasi', style: CustomStyles.textMediumWhite15Px)
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }

  void clearRecommendation(){
    setState(() {
      recommendation = null;
    });
  }
}

//audit region
class InputIdentificationClarificationAuditRegionPage extends StatefulWidget {
 final int? clarificationId;
  const InputIdentificationClarificationAuditRegionPage({super.key, required this.clarificationId});

  @override
  State<InputIdentificationClarificationAuditRegionPage> createState() => _InputIdentificationClarificationAuditRegionPageState();
}

class _InputIdentificationClarificationAuditRegionPageState extends State<InputIdentificationClarificationAuditRegionPage> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  int? _evaluation;
  final TextEditingController lossController = TextEditingController();
  int? _followUp;
  DataListRecommendation? recommendation;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Identifikasi klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
              Text('Evaluasi klarifikasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip( 
                      label: Text(index == 0 ? 'Ditolak' : 'Diterima', style: CustomStyles.textMedium15Px), 
                      selected: _evaluation == index,
                      onSelected: (bool selected){
                        setState(() {
                          _evaluation = selected ? index: null;
                          if (_evaluation == 1 || _evaluation == null) {
                            lossController.clear();
                            
                          }
                          
                        });
                      },
                    );
                  }
                ).toList()
              ),

              const SizedBox(height: 15),
              if(_evaluation == 0)
              formInputLoss(lossController),

              const SizedBox(height: 15),
              Text('Rekomendasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1, color: CustomColors.grey
                        )
                      )
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: Text('Pilih rekomendasi', style: CustomStyles.textRegular13Px),
                      value: recommendation,
                      items: controllerAuditRegion.recommendationListAudit.map((recommendation){
                        return DropdownMenuItem(
                          value: recommendation,
                          child: Text('${recommendation.name}', style: CustomStyles.textMedium15Px)
                        );
                      }).toList(),
                      onChanged: (value)async{
                        setState(() {
                         recommendation = value;

                        });
                      }
                    ),
                  )
                ),
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('List rekomendasi', style: CustomStyles.textMedium15Px),
                  TextButton(
                    onPressed: (){
                        if (recommendation == null) {
                          Get.snackbar('Alert', 'Rekomendasi tidak boleh kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                        } else {
                          controllerAuditRegion.addRecommendation(recommendation?.id, recommendation?.name);
                          clearRecommendation();
                        }
                      
                  }, child: Text('Tambah rekomendasi', style: CustomStyles.textMediumGreen13Px),
                  )
                ],
              ),

              const SizedBox(height: 20),

              Obx(() => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controllerAuditRegion.recommendation.length,
                itemBuilder: (_, index){
                  final recommendationId = controllerAuditRegion.recommendation[index];
                  final recommendationName = controllerAuditRegion.recommendationListAudit.firstWhere((element) => element.id == recommendationId);
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${recommendationName.name}', style: CustomStyles.textMedium15Px),
                        IconButton(
                          onPressed: (){
                            controllerAuditRegion.recommendation.removeAt(index);
                        }, icon: const Icon(Icons.delete, color: CustomColors.red))
                      ],
                    )
                  );
                }
              )),

              const SizedBox(height: 15),
              Text('Tindak lanjut : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak' : 'Ya', style: CustomStyles.textMedium15Px), 
                      selected: _followUp == index,
                      onSelected: (bool selected){
                        setState(() {
                          _followUp = selected ? index : null;
                        });
                      },
                    );
                  }
                ).toList()
              ),

              const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                            onPressed: () async {
                              String nominalLossText = lossController.text;
                              nominalLossText = nominalLossText.replaceAll('Rp', '');
                              nominalLossText = nominalLossText.replaceAll('.', '');
                              double? loss = nominalLossText.isNotEmpty ? double.parse(nominalLossText) : null;
                              final bapId = controllerAuditRegion.dataInputIdentification.value?.bap?.id;
                              if (_evaluation == null || _followUp == null) {
                                Get.snackbar('Alert', 'Tidak boleh ada field yang kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else if(controllerAuditRegion.recommendation.isEmpty){
                                Get.snackbar('Alert', 'List rekomendasi tidak boleh kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else{
                                if(loss != null){
                                controllerAuditRegion.inputIdentificatinClarificationAuditRegion(widget.clarificationId, _evaluation!, loss, _followUp!);
                                Get.off(() => DetailBapAuditRegion(id: bapId));
                              }else{
                                Get.offAll(() => BotNavAuditRegion());
                                controllerAuditRegion.inputIdentificatinClarificationAuditRegion(widget.clarificationId, _evaluation!, 0, _followUp!);
                              }
                              }
                            },
                          child: Text('Simpan identifikasi', style: CustomStyles.textMediumWhite15Px)
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
  void clearRecommendation(){
    setState(() {
      recommendation = null;
    });
  }
}