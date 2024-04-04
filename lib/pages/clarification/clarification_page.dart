import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/clarification/detail_clarfication.dart';
import 'package:audit_cms/pages/clarification/document_clarification_page_audit_region.dart';
import 'package:audit_cms/pages/clarification/input_clarification_page_audit_region.dart';
import 'package:audit_cms/pages/clarification/widgetClarification/widget_alert_and_download_clarification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                  filterClarificationAuditArea(context, startDateController, endDateController, branchController, auditorController, controllerAuditArea);
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
                                Text('${clarification.code}', style: CustomStyles.textBold13Px),
                              ],
                            ),
                      
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
          
                                const SizedBox(height: 5),
                                if(statusClarificaion == 'INPUT')
                                Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed13Px),
                      
                                if(statusClarificaion == 'DOWNLOAD')
                                Text('Belum mengunduh klarifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'UPLOAD')
                                Text('Belum mengunggah klarifikasi', style: CustomStyles.textMediumRed13Px),
          
                                if(statusClarificaion == 'IDENTIFICATION')
                                Text('Belum input identifikasi', style: CustomStyles.textMediumGreen13Px),
          
                                if(statusClarificaion == 'DONE')
                                Text('Selesai', style: CustomStyles.textMediumGreen13Px),
                                
                                const SizedBox(height: 5),
                                Text('Prioritas temuan : ${clarification.priority}', style: CustomStyles.textMedium13Px),
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

  final ControllerAuditRegion controllerAuditRegion = Get.find();
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

        body: Obx(() {
                if (controllerAuditRegion.isLoading.value) {
                  return const Center(child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controllerAuditRegion.clarificationAuditRegion.length,
                        itemBuilder: (_, index) {
                          final clarification = controllerAuditRegion.clarificationAuditRegion[index];
                          final statusClarificaion = clarification.statusClarification;
                          return GestureDetector(
                             onTap: (){
                              if(statusClarificaion == 'Input'){
                                Get.to(() => InputClarificationPageAuditRegion(id: clarification.id!));
                              }else if(statusClarificaion == 'Download'){
                                Get.to(() => DocumentClarificationPageAuditRegion(id: clarification.id!));
                              }else if(statusClarificaion == 'Upload'){
                                Get.to(() => DocumentClarificationPageAuditRegion(id: clarification.id!));
                              }else if(statusClarificaion == 'Done'){
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
                          
                          Wrap(
                            children: [
                              clarification.isFlag == 1 
                              ? const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 15)
                              : const SizedBox(height: 0)
                            ]
                          ),
                              const SizedBox(height: 10),
                                if(statusClarificaion == 'Input')
                                Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed13Px),
                      
                                if(statusClarificaion == 'Download')
                                Text('Belum mengunduh klarifikasi', style: CustomStyles.textMediumRed13Px),
                    
                                if(statusClarificaion == 'Upload')
                                Text('Belum mengunggah klarifikasi', style: CustomStyles.textMediumRed13Px),
                    
                                if(statusClarificaion == 'Done')
                                Text('Selesai', style: CustomStyles.textMediumGreen13Px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${clarification.noDocument}', style: CustomStyles.textBold15Px),
                              IconButton(
                                onPressed: (){
                                  showDialogMoreOption(clarification.id!);
                                }, 
                                icon: const Icon(Icons.more_vert_rounded, color: CustomColors.grey, size: 25)
                              )
                          ],),
                          Row(
                            children: [
                              Text('${clarification.noClarification}', style: CustomStyles.textBold13Px),
                            ],
                          ),
                        ],
                      ),
                    )));
                    }),
                  );
                }
              }),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CustomStyles.customRoundedButton,
          backgroundColor: CustomColors.blue
        ),
        onPressed: (){
          Get.to(() => const InputClarificationPageAuditRegion(id: 0));
        },
        child: Text('Input klarifikasi', style: CustomStyles.textMediumWhite15Px)
      ),
    );
  }
  
  void showDialogMoreOption(int id) {
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Action', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CustomStyles.customRoundedButton,
                      backgroundColor: CustomColors.blue
                    ),
                    onPressed: (){
                      Get.to(() => DetailClarificationAuditRegion(id: id));
                    }, 
                    child: Text('Detail klarifikasi', style: CustomStyles.textMediumWhite15Px)
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CustomStyles.customRoundedButton,
                      backgroundColor: CustomColors.red
                    ),
                    onPressed: (){
                      Get.back();
                    }, 
                    child: Text('Kembali', style: CustomStyles.textMediumWhite15Px)
                  ),
                )
              ],
            )
          ],
        );
      }
    );
  }
}
