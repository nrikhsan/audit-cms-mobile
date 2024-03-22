import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputBapPageAuditRegion extends StatefulWidget {
  const InputBapPageAuditRegion({super.key});

  @override
  State<InputBapPageAuditRegion> createState() => _InputBapPageAuditRegionState();
}

class _InputBapPageAuditRegionState extends State<InputBapPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Upload BAP'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
            onPressed: (){
              Get.back();
            }, 
            icon: const Icon(Icons.arrow_back, color: CustomColors.black, size: 25)
          ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 15),
            Text('No. BAP :', style: CustomStyles.textBold15Px,),
            const SizedBox(height: 5),
            Text('012C/AS/IA/CMS/V/2023', style: CustomStyles.textMedium13Px),

            const SizedBox(height: 15),
            Text('No. Klarifikasi :', style: CustomStyles.textBold15Px,),
            const SizedBox(height: 5),
            Text('012C/AS/IA/CMS/V/2023', style: CustomStyles.textMedium13Px),

            const SizedBox(height: 25),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue
                ),
                onPressed: (){
                  uploadBapAuditRegion();
                }, 
                child: Text('Upload BAP', style: CustomStyles.textMediumWhite15Px)
              ),
            )
          ],
        ),
      ),
    );
  }

   void uploadBapAuditRegion() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Upload PDF File"),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 10),

                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileBapAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 10),

                Obx(() => TextButton(
                      onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                      ? () {
                            controllerAuditRegion.uploadBapAuditRegion(controllerAuditRegion.selectedFileName.value);
                            Get.offAll(() => BotNavAuditRegion());
                         }
                      : null,
                      child: Text('Upload', style: CustomStyles.textMediumBlue15Px),
                    )),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Close", style: CustomStyles.textMediumRed15Px),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
      );
  }
}