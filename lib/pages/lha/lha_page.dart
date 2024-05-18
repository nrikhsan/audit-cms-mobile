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
  final TextEditingController branchEditingController = TextEditingController();

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
                dialogFilterLhaAuditArea(context, startDateController, endDateController, auditorController, controllerAuditArea, branchEditingController);
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
                  final startDare = DateTime.parse('${lha.schedule?.startDate}');
                  final endDate = DateTime.parse('${lha.schedule?.endDate}');
                  final level = lha.user?.level;
                  final createdAt = DateTime.parse('${lha.createdAt}');
                  return Card(
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
                                  Visibility(
                                    visible: lha.isFlag == 1 ? true : false,
                                    child: Text('Perlu klarifikasi', style: CustomStyles.textMediumRed13Px)),
                                  const SizedBox(height: 5,),
                                  Text('Tgl jadwal : ${DateFormat('dd-MM-yyyy').format(startDare)} s/d ${DateFormat('dd-MM-yyyy').format(endDate)}', style: CustomStyles.textRegularGrey12Px),
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
                              }, child: Text('${lha.branch?.name}', style: CustomStyles.textMediumWhite12Px)),
                            )

                          ],
                        ),

                              const SizedBox(height: 10,),
                              const Divider(color: CustomColors.lightGrey, height: 0.1),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text('Auditor : ', style: CustomStyles.textMedium13Px),
                                  Text('${lha.user?.fullname}', style: CustomStyles.textRegular12Px),
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
                                  Text('Kode wilayah : ', style: CustomStyles.textMedium13Px),
                                  Text('${level?.code}', style: CustomStyles.textRegular12Px),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        backgroundColor: CustomColors.green
                                      ),
                                      onPressed: (){
                                        Get.to(() => DetailLhaPageAuditArea(id: lha.id!, level: level?.name));
                                    }, child: Text('Lihat rincian', style: CustomStyles.textMediumWhite12Px)),
                                  )
                                ],
                              ),

                              const SizedBox(height: 5,),
                          ],
                        )
                      )
                    ),
                  );
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
              final startDare = DateTime.parse('${lha.schedule?.startDate}');
                  final endDate = DateTime.parse('${lha.schedule?.endDate}');
                  final level = lha.user?.level;
                  final createdAt = DateTime.parse('${lha.createdAt}');
                  return Card(
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
                                  Visibility(
                                    visible: lha.isFlag == 1 ? true : false,
                                    child: Text('Perlu klarifikasi', style: CustomStyles.textMediumRed13Px)),
                                  const SizedBox(height: 5,),
                                  Text('Tgl jadwal : ${DateFormat('dd-MM-yyyy').format(startDare)} s/d ${DateFormat('dd-MM-yyyy').format(endDate)}', style: CustomStyles.textRegularGrey12Px),
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
                              }, child: Text('${lha.branch?.name}', style: CustomStyles.textMediumWhite12Px)),
                            )

                          ],
                        ),

                              const SizedBox(height: 10,),
                              const Divider(color: CustomColors.lightGrey, height: 0.1),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text('Dibuat pada : ', style: CustomStyles.textMedium13Px),
                                  Text(DateFormat('dd-MM-yyyy').format(createdAt), style: CustomStyles.textRegular12Px),
                                ],
                              ),

                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('Kode wilayah : ', style: CustomStyles.textMedium13Px),
                                  Text('${level?.code}', style: CustomStyles.textRegular12Px),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        backgroundColor: CustomColors.green
                                      ),
                                      onPressed: (){
                                        Get.to(() => DetailLhaPageAuditRegion(id: lha.id!));
                                    }, child: Text('Lihat rincian', style: CustomStyles.textMediumWhite12Px)),
                                  )
                                ],
                              ),

                              const SizedBox(height: 5,),
                          ],
                        )
                      )
                    ),
                  );
            }
          ))
        )
      )
    );
  }
}
