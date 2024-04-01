import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/input_follow_up.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


//audit area
class FollowUpPageAuditArea extends StatefulWidget {
  const FollowUpPageAuditArea({super.key});

  @override
  State<FollowUpPageAuditArea> createState() => _FollowUpPageAuditAreaState();
}

class _FollowUpPageAuditAreaState extends State<FollowUpPageAuditArea> {

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Tindak lanjut'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
          actions: [
            IconButton(onPressed: (){
            showFilterFollowUp(context, startDateController, endDateController, auditorController, branchController, controllerAuditArea);
          },
          icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)),
          ],
      ),
      body: Obx((){
        
        if (controllerAuditArea.isLoading.value) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: controllerAuditArea.followUpArea.length,
              itemBuilder: (_, index){
                final followUp = controllerAuditArea.followUpArea[index];
                return GestureDetector(
                  child: Card(
                  elevation: 0,
                  color: CustomColors.white,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: CustomColors.grey
                    )
                  ),
                  child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No. dokumen : ${followUp.noDocument}', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('Auditor : ${followUp.auditor}', style: CustomStyles.textMedium13Px,),
                          const SizedBox(height: 5),
                          Text('Tanggal : ${followUp.dateFollowUp}', style: CustomStyles.textMedium13Px,),
                          ],
                        ),

                        IconButton(
                          onPressed: (){
                            showAlertFollowUpAuditArea(context, followUp.id);
                          },
                          icon: const Icon(Icons.more_vert_rounded, color: CustomColors.grey, size: 25)
                        )
                    ],
                  ),
                  ),
                ),
                onTap: (){
                    Get.to(() => InputFollowUp(auditor: followUp.auditor!, noClarification: followUp.noKlarifikasi!));
                  },
                );
              }
            ),
          );
        }
      }),
    );
  }
}