import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_lha_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_filter_lha_audit_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

//audit area
class LhaPageAuditArea extends StatefulWidget {
  const LhaPageAuditArea({super.key});

  @override
  State<LhaPageAuditArea> createState() => _LhaPageAuditAreaState();
}

class _LhaPageAuditAreaState extends State<LhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
          actions: [
            IconButton(
            onPressed: (){
                dialogFilterLhaAuditArea(context, startDateController, endDateController, auditorController, controllerAuditArea);
            },
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),
      body: Padding(
            padding: const EdgeInsets.all(15),
            child: RefreshIndicator(
              onRefresh: ()async{
                controllerAuditArea.pagingControllerLhaAuditArea.refresh();
              },
              child: PagedListView<int, ContentListLhaAuditArea>(
              pagingController: controllerAuditArea.pagingControllerLhaAuditArea,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (_, lha, index){
                  final startDare = lha.schedule?.startDate;
                  final endDate = lha.schedule?.endDate;
                  return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  lha.isResearch == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),
                              Text('Auditor : ${lha.user!.fullname}', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text('Cabang : ${lha.branch!.name}', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              
                              Text('Tanggal : ${outputFormat.format(DateTime.parse(startDare!))} s/d ${outputFormat.format(DateTime.parse(endDate!))}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditArea(id: lha.id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                }
              ),
            )
            )
          )
    );
  }
}



//audit region
class LhaPageAuditRegion extends StatefulWidget {
  const LhaPageAuditRegion({super.key});

  @override
  State<LhaPageAuditRegion> createState() => _LhaPageAuditRegionState();
}

class _LhaPageAuditRegionState extends State<LhaPageAuditRegion> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
          actions: [
            IconButton(
            onPressed: (){
                showFilterLhaAuditRegion(context, startDateController, endDateController, controllerAuditRegion);
            },
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(onRefresh: ()async{
          controllerAuditRegion.pagingControllerLha.refresh();
        },
        child: PagedListView<int, ContentListLhaAuditRegion>(
          pagingController: controllerAuditRegion.pagingControllerLha,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (_, lha, index){
              final startDare = lha.schedule?.startDate;
              final endDate = lha.schedule?.endDate;
              return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                
                                children: [
                                  lha.isResearch == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                    ],
                                  ) :
                                  const SizedBox()
                                ],
                              ),

                              const SizedBox(height: 15),

                              Wrap(        
                                children: [
                                lha.isResearch == 1 ?
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 20),
                                      const SizedBox(width: 5),
                                      Text('Belum melakukan klarifikasi', style: CustomStyles.textMediumRed15Px)
                                      ],
                                    ) :
                                  const SizedBox()
                                ],
                              ),
                              Text('Cabang : ${lha.branch!.name}', style: CustomStyles.textBold15Px),
                              const SizedBox(height: 5),
                              Text('Tanggal : ${outputFormat.format(DateTime.parse(startDare!))} s/d ${outputFormat.format(DateTime.parse(endDate!))}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape: CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => DetailLhaPageAuditRegion(id: lha.id!));
                                      },
                                      child: Text('Lihat rincian', style: CustomStyles.textMediumGreen15Px))
                                ],
                              )
                            ],
                          ),
                        ));
            }
          ))
        )
      )
    );
  }
}
