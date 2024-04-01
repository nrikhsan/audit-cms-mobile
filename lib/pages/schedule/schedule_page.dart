import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/schedule/detail_schedule.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/bottom_sheet_filter_schedule_audit_area.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/bottom_sheet_filter_schedule_audit_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../data/controller/auditArea/controller_audit_area.dart';
import '../../helper/styles/custom_styles.dart';
import 'input_schedule.dart';

//audit area
class SchedulePageAuditArea extends StatefulWidget {
  const SchedulePageAuditArea({super.key});

  @override
  State<SchedulePageAuditArea> createState() => _SchedulePageAuditAreaState();
}

class _SchedulePageAuditAreaState extends State<SchedulePageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.find();

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();
  final TextEditingController branchControllerMainSChedule = TextEditingController();
  final TextEditingController auditorControllerMainSchedule = TextEditingController();

  final TextEditingController startDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController endDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController branchControllerSpecialSchedule = TextEditingController();
  final TextEditingController auditorControllerSpecialSchedule = TextEditingController();

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();
  final TextEditingController branchControllerReschedule = TextEditingController();
  final TextEditingController auditorControllerReschedule = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: CustomColors.white,
          appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Jadwal audit wilayah'),
            titleSpacing: 5,
            titleTextStyle: CustomStyles.textBold18Px,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },
                icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: CustomColors.blue,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelStyle: const TextStyle(color: CustomColors.grey, fontFamily: 'RobotoMedium', fontSize: 13),
              labelStyle: const TextStyle(color: CustomColors.blue, fontFamily: 'RobotoMedium', fontSize: 13),
              tabs: const [
                Tab(text: 'Jadwal utama'),
                Tab(text: 'Jadwal khusus'),
                Tab(text: 'Reschedule'),
              ],
            ),
          ),
          body: TabBarView(
              children: [

                // 1. main schedule
                Scaffold(
                  backgroundColor: CustomColors.white,
                  floatingActionButton: SpeedDial(
                    elevation: 0,
                    backgroundColor: CustomColors.orange,
                    animatedIcon: AnimatedIcons.menu_close,
                    renderOverlay: false,
                    children: [
                      SpeedDialChild(
                          backgroundColor: CustomColors.blue,
                          label: 'Filter data jadwal',
                          labelBackgroundColor: CustomColors.blue,
                          labelStyle: CustomStyles.textMediumWhite15Px,
                          child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                          onTap: (){
                           bottomSheetFilterMainSchedule(context, auditorControllerMainSchedule, branchControllerMainSChedule, 
                           startDateControllerMainSchedule, endDateControllerMainSchedule, controllerAuditArea);
                          }
                      ),

                      SpeedDialChild(
                        backgroundColor: CustomColors.green,
                        label: 'Tambah jadwal utama',
                        labelStyle: CustomStyles.textMediumWhite15Px,
                        labelBackgroundColor: CustomColors.green,
                        child: const Icon(Icons.add_rounded, color: CustomColors.white),
                        onTap: (){
                          Get.to(() => const InputDataSchedulesPageMainSchedule());
                        }
                      )
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx(() {
                      if (controllerAuditArea.isLoading.isTrue) {
                        return const Center(child: SpinKitCircle(color: CustomColors.blue));
                      } else {
                        return ListView.builder(
                          itemCount: controllerAuditArea.mainSchedulesAuditArea.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final mainSchedule = controllerAuditArea.mainSchedulesAuditArea[index];
                            return GestureDetector(
                              child: Card(
                              elevation: 0,
                              shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: CustomColors.grey
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                    
                              color: CustomColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${mainSchedule.auditor}', style: CustomStyles.textBold15Px),
                                        Text('${mainSchedule.status}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                    
                                    const SizedBox(height: 10),
                                      Text('Cabang : ${mainSchedule.branch}', style: CustomStyles.textMedium13Px),
                                      
                                      Text('Area : ${mainSchedule.area}', style: CustomStyles.textMedium13Px),
                                  ],
                                ),
                              ),
                            ),
                            onTap: (){
                              Get.to(() => DetailMainSchedulePageAuditArea(mainScheduleId: mainSchedule.id!));
                            },
                            );
                          },
                        );
                      }
                    }),
                  ),
                ),


                // 2. special schedule
                Scaffold(
                  backgroundColor: CustomColors.white,
                  floatingActionButton: SpeedDial(
                  elevation: 0,
                  backgroundColor: CustomColors.orange,
                  animatedIcon: AnimatedIcons.menu_close,
                  renderOverlay: false,
                  children: [
                    SpeedDialChild(
                        backgroundColor: CustomColors.blue,
                        label: 'Filter data jadwal',
                        labelBackgroundColor: CustomColors.blue,
                        labelStyle: CustomStyles.textMediumWhite15Px,
                        child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                        onTap: (){
                          bottomSheetFilterSpecialSchedule(context, auditorControllerSpecialSchedule, 
                          branchControllerSpecialSchedule, startDateControllerSpecialSchedule, endDateControllerSpecialSchedule, controllerAuditArea);
                        }
                    ),

                    SpeedDialChild(
                        backgroundColor: CustomColors.green,
                        label: 'Tambah jadwal khusus',
                        labelStyle: CustomStyles.textMediumWhite15Px,
                        labelBackgroundColor: CustomColors.green,
                        child: const Icon(Icons.add_rounded, color: CustomColors.white),
                        onTap: (){
                          Get.to(() => const InputDataSchedulePageSpecialSchedule());
                        }
                    )
                  ],
                ),
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx((){
                      if(controllerAuditArea.isLoading.isTrue){
                        return const Center(
                            child: SpinKitCircle(color: CustomColors.blue)
                        );
                      }else{
                        return ListView.builder(
                            itemCount: controllerAuditArea.specialSchedulesAuditArea.length,
                            itemBuilder: (_, index){
                              final specialSchedule = controllerAuditArea.specialSchedulesAuditArea[index];
                              return GestureDetector(
                                child: Card(
                                elevation: 0,
                                shape: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: CustomColors.grey
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                    
                                color: CustomColors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${specialSchedule.auditor}', style: CustomStyles.textBold15Px),
                                          Text('${specialSchedule.status}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                    
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${specialSchedule.branch}', style: CustomStyles.textMedium13Px),
                                      
                                      Text('Area : ${specialSchedule.area}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Get.to(() => DetailSpecialSchedulePageAuditArea(specialScheduleId: specialSchedule.id!));
                              },
                              );
                            }
                        );
                      }
                    }),
                  ),
                ),


                // 3. reschedule
                Scaffold(
                  backgroundColor: CustomColors.white,
                  floatingActionButton: SpeedDial(
                    elevation: 0,
                    backgroundColor: CustomColors.orange,
                    animatedIcon: AnimatedIcons.menu_close,
                    renderOverlay: false,
                    children: [
                      SpeedDialChild(
                          backgroundColor: CustomColors.blue,
                          label: 'Filter data jadwal',
                          labelBackgroundColor: CustomColors.blue,
                          labelStyle: CustomStyles.textMediumWhite15Px,
                          child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                          onTap: (){
                            bottomSheetFilterReschedule(context, auditorControllerReschedule, branchControllerReschedule, 
                            startDateControllerReschedule, endDateControllerReschedule, controllerAuditArea);
                          }
                      )
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx((){
                      if(controllerAuditArea.isLoading.isTrue){
                        return const Center(child: SpinKitCircle(color: CustomColors.blue));
                      }else{
                        return ListView.builder(
                            itemCount: controllerAuditArea.resSchedulesAuditArea.length,
                            itemBuilder: (_, index){
                              final reschedules = controllerAuditArea.resSchedulesAuditArea[index];
                              final statusReschedules = reschedules.statusReschedule;
                              return GestureDetector(
                                child: Card(
                                elevation: 0,
                                shape: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: CustomColors.grey
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                    
                                color: CustomColors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${reschedules.auditor}', style: CustomStyles.textBold15Px),
                                          if(statusReschedules == 'Pending')
                                          Text('${reschedules.statusReschedule}', style: CustomStyles.textMediumGrey13Px),
                                          if(statusReschedules == 'Reject')
                                          Text('${reschedules.statusReschedule}', style: CustomStyles.textMediumRed13Px),
                                          if(statusReschedules == 'Approve')
                                          Text('${reschedules.statusReschedule}', style: CustomStyles.textMediumGreen13Px),
                                          if(statusReschedules == 'Request')
                                          Text('${reschedules.statusReschedule}', style: CustomStyles.textMediumBlue13Px),
                                        ],
                                      ),
                    
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${reschedules.branch}', style: CustomStyles.textMedium13Px),
                                      Text('Area : ${reschedules.area}', style: CustomStyles.textMedium13Px),
                                      
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                  if (reschedules.statusReschedule == 'Pending') {
                                    Get.to(() => InputDataReschedulePage(rescheduleId: reschedules.id!));
                                  }else{
                                    Get.to(() => DetailReschedulePageAuditArea(rescheduleId: reschedules.id!));
                                  }
                                },
                              );
                            }
                        );
                      }
                    }),
                  ),
                )
              ]
          ),
        )
    );
  }
}



//audit region
class SchedulePageAuditRegion extends StatefulWidget {
  const SchedulePageAuditRegion({super.key});

  @override
  State<SchedulePageAuditRegion> createState() => _SchedulePageAuditRegionState();
}

class _SchedulePageAuditRegionState extends State<SchedulePageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();

  final TextEditingController startDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController endDateControllerSpecialSchedule = TextEditingController();

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: CustomColors.white,
          appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Jadwal audit wilayah'),
            titleSpacing: 5,
            titleTextStyle: CustomStyles.textBold18Px,
            leading: IconButton(onPressed: (){
              Get.offAll(() => BotNavAuditRegion());
            },
            icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: CustomColors.blue,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelStyle: const TextStyle(color: CustomColors.grey, fontFamily: 'RobotoMedium', fontSize: 13),
              labelStyle: const TextStyle(color: CustomColors.blue, fontFamily: 'RobotoMedium', fontSize: 13),
              tabs: const [
                Tab(text: 'Jadwal utama'),
                Tab(text: 'Jadwal khusus'),
                Tab(text: 'Reschedule'),
              ],
            ),
          ),
          body: TabBarView(
              children: [

                // 1. main schedule
                Scaffold(
                  backgroundColor: CustomColors.white,
                  floatingActionButton: SpeedDial(
                    elevation: 0,
                    backgroundColor: CustomColors.orange,
                    animatedIcon: AnimatedIcons.menu_close,
                    renderOverlay: false,
                    children: [
                      SpeedDialChild(
                          backgroundColor: CustomColors.blue,
                          label: 'Filter data jadwal',
                          labelBackgroundColor: CustomColors.blue,
                          labelStyle: CustomStyles.textMediumWhite15Px,
                          child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                          onTap: (){
                            bottomSheetFilterMainScheduleAuditRegion(context, startDateControllerMainSchedule, endDateControllerMainSchedule, controllerAuditRegion);
                          }
                      ),
                    ],
                  ),

                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx((){
                      if (controllerAuditRegion.isLoading.value) {
                        return const Center(child: SpinKitCircle(color: CustomColors.blue));
                      }else{
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controllerAuditRegion.mainScheduleAuditRegion.length,
                          itemBuilder: (_, index){
                            final mainSchedule = controllerAuditRegion.mainScheduleAuditRegion[index];
                            return GestureDetector(
                                child: Card(
                                elevation: 0,
                                shape: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: CustomColors.grey
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                      
                                color: CustomColors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${mainSchedule.auditor}', style: CustomStyles.textBold15Px),
                                          Text('${mainSchedule.startDate} s/d ${mainSchedule.endDate}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                      
                                      const SizedBox(height: 10),
                                        Text('Cabang : ${mainSchedule.branch}', style: CustomStyles.textMedium13Px),
                                        Text('Area : ${mainSchedule.area}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!));
                              },
                            );
                          }
                        );
                      }
                    }),
                  ),
                ),


                // 2. special schedule
                Scaffold(
                  backgroundColor: CustomColors.white,
                  floatingActionButton: SpeedDial(
                    elevation: 0,
                    backgroundColor: CustomColors.orange,
                    animatedIcon: AnimatedIcons.menu_close,
                    renderOverlay: false,
                    children: [
                      SpeedDialChild(
                        backgroundColor: CustomColors.blue,
                        label: 'Filter data jadwal',
                        labelBackgroundColor: CustomColors.blue,
                        labelStyle: CustomStyles.textMediumWhite15Px,
                        child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                        onTap: (){
                          bottomSheetFilterSpecialScheduleAuditRegion(context, startDateControllerSpecialSchedule, endDateControllerSpecialSchedule, controllerAuditRegion);
                        }
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Obx((){
                        if (controllerAuditRegion.isLoading.value) {
                          return const Center(child: SpinKitCircle(color: CustomColors.blue));
                        }else{
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controllerAuditRegion.specialScheduleAuditRegion.length,
                            itemBuilder: (_, index){
                              final specialSchedule = controllerAuditRegion.specialScheduleAuditRegion[index];
                              return GestureDetector(
                                  child: Card(
                                  elevation: 0,
                                  shape: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: CustomColors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                        
                                  color: CustomColors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${specialSchedule.auditor}', style: CustomStyles.textBold15Px),
                                            Text('${specialSchedule.startDate} s/d ${specialSchedule.endDate}', style: CustomStyles.textMedium13Px),
                                          ],
                                        ),
                        
                                        const SizedBox(height: 10),
                                          Text('Cabang : ${specialSchedule.branch}', style: CustomStyles.textMedium13Px),
                                          Text('Area : ${specialSchedule.area}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  Get.to(() => DetailSpecialScheduleAuditRegion(specialScheduleId: specialSchedule.id!));
                                },
                              );
                            }
                          );
                        }
                      }),
                ),
              ),


                // 3. reschedule
                Scaffold(
                  backgroundColor: CustomColors.white,
                  floatingActionButton: SpeedDial(
                    elevation: 0,
                    backgroundColor: CustomColors.orange,
                    animatedIcon: AnimatedIcons.menu_close,
                    renderOverlay: false,
                    children: [
                      SpeedDialChild(
                          backgroundColor: CustomColors.blue,
                          label: 'Filter data jadwal',
                          labelBackgroundColor: CustomColors.blue,
                          labelStyle: CustomStyles.textMediumWhite15Px,
                          child: const Icon(Icons.tune_rounded, color: CustomColors.white),
                          onTap: (){
                            bottomSheetFilterRescheduleAuditRegion(context, startDateControllerReschedule, endDateControllerReschedule, controllerAuditRegion);
                          }
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx((){
                        if (controllerAuditRegion.isLoading.value) {
                          return const Center(child: SpinKitCircle(color: CustomColors.blue));
                        }else{
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controllerAuditRegion.rescheduleAuditRegion.length,
                            itemBuilder: (_, index){
                              final reschedule = controllerAuditRegion.rescheduleAuditRegion[index];
                              final statusReschedules = reschedule.statusReschedule;
                              return GestureDetector(
                                  child: Card(
                                  elevation: 0,
                                  shape: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: CustomColors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                        
                                  color: CustomColors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${reschedule.auditor}', style: CustomStyles.textBold15Px),
                                            if(statusReschedules == 'Pending')
                                            Text('${reschedule.statusReschedule}', style: CustomStyles.textMediumGrey13Px),
                                            if(statusReschedules == 'Reject')
                                            Text('${reschedule.statusReschedule}', style: CustomStyles.textMediumRed13Px),
                                            if(statusReschedules == 'Approve')
                                            Text('${reschedule.statusReschedule}', style: CustomStyles.textMediumGreen13Px),
                                            if(statusReschedules == 'Request')
                                            Text('${reschedule.statusReschedule}', style: CustomStyles.textMediumBlue13Px),
                                          ],
                                        ),

                                        const SizedBox(height: 10),
                                        Text('Cabang : ${reschedule.branch}', style: CustomStyles.textMedium13Px),
                                        Text('Area : ${reschedule.area}', style: CustomStyles.textMedium13Px),
                                        Text('Tanggal : ${reschedule.startDate} s/d ${reschedule.endDate}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  Get.to(() => DetailRescheduleAuditRegion(rescheduleId: reschedule.id!));
                                },
                              );
                            }
                          );
                        }
                      }),
                  ),
                )
              ]
          ),
        )
    );
  }

}
