import 'package:audit_cms/data/controller/controllers.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
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
  final ControllerAllData controllerAllData = Get.find();

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
              TextField(
                  controller: lhaDescriptionController,
                  maxLines: 10,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.grey)))),

              const SizedBox(height: 30),

              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      showDialogEditLha(widget.id, lhaDescriptionController.text);
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

  void showDialogEditLha(int id, String lhaDescriptionController) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Alert'),
            titleTextStyle: CustomStyles.textBold18Px,
            content: const Text('Simpan perubahan?'),
            contentTextStyle: CustomStyles.textMedium15Px,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red
                          ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Tidak',
                          style: CustomStyles.textMediumWhite15Px)),
                          
                  const SizedBox(width: 5),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green
                          ),
                      onPressed: () {
                        controllerAllData.editLha(id, lhaDescriptionController);
                        Navigator.pop(context);
                      },
                      child: Text('Ya',
                          style: CustomStyles.textMediumWhite15Px))
                ],
              )
            ],
          );
        });
  }
}
