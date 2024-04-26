import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_form_input_clarification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InputClarificationPageAuditRegion extends StatefulWidget {
  final int id;
  const InputClarificationPageAuditRegion({super.key, required this.id});

  @override
  State<InputClarificationPageAuditRegion> createState() => _InputClarificationPageAuditRegionState();
}

class _InputClarificationPageAuditRegionState extends State<InputClarificationPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  final TextEditingController limitEvaluationController = TextEditingController();
  final TextEditingController auditLocationController = TextEditingController();
  final TextEditingController divisionInspectionController = TextEditingController();
  final TextEditingController directSupervisorController = TextEditingController();
  final TextEditingController findingDescriptionController = TextEditingController();

  String? _selectedPriorityFinding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Input klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Get.offAll(() => const ClarificationPageAuditRegion());
              },
              icon: const Icon(Icons.arrow_back_rounded, size: 25, color: CustomColors.black)),
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              const SizedBox(height: 15),
              Text('Batasan evaluasi :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputLimitEvaluation(context, limitEvaluationController),

              const SizedBox(height: 15),
              Text('Lokasi pemeriksaan yang diaudit :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAllClarification('Masukan lokasi pemeriksaan yang diaudit...', auditLocationController),

              const SizedBox(height: 15),
              Text('Divisi yang diperiksa :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAllClarification('Masukan divisi yang diperiksa...', divisionInspectionController),

              const SizedBox(height: 15),
              Text('Atasan langsung :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAllClarification('Masukan pesan atasan langsung...', directSupervisorController),

              const SizedBox(height: 15),
              Text('Penjabaran temuan audit :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAllClarification('Masukan penjabaran temuan audit...', findingDescriptionController),

              const SizedBox(height: 15),
                Text('Prioritas temuan :', style: CustomStyles.textBold15Px),
                const SizedBox(height: 15),
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CustomColors.grey,
                        width: 1
                      ),
                    )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: Text('Pilih prioritas temuan', style: CustomStyles.textRegular15Px),
                      value: _selectedPriorityFinding,
                      items: controllerAuditRegion.priorityFindingClarificationAuditRegion.map((findings){
                        return DropdownMenuItem(
                          value: findings,
                          child: Text(findings, style: CustomStyles.textMedium15Px)
                        );
                      }).toList(), 
                      onChanged: (value){
                        setState(() {
                          _selectedPriorityFinding = value;
                        });
                      }
                    )
                  ),
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
                      final limitEvaluation = limitEvaluationController.text;
                      final locationInspection = auditLocationController.text;
                      final divisionInspection = divisionInspectionController.text;
                      final supervisor = directSupervisorController.text;
                      final desc = findingDescriptionController.text;
                      final selectPriority = _selectedPriorityFinding;

                      if (limitEvaluation.isEmpty || locationInspection.isEmpty || divisionInspection.isEmpty || supervisor.isEmpty || desc.isEmpty || selectPriority == null) {
                        Get.snackbar('Klarifikasi gagal dibuat', 'Tidak boleh ada field yang kosong', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else{
                        controllerAuditRegion.inputClarificationAuditRegion(widget.id, limitEvaluation, locationInspection, divisionInspection, supervisor, desc, selectPriority);
                        Get.back();
                      }
                    }, 
                    child: Text('Simpan', style: CustomStyles.textMediumWhite15Px)
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}