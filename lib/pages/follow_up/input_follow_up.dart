import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/document_follow_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class InputFollowUp extends StatefulWidget {
  final String auditor;
  final String noClarification;
  const InputFollowUp({super.key, required this.auditor, required this.noClarification});

  @override
  State<InputFollowUp> createState() => _InputFollowUpState();
}

class _InputFollowUpState extends State<InputFollowUp> {

  final ControllerAuditArea controllerAuditArea = Get.find();
  int? _selectValuePenalty;
  int? _selectAttachment;
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              Text('No klarifikasi :', style: CustomStyles.textBold15Px),
              const SizedBox(height: 5),   
              Text('${widget.noClarification} :', style: CustomStyles.textMedium13Px),

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
                    selected: _selectValuePenalty == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectValuePenalty = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),

            const SizedBox(height: 15),
              Text('Realisasi :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                controller: realizationController,
                onChanged: (realization) => realizationController.text = realization,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Realisasi...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Alasan sanksi :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                controller: explanationPenaltyController,
                onChanged: (explanationPenalty) => explanationPenaltyController.text = explanationPenalty,
                cursorColor: CustomColors.blue,
                maxLines: 5,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan alasan sanksi...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

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
                      value: _selectAttachment,
                      items: controllerAuditArea.attachmentAuditArea.map((attachment){
                        return DropdownMenuItem(
                          value: attachment.id,
                          child: Text('${attachment.attachmentName}', style: CustomStyles.textMedium15Px)
                        );
                      }).toList(),
                      onChanged: (value)async{
                        setState(() {
                          _selectAttachment = value;
                          
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
                    final penalty = _selectValuePenalty;
                    final attachment = _selectAttachment;
                    final realization = realizationController.text;
                    final explanationPenalty = explanationPenaltyController.text;

                    if (penalty == null || attachment == null || realization.isEmpty || explanationPenalty.isEmpty) {
                        Get.snackbar('Alert', 'Field tidak boleh ada yang kosong', snackPosition: SnackPosition.TOP, 
                        backgroundColor: CustomColors.red, colorText: CustomColors.white);
                    }else{
                        controllerAuditArea.inputFollowUpAuditArea(penalty, realization, explanationPenalty, attachment);
                        Get.snackbar('Alert', 'Tindak lanjut berhasil di input', snackPosition: SnackPosition.TOP, 
                        backgroundColor: CustomColors.green, colorText: CustomColors.white);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentFollowUpPage()));
                        
                        print('Input tindak lanjut : $penalty, $attachment, $realization, $explanationPenalty');
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