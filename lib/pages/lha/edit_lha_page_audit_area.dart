import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_add_or_edit_lha.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLhaPageAuditArea extends StatefulWidget {
  final int id;
  final String lhaDescription;
  const EditLhaPageAuditArea(
      {super.key, required this.id, required this.lhaDescription});

  @override
  State<EditLhaPageAuditArea> createState() => _EditLhaPageAuditAreaState();
}

class _EditLhaPageAuditAreaState extends State<EditLhaPageAuditArea> {
  final TextEditingController lhaDescriptionController = TextEditingController();
  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  void initState() {
    lhaDescriptionController.text = widget.lhaDescription;
    super.initState();
  }

  @override
  void dispose() {
    lhaDescriptionController.dispose();
    super.dispose();
  }

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
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded,
                  size: 25, color: CustomColors.black)),
        ),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              formEditLha(lhaDescriptionController),

              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      controllerAuditArea.editLhaAuditArea(widget.id, lhaDescriptionController.text);
                      Get.snackbar('Berhasil', 'Edit LHA berhasil', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.green);
                      Navigator.pop(context);
                    },
                    child:
                        Text('Edit LHA', style: CustomStyles.textMediumWhite15Px)),
              )
            ],
          ),
        ),
        )
    );
  }
}
