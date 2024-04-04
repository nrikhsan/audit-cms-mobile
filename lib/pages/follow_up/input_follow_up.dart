import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/document_follow_up_page.dart';
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
  int? _penaltyId;
  int? _isPenalty;
  final TextEditingController realizationController = TextEditingController();
  final TextEditingController explanationPenaltyController = TextEditingController();

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
              Text('Sanksi :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate(
                2,
                (index) {
                  return ChoiceChip(
                    elevation: 0,
                    selectedColor: CustomColors.lightGrey,
                    label: Text(index == 0 ? 'Tidak memberi sanksi' : 'Memberi anksi', style: CustomStyles.textMedium13Px),
                    selected: _isPenalty == index,
                    onSelected: (selected) {
                      setState(() {
                        _isPenalty = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),

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
                      value: _penaltyId,
                      items: controllerAuditArea.penaltyAuditArea.map((penalty){
                        return DropdownMenuItem(
                          value: penalty.id,
                          child: Text('${penalty.name}', style: CustomStyles.textMedium15Px)
                        );
                      }).toList(),
                      onChanged: (value)async{
                        setState(() {
                          _penaltyId = value;
                          
                        });
                      }
                    ),
                  )
                ),
              ),


              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CustomStyles.customRoundedButton,
                    backgroundColor: CustomColors.blue
                  ),
                  onPressed: (){
                    final penaltyId = _penaltyId;
                    final explanationPenalty = explanationPenaltyController.text;
                    final isPenalty = _isPenalty;

                    if (isPenalty == null || penaltyId == null || explanationPenalty.isEmpty) {
                        snakcBarMessageRed('Gagal', 'Field tidak boleh ada yang kosong atau belum diisi');
                    }else{
                        controllerAuditArea.inputFollowUpAuditArea(widget.followUpId, penaltyId, explanationPenalty, isPenalty);
                        snakcBarMessageGreen('Berhasil', 'Tindak lanjut berhasil dibuat');
                        Get.off(() => const DocumentFollowUpPage());
                        
                        print('Input tindak lanjut : ${widget.followUpId} , $isPenalty, $penaltyId, $explanationPenalty');
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
}