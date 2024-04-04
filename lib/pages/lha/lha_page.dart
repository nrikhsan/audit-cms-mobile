import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
import 'package:audit_cms/pages/lha/widgetLha/widget_filter_lha_audit_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  final TextEditingController branchController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.scheduleIdLha.value = 0;
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
                dialogFilterLhaAuditArea(context, startDateController, endDateController, branchController, auditorController, controllerAuditArea);
            },
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),
      body: Padding(
            padding: const EdgeInsets.all(15),
            child: PagedListView<int, ContentListLhaAuditArea>(
              pagingController: controllerAuditArea.pagingControllerLhaAuditArea,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (_, lha, index){
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

                              Text('Cabang : ${lha.branch!.name}', style: CustomStyles.textBold15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton),
                                      onPressed: () {
                                        Get.to(() => ListLhaCasesPageAuditArea(lhaId: lha.id!));
                                      },
                                      child: Text('Kasus',style: CustomStyles.textMediumBlue15Px)),

                                  const SizedBox(width: 5),

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
  
  final ControllerAuditRegion controllerAuditRegion = Get.find();
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
              Navigator.pop(context);
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
      body: Obx(() {
        if (controllerAuditRegion.isLoading.value) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        } else {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: controllerAuditRegion.lhaAuditRegion.length,
                itemBuilder: (_, index) {
                  final lha = controllerAuditRegion.lhaAuditRegion[index];
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(lha.research == 0 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 20),
                                  Text('${lha.inputDate}',
                                      style: CustomStyles.textBold15Px),
                                ],
                              ),
                              const SizedBox(height: 15),
                                Text('Cabang : ${lha.branch}',
                                    style: CustomStyles.textMedium15Px),
                                const SizedBox(height: 10),
                                Text('Kategori SOP : ${lha.sopCategory}',
                                    style: CustomStyles.textMedium15Px),

                                const SizedBox(height: 10),
                                Text('Tanggal LHA : ${lha.inputDate}',
                                    style: CustomStyles.textMedium15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    DetailLhaPageAuditRegion(id: lha.id!)));
                                      },
                                      child: Text('Lihat rincian',
                                          style:
                                              CustomStyles.textMediumWhite15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                }),
          );
        }
      }),
    );
  }
}
