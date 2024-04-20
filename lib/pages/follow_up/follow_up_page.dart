import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/detail_follow_up.dart';
import 'package:audit_cms/pages/follow_up/input_follow_up.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


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

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

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
            showFilterFollowUp(context, startDateController, endDateController, auditorController, controllerAuditArea);
          },
          icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: PagedListView<int, ContentListFollowUp>(
          pagingController: controllerAuditArea.pagingControllerFollowUp,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (_, followUp, index){
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('${followUp.user!.fullname}', style: CustomStyles.textBold15Px),
                                  const SizedBox(height: 5),
                                  
                                ],
                              ),
                               Text('${followUp.status}', style: CustomStyles.textMedium13Px,),
                            ],
                          ),
                          Text('${followUp.code}', style: CustomStyles.textMedium13Px,),
                        ],
                      )
                  ),
                ),
                onTap: (){
                    final status = followUp.status;
                      if (status == 'CREATE') {
                          Get.to(() => InputFollowUp(auditor: followUp.user!.fullname!, noFollowUp: followUp.code!, followUpId: followUp.id!));
                        } else if(status == 'PROGRESS') {
                          Get.to(() => DetailFollowUpPageAuditArea(id: followUp.id!));
                        }
                  },
                );
            }
          )
        ),
      )
    );
  }
}