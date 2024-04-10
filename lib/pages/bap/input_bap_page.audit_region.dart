import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/widgetBap/widget_alert_bap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputBapPageAuditRegion extends StatefulWidget {
  const InputBapPageAuditRegion({super.key});

  @override
  State<InputBapPageAuditRegion> createState() => _InputBapPageAuditRegionState();
}

class _InputBapPageAuditRegionState extends State<InputBapPageAuditRegion> {
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
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
            
            const SizedBox(height: 10),

            Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

            const SizedBox(height: 10),

            const SizedBox(height: 25),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue
                ),
                onPressed: (){
                  uploadBapAuditRegion(context, controllerAuditRegion, 0);
                  
                }, 
                child: Text('Upload BAP', style: CustomStyles.textMediumWhite15Px)
              ),
            )
          ],
        ),
      ),
    );
  }
}