import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/clarification/detail_clarfication.dart';
import 'package:audit_cms/pages/clarification/document_clarification_page_audit_region.dart';
import 'package:audit_cms/pages/clarification/input_clarification_page_audit_region.dart';
import 'package:audit_cms/pages/clarification/input_identification_clarification_page.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_alert_and_download_clarification.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_generate_clarification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

//audit area
class ClarificationPageAuditArea extends StatefulWidget {
  const ClarificationPageAuditArea({super.key});

  @override
  State<ClarificationPageAuditArea> createState() =>
      _ClarificationPageAuditAreaState();
}

class _ClarificationPageAuditAreaState extends State<ClarificationPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();
  final TextEditingController caseEditingController = TextEditingController();
  final TextEditingController caseCategoryEditingController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded, size: 25, color: CustomColors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  filterClarificationAuditArea(context, startDateController, endDateController, auditorController, controllerAuditArea, branchEditingController);
                },
                icon: const Icon(Icons.tune_rounded,size: 25, color: CustomColors.grey)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: RefreshIndicator(
            onRefresh: ()async{
              controllerAuditArea.pagingControllerClarificationAuditArea.refresh();
            },
            child: PagedListView<int, ContentListClarificationAuditArea>(
            pagingController: controllerAuditArea.pagingControllerClarificationAuditArea,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, clarification, index){
                final statusClarificaion = clarification.status;
                final level = clarification.user?.level?.name;
                final createdAt = DateTime.parse('${clarification.createdAt}');
                return GestureDetector(
                  child: Card(
                    shape: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: CustomColors.lightGrey,
                        width: 0.5
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        if(statusClarificaion == 'INPUT')
                                          Text('Perlu klarifikasi', style: CustomStyles.textMediumRed12Px),
                                    
                                        if(statusClarificaion == 'DOWNLOAD')
                                        Text('Unduh klarifikasi', style: CustomStyles.textMediumRed12Px),
                        
                                        if(statusClarificaion == 'UPLOAD')
                                        Text('Unggah klarifikasi', style: CustomStyles.textMediumRed12Px),

                                        if(statusClarificaion == 'IDENTIFICATION')
                                        Text('Input identifikasi', style: CustomStyles.textMediumRed12Px),
                        
                                        if(statusClarificaion == 'DONE')
                                        Text('Selesai', style: CustomStyles.textMediumGreen12Px),
                                        const SizedBox(height: 5,),
                                        Text('Divisi : ${clarification.cases?.code}', style: CustomStyles.textRegularGrey12Px),
                                  ],
                                ),

                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  backgroundColor: CustomColors.grey
                                ),
                                onPressed: (){
                                  null;
                              }, child: Text('${clarification.branch?.name}', style: CustomStyles.textMediumWhite12Px)),
                            )

                          ],
                        ),

                              const SizedBox(height: 10,),
                              const Divider(color: CustomColors.lightGrey, height: 0.1),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text('Auditor : ', style: CustomStyles.textMedium13Px),
                                  Text('${clarification.user?.fullname}', style: CustomStyles.textRegular12Px),
                                ],
                              ),
                              
                              const SizedBox(height: 5,),

                              Row(
                                children: [
                                  Text('Dibuat pada : ', style: CustomStyles.textMedium13Px),
                                  Text(DateFormat('dd-MM-yyyy').format(createdAt), style: CustomStyles.textRegular12Px),
                                ],
                              ),

                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('Kode : ', style: CustomStyles.textMedium13Px),
                                  Text('${clarification.code}', style: CustomStyles.textRegular12Px),
                                ],
                              ),
                              const SizedBox(height: 5,),
                          ],
                        )
                      )
                    ),
                  ),
                  onTap: (){
                    if (level == 'AREA') {
                          if (statusClarificaion == 'INPUT'){
                          Get.to(() =>  InputClarificationAuditArea(id: clarification.id!));
                          } else if(statusClarificaion == 'DOWNLOAD'){
                            Get.to(() => DocumentClarificationAuditArea(id: clarification.id!, fileName: clarification.fileName, status: clarification.status));
                          }else if(statusClarificaion == 'UPLOAD'){
                            Get.to(() => DocumentClarificationAuditArea(id: clarification.id!, fileName: clarification.fileName, status: clarification.status));
                          }else if(statusClarificaion == 'IDENTIFICATION'){
                            Get.to(() => InputIdentifcationClarificationAuditArea(clarificationId: clarification.id!));
                          }else if(statusClarificaion == 'DONE'){
                            Get.to(() => DetailClarificationPageAuditArea(id: clarification.id!, statusClarificaion: statusClarificaion!));
                          }
                        }else{
                          Get.to(() => DetailClarificationPageAuditArea(id: clarification.id!, statusClarificaion: statusClarificaion!));
                        }
                  },
                );
              }
            ),
          )
          )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.blue,
          onPressed: (){
              generateClarificationAuditArea(context, controllerAuditArea, branchEditingController, caseEditingController, caseCategoryEditingController);
          },
          child: const Icon(Icons.add_box_rounded, color: CustomColors.white, size: 25),
        ),
    );
  }
}

//audit region
class ClarificationPageAuditRegion extends StatefulWidget {
  const ClarificationPageAuditRegion({super.key});

  @override
  State<ClarificationPageAuditRegion> createState() =>
      _ClarificationPageAuditRegionState();
}

class _ClarificationPageAuditRegionState extends State<ClarificationPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();
  final TextEditingController caseEditingController = TextEditingController();
  final TextEditingController caseCategoryEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Get.offAll(() => BotNavAuditRegion());
              },
              icon: const Icon(Icons.arrow_back_rounded, size: 25, color: CustomColors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  showBottomSheetFilterClarificationAuditRegion(context, startDateController, endDateController, controllerAuditRegion);
                },
                icon: const Icon(Icons.tune_rounded,size: 25, color: CustomColors.grey)),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: RefreshIndicator(
            onRefresh: ()async{
              controllerAuditRegion.pagingControllerClarification.refresh();
            },
            child: PagedListView<int, ContentListClarificationAuditRegion>(
            pagingController: controllerAuditRegion.pagingControllerClarification,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, clarification, index){
                final statusClarificaion = clarification.status;
                final createdAt = DateTime.parse('${clarification.createdAt}');
                return GestureDetector(
                  child: Card(
                    shape: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: CustomColors.lightGrey,
                        width: 0.5
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        if(statusClarificaion == 'INPUT')
                                        Text('Perlu klarifikasi', style: CustomStyles.textMediumRed12Px),
                                    
                                        if(statusClarificaion == 'DOWNLOAD')
                                        Text('Unduh klarifikasi', style: CustomStyles.textMediumRed12Px),
                        
                                        if(statusClarificaion == 'UPLOAD')
                                        Text('Unggah klarifikasi', style: CustomStyles.textMediumRed12Px),

                                        if(statusClarificaion == 'IDENTIFICATION')
                                        Text('Input identifikasi', style: CustomStyles.textMediumRed12Px),
                        
                                        if(statusClarificaion == 'DONE')
                                        Text('Selesai', style: CustomStyles.textMediumGreen12Px),
                                      const SizedBox(height: 5,),
                                      Text('Divisi : ${clarification.cases?.code}', style: CustomStyles.textRegularGrey12Px),
                                  ],
                                ),

                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  backgroundColor: CustomColors.grey
                                ),
                                onPressed: (){
                                  null;
                              }, child: Text('${clarification.branch?.name}', style: CustomStyles.textMediumWhite12Px)),
                            )

                          ],
                        ),

                              const SizedBox(height: 10,),
                              const Divider(color: CustomColors.lightGrey, height: 0.1),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text('Auditor : ', style: CustomStyles.textMedium13Px),
                                  Text('${clarification.user?.fullname}', style: CustomStyles.textRegular12Px),
                                ],
                              ),
                              
                              const SizedBox(height: 5,),

                              Row(
                                children: [
                                  Text('Dibuat pada : ', style: CustomStyles.textMedium13Px),
                                  Text(DateFormat('dd-MM-yyyy').format(createdAt), style: CustomStyles.textRegular12Px),
                                ],
                              ),

                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('Kode : ', style: CustomStyles.textMedium13Px),
                                  Text('${clarification.code}', style: CustomStyles.textRegular12Px),
                                ],
                              ),
                              const SizedBox(height: 5,),
                          ],
                        )
                      )
                    ),
                  ),
                  onTap: (){
                    if (statusClarificaion == 'INPUT'){
                          Get.to(() => InputClarificationPageAuditRegion(id: clarification.id!));
                          } else if(statusClarificaion == 'DOWNLOAD'){
                            Get.to(() => DocumentClarificationPageAuditRegion(id: clarification.id!, fileName: clarification.fileName, status: clarification.status,));
                          }else if(statusClarificaion == 'UPLOAD'){
                            Get.to(() => DocumentClarificationPageAuditRegion(id: clarification.id!, fileName: clarification.fileName, status: clarification.status));
                          }else if(statusClarificaion == 'IDENTIFICATION'){
                            Get.to(() => InputIdentificationClarificationAuditRegionPage(clarificationId: clarification.id!));
                          }else if(statusClarificaion == 'DONE'){
                            Get.to(() => DetailClarificationAuditRegion(id: clarification.id!));
                          }
                  },
                ); 
              }
            ),
          ))
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.blue,
          onPressed: (){
           generateClarificationAuditRegion(context, controllerAuditRegion, branchEditingController, caseEditingController, caseCategoryEditingController);
          },
          child: const Icon(Icons.add_box_rounded, color: CustomColors.white, size: 25),
        ),
    );
  }
}
