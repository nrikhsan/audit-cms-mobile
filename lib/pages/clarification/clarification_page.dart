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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

//audit area
class ClarificationPageAuditArea extends StatefulWidget {
  const ClarificationPageAuditArea({super.key});

  @override
  State<ClarificationPageAuditArea> createState() =>
      _ClarificationPageAuditAreaState();
}

class _ClarificationPageAuditAreaState extends State<ClarificationPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
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
                  filterClarificationAuditArea(context, startDateController, endDateController, auditorController, controllerAuditArea);
                },
                icon: const Icon(Icons.tune_rounded,size: 25, color: CustomColors.grey)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: PagedListView<int, ContentListClarificationAuditArea>(
            pagingController: controllerAuditArea.pagingControllerClarificationAuditArea,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, clarification, index){
                final statusClarificaion = clarification.status;
                final priority = clarification.priority;
                return GestureDetector(
                      onTap: (){
                        Get.to(() => DetailClarificationPageAuditArea(id: clarification.id!));
                      },
                      child: Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.grey
                        )
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    
                                    Text('${clarification.user!.fullname}', style: CustomStyles.textBold15Px),
                                    const SizedBox(width: 10),
                                    Icon(clarification.isFlag == 1 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 15),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                if(statusClarificaion == 'INPUT')
                                Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed13Px),
                      
                                if(statusClarificaion == 'DOWNLOAD')
                                Text('Belum mengunduh klarifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'UPLOAD')
                                Text('Belum mengunggah klarifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'IDENTIFICATION')
                                Text('Belum input identifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'DONE')
                                Text('Selesai', style: CustomStyles.textMediumGreen13Px),
                              ],
                            ),
                      
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [                                
                                const SizedBox(height: 5),
                                Text('Prioritas temuan : ${priority ?? ''}', style: CustomStyles.textMedium13Px),
                                Text('Cabang : ${clarification.branch!.name}', style: CustomStyles.textMedium13Px),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
              }
            ),
          ),
        )
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
          child: PagedListView<int, ContentListClarificationAuditRegion>(
            pagingController: controllerAuditRegion.pagingControllerClarification,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, clarification, index){
                final statusClarificaion = clarification.status;
                final priority = clarification.priority;
                return GestureDetector(
                      onTap: (){
                        
                        if (statusClarificaion == 'INPUT'){
                          Get.to(() => InputClarificationPageAuditRegion(id: clarification.id!));
                          } else if(statusClarificaion == 'DOWNLOAD'){
                            Get.to(() => DocumentClarificationPageAuditRegion(id: clarification.id!, fileName: clarification.fileName));
                          }else if(statusClarificaion == 'UPLOAD'){
                            Get.to(() => DocumentClarificationPageAuditRegion(id: clarification.id!, fileName: clarification.fileName));
                          }else if(statusClarificaion == 'IDENTIFICATION'){
                            Get.to(() => InputIdentificationClarificationAuditRegionPage(clarificationId: clarification.id!));
                          }else if(statusClarificaion == 'DONE'){
                            Get.to(() => DetailClarificationAuditRegion(id: clarification.id!));
                          }
                      },
                      child: Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.grey
                        )
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    
                                    Text('${clarification.user!.fullname}', style: CustomStyles.textBold15Px),
                                    const SizedBox(width: 10),
                                    Icon(clarification.isFlag == 1 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 15),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                if(statusClarificaion == 'INPUT')
                                Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed13Px),
                      
                                if(statusClarificaion == 'DOWNLOAD')
                                Text('Belum mengunduh klarifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'UPLOAD')
                                Text('Belum mengunggah klarifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'IDENTIFICATION')
                                Text('Belum input identifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'DONE')
                                Text('Selesai', style: CustomStyles.textMediumGreen13Px),
                              ],
                            ),
                      
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [                                
                                const SizedBox(height: 5),
                                Text('Prioritas temuan : ${priority ?? ''}', style: CustomStyles.textMedium13Px),
                                Text('Cabang : ${clarification.branch!.name}', style: CustomStyles.textMedium13Px),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
              }
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.blue,
          onPressed: (){
            showDialogMoreOption();
          },
          child: const Icon(Icons.add_box_rounded, color: CustomColors.white, size: 25),
        ),
    );
  }
  
  void showDialogMoreOption() {
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Generate klarifikasi', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  width: double.maxFinite,
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CustomColors.grey,
                            width: 1
                          )
                        )
                      ),
                      child: Obx(() => DropdownButton(
                        value: controllerAuditRegion.branchId.value,
                        hint: Text('Pilih cabang', style: CustomStyles.textMedium15Px),
                        items: controllerAuditRegion.branchAuditRegion.map((branch){
                          return DropdownMenuItem(
                            value: branch.id,
                            child: Text('${branch.name}', style: CustomStyles.textMedium15Px)
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                             controllerAuditRegion.selectBranch(value);
                             print(value);
                          });
                        }
                      ))
                    ),
                  )
                ),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                  width: double.maxFinite,
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CustomColors.grey,
                            width: 1
                          )
                        )
                      ),
                      child: DropdownButton(
                        value: controllerAuditRegion.caseId.value,
                        hint: Text('Pilih kasus', style: CustomStyles.textMedium15Px),
                        items: controllerAuditRegion.caseAuditRegion.map((cases){
                          return DropdownMenuItem(
                            value: cases.id,
                            child: Text('${cases.code}', style: CustomStyles.textMedium15Px)
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            controllerAuditRegion.selectCase(value);
                            controllerAuditRegion.loadCaseCategoryAuditRegion(value);
                            controllerAuditRegion.caseCategoryId.value = null;
                            print(value);
                          });
                        }
                      )
                    ),
                  )
                )),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                  width: double.maxFinite,
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CustomColors.grey,
                            width: 1
                          )
                        )
                      ),
                      child: DropdownButton(
                        value: controllerAuditRegion.caseCategoryId.value,
                        hint: Text('Pilih kategori kasus', style: CustomStyles.textMedium15Px),
                        items: controllerAuditRegion.caseCategory.map((caseCategory){
                          return DropdownMenuItem(
                            value: caseCategory.id,
                            child: Text('${caseCategory.name}', style: CustomStyles.textMedium15Px)
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            controllerAuditRegion.selectCaseCategory(value!);
                            print(value);
                          });
                        }
                      )
                    ),
                  )
                )),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        controllerAuditRegion.generateClarification();
                        Get.back();
                      }, 
                      child: Text('Generate klarifikasi', style: CustomStyles.textMediumGreen15Px)
                    )
                  ],
                )
              ],
            )
          ],
        );
      }
    );
  }
}
