import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_form_input_follow_up.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InputFollowUp extends StatefulWidget {
  final int followUpId;
  final String auditor;
  final String noFollowUp;
  const InputFollowUp({super.key, required this.auditor, required this.noFollowUp, required this.followUpId});

  @override
  State<InputFollowUp> createState() => _InputFollowUpState();
}

class _InputFollowUpState extends State<InputFollowUp> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController realizationController = TextEditingController();
  final TextEditingController explanationPenaltyController = TextEditingController();
  final TextEditingController charCossController = TextEditingController();
  DataListPenaltyAuditArea? penalty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Input tindak lanjut'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              Text('No tindak lanjut :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 5),   
              Text('${widget.noFollowUp} :', style: CustomStyles.textMedium13Px),

              const SizedBox(height: 15),   
              Text('Auditor :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 5),   
              Text('${widget.auditor} :', style: CustomStyles.textMedium13Px),
              
              const SizedBox(height: 15),
              Text('Alasan sanksi :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputExplanationPenalty(explanationPenaltyController),

              const SizedBox(height: 15),
              Text('Lampiran :', style: CustomStyles.textMedium15Px),
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
                      hint: Text('Pilih lampiran', style: CustomStyles.textRegular13Px),
                      value: penalty,
                      items: controllerAuditArea.penaltyAuditArea.map((penalty){
                        return DropdownMenuItem(
                          value: penalty,
                          child: Text('${penalty.name}', style: CustomStyles.textMedium15Px)
                        );
                      }).toList(),
                      onChanged: (value)async{
                        setState(() {
                         penalty = value;

                        });
                      }
                    ),
                  )
                ),
              ),

              Wrap(
                children: [
                  penalty?.id == 5 ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text('Kerugian :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  formInputcharCossPenalty(charCossController, symbol: 'Rp'),
                ],
              ): const SizedBox()
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('List penalty', style: CustomStyles.textMedium15Px),
                  TextButton(
                    onPressed: (){
                      if (penalty == null || explanationPenaltyController.text.isEmpty) {
                        snackBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong atau belum diisi');
                    }else{
                        controllerAuditArea.addPenalty(penalty?.id, penalty?.name);
                        clearFollowUp();  
                    }
                  }, child: Text('Tambah penalty', style: CustomStyles.textMediumGreen15Px),
                  )
                ],
              ),

              Obx(() => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controllerAuditArea.penaltyIdList.length,
                itemBuilder: (_, index){
                  final penaltyId = controllerAuditArea.penaltyIdList[index];
                  final penaltyName = controllerAuditArea.penaltyAuditArea.firstWhere((element) => element.id == penaltyId);
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${penaltyName.name}', style: CustomStyles.textMedium15Px),
                        IconButton(
                          onPressed: (){
                          if (controllerAuditArea.penaltyIdList[index] == 5) {
                            controllerAuditArea.penaltyIdList.removeAt(index);
                            charCossController.clear();
                          } else {
                            controllerAuditArea.penaltyIdList.removeAt(index);
                          }
                        }, icon: const Icon(Icons.delete, color: CustomColors.red))
                      ],
                    )
                  );
                }
              )),


              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CustomStyles.customRoundedButton,
                    backgroundColor: CustomColors.blue
                  ),
                  
                  onPressed: (){
                    String chargingCoss = charCossController.text;
                    chargingCoss = chargingCoss.replaceAll('Rp', '');
                    chargingCoss = chargingCoss.replaceAll('.', '');
                    double? charCoss = chargingCoss.isNotEmpty ? double.parse(chargingCoss) : null;
                    if (controllerAuditArea.penaltyIdList.isEmpty) {
                      snackBarMessageRed('Gagal', 'List tindak lanjut tidak boleh kosong');
                    } else {
                      if (charCoss != null) {
                        controllerAuditArea.inputFollowUpAuditArea(widget.followUpId, charCoss, explanationPenaltyController.text);
                      } else {
                        controllerAuditArea.inputFollowUpAuditArea(widget.followUpId, 0, explanationPenaltyController.text);
                      }
                      explanationPenaltyController.clear();
                    }
                  }, 
                  child: Text('Simpan', style: CustomStyles.textMediumWhite15Px)
                ),
              )
          ],
        ),
      ),
    )
  );
}
  void clearFollowUp(){
    setState(() {
      penalty = null;
    });
  }
}