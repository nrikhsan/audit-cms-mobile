import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/detail_bap_page.dart';
import 'package:audit_cms/pages/bap/widgetBap/widget_bottom_sheet_bap.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

//audit area
class BapAuditAreaPage extends StatefulWidget {
  const BapAuditAreaPage({super.key});

  @override
  State<BapAuditAreaPage> createState() => _BapAuditAreaPageState();
}

class _BapAuditAreaPageState extends State<BapAuditAreaPage> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BAP'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
            Get.offAll(() => BotNavePageAuditArea());
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
        actions: [
          IconButton(
            onPressed: (){
              showFilterBapAuditArea(context, startDateController, endDateController, auditorController, branchController, controllerAuditArea);
            },
           icon: const Icon(Icons.tune_rounded, size: 25, color: CustomColors.grey)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: PagedListView<int, ContentListBapAuditArea>(
          pagingController: controllerAuditArea.pagingControllerBapAuditArea, 
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (_, bap, index){
              return GestureDetector(
                  child: Card(
                    elevation: 0,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CustomColors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Auditor : ${bap.user!.fullname}', style: CustomStyles.textBold15Px),
                            ],
                          ),
                          const SizedBox(height: 15),

                          Text('Kode BAP : ${bap.code}', style: CustomStyles.textMedium13Px),
                          Text('Kode klarifikasi : ${bap.clarification!.code}', style: CustomStyles.textMedium13Px),
                          Text('Batas evaluasi : ${bap.clarification!.evaluationLimitation}', style: CustomStyles.textMedium13Px),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => DetailBapPageAuditArea(id: bap.id!));
                  },
                );
            }
          )
        )
      ),
    );
  }
}


//audit region
class BapAuditRegionPage extends StatefulWidget {
  const BapAuditRegionPage({super.key});

  @override
  State<BapAuditRegionPage> createState() => _BapAuditRegionPageState();
}

class _BapAuditRegionPageState extends State<BapAuditRegionPage> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BAP'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
            Get.offAll(() => BotNavAuditRegion());
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
        actions: [
          IconButton(
            onPressed: (){
              showFilterBapAuditRegion(context);
            },
           icon: const Icon(Icons.tune_rounded, size: 25, color: CustomColors.grey)
          ),
        ],
      ),
    body: Padding(
        padding: const EdgeInsets.all(15),
        child: PagedListView<int, ContentListBapAuditRegion>(
          pagingController: controllerAuditRegion.pagingControllerBap, 
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (_, bap, index){
              return GestureDetector(
                  child: Card(
                    elevation: 0,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CustomColors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Auditor : ${bap.user!.fullname}', style: CustomStyles.textBold15Px),
                            ],
                          ),
                          const SizedBox(height: 15),

                          Text('Kode BAP : ${bap.code}', style: CustomStyles.textMedium13Px),
                          Text('Kode klarifikasi : ${bap.clarification!.code}', style: CustomStyles.textMedium13Px),
                          Text('Batas evaluasi : ${bap.clarification!.evaluationLimitation}', style: CustomStyles.textMedium13Px),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => DetailBapAuditRegion(id: bap.id!));
                  },
                );
            }
          )
        )
      ),
    );
  }

  void showFilterBapAuditRegion(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: CustomColors.white,
      context: context,
      builder: (_){
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: CustomColors.white,
                title: const Text('Filter data BAP'),
                titleSpacing: 5,
                titleTextStyle: CustomStyles.textBold18Px,
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  }, 
                  icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                ),
              ),
              
              const SizedBox(height: 25),

                TextField(
                  readOnly: true,
                  controller: startDateController,
                  onChanged: (startDate) => startDateController.text = startDate,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded, size: 25),
                    suffixIconColor: CustomColors.grey,
                    label: const Text('Mulai dari...'),
                    labelStyle: CustomStyles.textMediumGrey15Px,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                      )
                    ),
                    onTap: ()async{
                      DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001), 
                        lastDate: DateTime(2100),
                      );

                      if (picker != null) {
                          setState(() {
                            startDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                          });
                      }
                    },
                  ),
                const SizedBox(height: 15),
                TextField(
                  readOnly: true,
                  controller: endDateController,
                  onChanged: (endDate) => endDateController.text = endDate,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded, size: 25),
                    suffixIconColor: CustomColors.grey,
                    label: const Text('Sampai dengan...'),
                    labelStyle: CustomStyles.textMediumGrey15Px,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                      )
                    ),
                    onTap: ()async{
                      DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001), 
                        lastDate: DateTime(2100),
                      );

                      if (picker != null) {
                          setState(() {
                            endDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                          });
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  Wrap(
                    children: [
                      startDateController.text.isNotEmpty || endDateController.text.isNotEmpty
                      ? SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                            ),
                              onPressed: (){
                                startDateController.clear();
                                endDateController.clear();
                                controllerAuditRegion.resetFilterBap();
                                Get.back();
                            },
                              child: Text('Reset data filter', style: CustomStyles.textMediumWhite15Px)
                          )
                        )
                      : SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue
                            ),
                              onPressed: (){
                              controllerAuditRegion.filterBap(startDateController.text, endDateController.text);
                              Get.back();
                            },
                              child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                          )
                        )
                    ]
                  )
                ],
              ),
            )
        );
      }
    );
  }
}