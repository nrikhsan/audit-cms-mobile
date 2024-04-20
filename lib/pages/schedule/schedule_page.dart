import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/schedule/detail_schedule.dart';
import 'package:audit_cms/pages/schedule/edit_schedule_page.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/bottom_sheet_filter_schedule_audit_area.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/bottom_sheet_filter_schedule_audit_region.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();
  final TextEditingController auditorControllerMainSchedule = TextEditingController();

  final TextEditingController startDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController endDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController auditorControllerSpecialSchedule = TextEditingController();

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();
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
                           bottomSheetFilterMainSchedule(context, auditorControllerMainSchedule,
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
                    child: PagedListView<int, ContentMainScheduleAuditArea>(
                          pagingController: controllerAuditArea.pagingControllerMainSchedule,
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, mainSchedule, index){
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
                                        Text('${mainSchedule.user!.fullname}', style: CustomStyles.textBold15Px),
                                        Text('${mainSchedule.status}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                    
                                    const SizedBox(height: 10),
                                    Text('Cabang : ${mainSchedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                    const SizedBox(height: 5),
                                    Text('Kategori : ${mainSchedule.category}', style: CustomStyles.textMedium13Px),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                          ),
                                          onPressed: (){
                                            Get.to(() => EditMainSchedulePage(scheduleId: mainSchedule.id!));
                                          }, 
                                          child: Text('Edit jadwal', style: CustomStyles.textMediumGreen13Px)
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: (){
                              Get.to(() => DetailMainSchedulePageAuditArea(mainScheduleId: mainSchedule.id!));
                            },
                            onLongPress: (){
                              alertDeleteWidget(
                                context, 
                                'Hapus jadwal', 
                                'Apakah anda yakin untuk menghapus jadwal ini?',
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        controllerAuditArea.deleteMainSchedule(mainSchedule.id!);
                                        Get.back();
                                        snakcBarMessageGreen('Berhasil', 'Jadwal berhasil dihapus');
                                      }, 
                                      child: Text('Ya', style: CustomStyles.textMediumGreen15Px)
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Get.back();
                                      }, 
                                      child: Text('Tidak', style: CustomStyles.textMediumRed15Px)
                                    )
                                  ],
                                )
                              );
                            });
                          }
                        ),
                      )
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
                          bottomSheetFilterSpecialSchedule(context, auditorControllerSpecialSchedule, startDateControllerSpecialSchedule, endDateControllerSpecialSchedule, controllerAuditArea);
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
                    child: PagedListView<int, ContentSpecialScheduleAuditArea>(
                          pagingController: controllerAuditArea.pagingControllerSpecialSchedule, 
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, schedule, index){
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
                                          Text('${schedule.user!.fullname}', style: CustomStyles.textBold15Px),
                                          Text('${schedule.status}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                    
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${schedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                      const SizedBox(height: 5),
                                      Text('Kategori : ${schedule.category}', style: CustomStyles.textMedium13Px),

                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                          ),
                                          onPressed: (){
                                           Get.to(() => EditSpecialSchedule(scheduleId: schedule.id!));
                                          }, 
                                          child: Text('Edit jadwal', style: CustomStyles.textMediumGreen13Px)
                                        )
                                      ],
                                    )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Get.to(() => DetailSpecialSchedulePageAuditArea(specialScheduleId: schedule.id!));
                              },
                              onLongPress: (){
                              alertDeleteWidget(
                                context, 
                                'Hapus jadwal', 
                                'Apakah anda yakin untuk menghapus jadwal ini?',
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        controllerAuditArea.deleteSpecialSchedule(schedule.id!);
                                        Get.back();
                                        snakcBarMessageGreen('Berhasil', 'Jadwal berhasil dihapus');
                                      }, 
                                      child: Text('Ya', style: CustomStyles.textMediumGreen15Px)
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Get.back();
                                      }, 
                                      child: Text('Tidak', style: CustomStyles.textMediumRed15Px)
                                    )
                                  ],
                                )
                              );
                            });
                          })
                        )
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
                            bottomSheetFilterReschedule(context, auditorControllerReschedule, 
                            startDateControllerReschedule, endDateControllerReschedule, controllerAuditArea);
                          }
                      )
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: PagedListView<int, ContentListRescheduleAuditArea>(
                          pagingController: controllerAuditArea.pagingControllerReschedule,
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, reschedules, index){
                              final statusReschedules = reschedules.status;
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
                                          Text('${reschedules.user!.fullname}', style: CustomStyles.textBold15Px),
                                          if(statusReschedules == 'PENDING')
                                          Text('${reschedules.status}', style: CustomStyles.textMediumGrey13Px),
                                          if(statusReschedules == 'REQUEST')
                                          Text('${reschedules.status}', style: CustomStyles.textMediumRed13Px),
                                          if(statusReschedules == 'APPROVE')
                                          Text('${reschedules.status}', style: CustomStyles.textMediumGreen13Px),
                                          if(statusReschedules == 'REJECTED')
                                          Text('${reschedules.status}', style: CustomStyles.textMediumBlue13Px),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${reschedules.branch!.name}', style: CustomStyles.textMedium13Px),
                                      const SizedBox(height: 5),
                                      Text('Area : ${reschedules.category}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                if (reschedules.status == 'PENDING') {
                                  Get.to(() => InputDataReschedulePage(rescheduleId: reschedules.id!));
                                }else{
                                  Get.to(() => DetailReschedulePageAuditArea(rescheduleId: reschedules.id!));
                                }
                              });
                            }
                          )
                        )
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

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();

  final TextEditingController startDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController endDateControllerSpecialSchedule = TextEditingController();

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
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
                Tab(text: 'Jadwal khusus')
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
                    child: PagedListView<int, ContentMainScheduleAuditRegion>(
                          pagingController: controllerAuditRegion.pagingControllerMainSchedule, 
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, mainSchedule, index){
                              final status = mainSchedule.status;
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
                                          Text('${mainSchedule.user!.fullname}', style: CustomStyles.textBold15Px),
                                          Text('${mainSchedule.status}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                      
                                      const SizedBox(height: 10),
                                        Text('Cabang : ${mainSchedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                        Text('Kategori : ${mainSchedule.category}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                if (status == 'PENDING') {
                                  snakcBarMessageRed('Alert', 'Harap tunggu persetujuan dari audit leader');
                                } else if(status == 'REQUEST') {
                                  snakcBarMessageRed('Alert', 'Harap tunggu persetujuan dari audit leader');
                                }else if(status == 'APPROVE'){
                                  Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!));
                                }
                              },
                            );
                            }
                          )
                        )
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
                  child: PagedListView<int, ContentListSpecialScheduleAuditRegion>(
                            pagingController: controllerAuditRegion.pagingControllerSpecialSchedule, 
                            builderDelegate: PagedChildBuilderDelegate(
                              itemBuilder: (_, schedule, index){
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
                                          Text('${schedule.user!.fullname}', style: CustomStyles.textBold15Px),
                                          Text('${schedule.status}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                      
                                      const SizedBox(height: 10),
                                        Text('Cabang : ${schedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                        Text('Kategori : ${schedule.category}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Get.to(() => DetailSpecialScheduleAuditRegion(specialScheduleId: schedule.id!));
                              },
                            );
                              }
                            )
                          )
                ),
              ),
            ]
          ),
        )
    );
  }
}
