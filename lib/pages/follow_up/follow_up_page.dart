import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/follow_up/detail_follow_up.dart';
import 'package:audit_cms/pages/follow_up/document_follow_up_page.dart';
import 'package:audit_cms/pages/follow_up/input_follow_up.dart';
import 'package:audit_cms/pages/follow_up/widgetFollowUp/widget_filter_and_alert_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';


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
  final TextEditingController branchEditingController = TextEditingController();

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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => BotNavePageAuditArea()), (route) => false);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
          actions: [
            IconButton(onPressed: (){
            showFilterFollowUp(context, startDateController, endDateController, auditorController, controllerAuditArea, branchEditingController);
          },
          icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
            onRefresh: ()async{
              controllerAuditArea.pagingControllerFollowUp.refresh();
            },
            child: PagedListView<int, ContentListFollowUp>(
            pagingController: controllerAuditArea.pagingControllerFollowUp,
            builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (_, followUp, index){
                  final status = followUp.status;
                  final evaluationLimitation = followUp.clarification?.evaluationLimitation != null ? DateTime.parse('${followUp.clarification?.evaluationLimitation}') : null;
                  return GestureDetector(
                    child: Card(
                      elevation: 0,
                      color: CustomColors.white,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: CustomColors.lightGrey
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
                                  Wrap(
                                    children: [
                                      if(status == 'CREATE')
                                      Text('Buat', style: CustomStyles.textMedium13Px),
                                      if(status == 'PROGRESS')
                                      Text('Sedang dibuat', style: CustomStyles.textMedium13Px),
                                      if(status == 'REALIZE')
                                      Text('Menunggu realisasi', style: CustomStyles.textMedium13Px),
                                      if(status == 'CLOSE')
                                      Text('Selesai', style: CustomStyles.textMedium13Px),
                                    ],
                                  )
                                  
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: CustomColors.lightGrey,
                                height: 10,
                              ),
                              const SizedBox(height: 5),
                              Text('${followUp.code}', style: CustomStyles.textRegular13Px,),
                              const SizedBox(height: 5),
                              Text('Batasan evaluasi : ${evaluationLimitation != null ? DateFormat('yyyy-MM-dd').format(evaluationLimitation) : '-' }', style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 5),
                              
                            ],
                          )
                      ),
                    ),
                    onTap: (){
                      final status = followUp.status;
                      if(status == 'CREATE') {
                        Get.to(() => InputFollowUp(auditor: followUp.user!.fullname!, noFollowUp: followUp.code!, followUpId: followUp.id!));
                      }else if(status == 'PROGRESS') {
                        Get.to(() => DocumentFollowUpPage(fileName: followUp.filename, followUpId: followUp.id));
                      }else if(status == 'REALIZE'){
                        Get.to(() => DetailFollowUpPageAuditArea(id: followUp.id!));
                      }else if(status == 'CLOSE'){
                        Get.to(() => DetailFollowUpPageAuditArea(id: followUp.id!));
                      }
                    },
                  );
                }
            )
        ))
      )
    );
  }
}

class FollowUpPageAuditRegion extends StatefulWidget {
  const FollowUpPageAuditRegion({super.key});

  @override
  State<FollowUpPageAuditRegion> createState() => _FollowUpPageAuditRegionState();
}

class _FollowUpPageAuditRegionState extends State<FollowUpPageAuditRegion> {

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => BotNavAuditRegion()), (route) => false);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
          actions: [
            IconButton(onPressed: (){
            showBottomSheetFilterFollowUpAuditRegion(context, startDateController, endDateController, controllerAuditRegion);
          },
          icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
            onRefresh: ()async{
              controllerAuditRegion.pagingControllerFollowUp.refresh();
            },
            child: PagedListView<int, ContentListFollowUp>(
            pagingController: controllerAuditRegion.pagingControllerFollowUp,
            builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (_, followUp, index){
                  final status = followUp.status;
                  final evaluationLimitation = followUp.clarification?.evaluationLimitation != null ? DateTime.parse('${followUp.clarification?.evaluationLimitation}') : null;
                  return GestureDetector(
                    child: Card(
                      elevation: 0,
                      color: CustomColors.white,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: CustomColors.lightGrey
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
                                  Wrap(
                                    children: [
                                      if(status == 'CREATE')
                                      Text('Buat', style: CustomStyles.textMedium13Px),
                                      if(status == 'PROGRESS')
                                      Text('Sedang dibuat', style: CustomStyles.textMedium13Px),
                                      if(status == 'REALIZE')
                                      Text('Menunggu realisasi', style: CustomStyles.textMedium13Px),
                                      if(status == 'CLOSE')
                                      Text('Selesai', style: CustomStyles.textMedium13Px),
                                    ],
                                  )
                                  
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: CustomColors.lightGrey,
                                height: 10,
                              ),
                              const SizedBox(height: 5),
                              Text('${followUp.code}', style: CustomStyles.textRegular13Px,),
                              const SizedBox(height: 5),
                              Text('Batasan evaluasi : ${evaluationLimitation != null ? DateFormat('yyyy-MM-dd').format(evaluationLimitation) : '-' }', style: CustomStyles.textRegular13Px),
                              const SizedBox(height: 5),
                              
                            ],
                          )
                      ),
                    ),
                    onTap: (){
                      Get.to(() => DetailFollowUpAuditRegion(id: followUp.id));
                    },
                  );
                }
            )
        ))
      )
    );
  }
}