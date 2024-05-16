import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/bap_page.dart';
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
  final TextEditingController descController = TextEditingController();
  int? _followUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Identifikasi klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
            onPressed: (){
              Get.back();
            }, 
            icon: const Icon(Icons.arrow_back, color: CustomColors.black, size: 25)
          ),
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
                          if (_evaluation == 0 || _evaluation == null) {
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
              Text('Deskripsi atau rekomendasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              formInputDesc(descController),

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
                              if (_evaluation == null || descController.text.isEmpty || _followUp == null) {
                                Get.snackbar('Alert', 'Tidak boleh ada field yang kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else if(loss != null){
                                controllerAuditArea.inputIdentificatinClarificationAuditArea(widget.clarificationId, _evaluation!, loss, descController.text, _followUp!);
                                Get.to(() => const BapAuditAreaPage());
                              }else{
                                Get.offAll(() => BotNavePageAuditArea());
                                controllerAuditArea.inputIdentificatinClarificationAuditArea(widget.clarificationId, _evaluation!, 0, descController.text, _followUp!);
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
}

//audit region
class InputIdentificationClarificationAuditRegionPage extends StatefulWidget {
 final int clarificationId;
  const InputIdentificationClarificationAuditRegionPage({super.key, required this.clarificationId});

  @override
  State<InputIdentificationClarificationAuditRegionPage> createState() => _InputIdentificationClarificationAuditRegionPageState();
}

class _InputIdentificationClarificationAuditRegionPageState extends State<InputIdentificationClarificationAuditRegionPage> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  int? _evaluation;
  final TextEditingController lossController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  int? _followUp;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Identifikasi klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
            onPressed: (){
              Get.back();
            }, 
            icon: const Icon(Icons.arrow_back, color: CustomColors.black, size: 25)
          ),
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
                          if (_evaluation == 0 || _evaluation == null) {
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
              Text('Deskripsi atau rekomendasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              formInputDesc(descController),

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
                              if (_evaluation == null || descController.text.isEmpty || _followUp == null) {
                                Get.snackbar('Alert', 'Tidak boleh ada field yang kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else if(loss != null){
                                controllerAuditRegion.inputIdentificatinClarificationAuditRegion(widget.clarificationId, _evaluation!, loss, descController.text, _followUp!);
                                Get.to(() => const BapAuditRegionPage());
                              }else{
                                Get.offAll(() => BotNavAuditRegion());
                                controllerAuditRegion.inputIdentificatinClarificationAuditRegion(widget.clarificationId, _evaluation!, 0, descController.text, _followUp!);
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
}