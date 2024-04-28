
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/kka/detail_kka.dart';
import 'package:audit_cms/pages/kka/widgetKka/widket_kka.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


//audit area
class KkaPageAuditArea extends StatefulWidget {
  const KkaPageAuditArea({super.key});

  @override
  State<KkaPageAuditArea> createState() => _KkaPageAuditAreaState();
}

class _KkaPageAuditAreaState extends State<KkaPageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Kertas kerja audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
        actions: [
          IconButton(onPressed: (){
                showFilterKkaAuditArea(context, startDateController, endDateController, auditorController, controllerAuditArea);
              }, 
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),

      body: RefreshIndicator(
        onRefresh: ()async{
          controllerAuditArea.pagingControllerKkaAuditArea.refresh();
        },
        child: PagedListView<int, ContentListKkaAuditArea>(
        pagingController: controllerAuditArea.pagingControllerKkaAuditArea,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, kka, index){
            return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => KkaDetailAuditArea(id: kka.id!));
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
                            Text('${kka.user!.fullname}', style: CustomStyles.textBold15Px),
                            Text('${kka.branch!.name}', style: CustomStyles.textBold13Px)
                          ],
                        ),

                        const SizedBox(height: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal : ${kka.startDate} s/d ${kka.endDate}', style: CustomStyles.textMedium13Px),
                             const SizedBox(height: 5,),
                            Text('${kka.filename}', style: CustomStyles.textMediumGrey13Px),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            );
          }
        ),
      )
      )
    );
  }
}


//audit region
class KkaPageAuditRegion extends StatefulWidget {
  const KkaPageAuditRegion({super.key});

  @override
  State<KkaPageAuditRegion> createState() => _KkaPageAuditRegionState();
}

class _KkaPageAuditRegionState extends State<KkaPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Kertas kerja audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
          Get.offAll(() => BotNavAuditRegion());
        }, icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
        actions: [
          IconButton(onPressed: (){
                showFilterKkaAuditRegion(context, startDateController, endDateController, controllerAuditRegion);
              }, 
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),

      body: RefreshIndicator(
        onRefresh: ()async{
          controllerAuditRegion.pagingControllerKka.refresh();
        },
        child: PagedListView<int, ContentListKkaAuditRegion>(
        pagingController: controllerAuditRegion.pagingControllerKka, 
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, kka, index){
          return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => KkaDetailAuditRegion(id: kka.id!));
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

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${kka.user!.fullname}', style: CustomStyles.textBold15Px),
                            Text('${kka.branch!.name}', style: CustomStyles.textBold13Px)
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            Text('Tanggal : ${kka.startDate} s/d ${kka.endDate}', style: CustomStyles.textMedium13Px),
                             const SizedBox(height: 5,),
                            Text('${kka.filename}', style: CustomStyles.textMediumGrey13Px),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            );
        })
      )
      )
    );
  }
}