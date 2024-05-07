import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
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
import 'package:intl/intl.dart';
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
                    child: RefreshIndicator(
                      onRefresh: ()async{
                        controllerAuditArea.pagingControllerMainSchedule.refresh();
                      },
                      child: PagedListView<int, ContentMainScheduleAuditArea>(
                          pagingController: controllerAuditArea.pagingControllerMainSchedule,
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, mainSchedule, index){
                              final status = mainSchedule.status;
                              final startDate = DateTime.parse(mainSchedule.startDate!);
                              final endDate = DateTime.parse(mainSchedule.endDate!);
                              final outputStartDate = DateFormat('dd-MM-yyyy').format(startDate);
                              final outputEndDate = DateFormat('dd-MM-yyyy').format(endDate);
                              return GestureDetector(
                              onTap: (){
                              Get.to(() => DetailMainSchedulePageAuditArea(mainScheduleId: mainSchedule.id!));
                            },
                            onLongPress: mainSchedule.status == 'TODO' ? (){
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
                            }: null,
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
                                        Wrap(
                                          children: [
                                            if(status == 'TODO')
                                            Text('Belum dikerjakan', style: CustomStyles.textMedium13Px),
                                            if(status == 'PROGRESS')
                                            Text('Sedang dikerjakan', style: CustomStyles.textMedium13Px),
                                            if(status == 'DONE')
                                            Text('Sudah selesai', style: CustomStyles.textMedium13Px),
                                            if(status == 'PENDING')
                                            Text('Pending', style: CustomStyles.textMedium13Px),
                                            if(status == 'REQUEST')
                                            Text('Menunggu persetujuan', style: CustomStyles.textMedium13Px),
                                            if(status == 'APPROVE')
                                            Text('Disetujui', style: CustomStyles.textMedium13Px),
                                            if(status == 'REJECTED')
                                            Text('Ditolak', style: CustomStyles.textMedium13Px),
                                          ],
                                        )
                                      ],
                                    ),
                    
                                    const SizedBox(height: 10),
                                    Text('Cabang : ${mainSchedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                    const SizedBox(height: 5),
                                    Text('Kategori : ${mainSchedule.category}', style: CustomStyles.textMedium13Px),
                                    const SizedBox(height: 5),
                                    Text('Tanggal : $outputStartDate s/d $outputEndDate', style: CustomStyles.textMedium13Px),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                              ),
                                              onPressed: mainSchedule.status == 'TODO' ? () {
                                                String startDate = DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(outputStartDate));
                                                String endDate = DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(outputEndDate));

                                                Get.to(() => EditMainSchedulePage(scheduleId: mainSchedule.id!, startDate: startDate, endDate: endDate, 
                                                user: mainSchedule.user!.id!, branch: mainSchedule.branch!.id!, desc: mainSchedule.description!));
                                              }: null, 
                                              child: Text('Edit jadwal', style: CustomStyles.textMediumGreen13Px)
                                            )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                          }
                        ),
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
                    child: RefreshIndicator(
                      onRefresh: ()async{
                        controllerAuditArea.pagingControllerSpecialSchedule.refresh();
                      },
                      child: PagedListView<int, ContentSpecialScheduleAuditArea>(
                          pagingController: controllerAuditArea.pagingControllerSpecialSchedule, 
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, schedule, index){
                              final createdBy = schedule.createdBy!.level?.name;
                              final status = schedule.status;
                               return GestureDetector(
                                onTap: (){
                                Get.to(() => DetailSpecialSchedulePageAuditArea(specialScheduleId: schedule.id!, startDate: schedule.startDate, endDate:  schedule.endDate, kka: schedule.kka?.filename, createdBy: createdBy));
                              },
                              onLongPress: schedule.status == 'TODO' ? ()async{
                              if (createdBy == 'PUSAT') {
                                  null;
                              } else {
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
                              }
                            }: null,
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
                                          Wrap(
                                          children: [
                                            if(status == 'TODO')
                                            Text('Belum dikerjakan', style: CustomStyles.textMedium13Px),
                                            if(status == 'PROGRESS')
                                            Text('Sedang dikerjakan', style: CustomStyles.textMedium13Px),
                                            if(status == 'DONE')
                                            Text('Sudah selesai', style: CustomStyles.textMedium13Px),
                                            // if(status == 'PENDING')
                                            // Text('Pending', style: CustomStyles.textMedium13Px),
                                            // if(status == 'REQUEST')
                                            // Text('Menunggu persetujuan', style: CustomStyles.textMedium13Px),
                                            // if(status == 'APPROVE')
                                            // Text('Disetujui', style: CustomStyles.textMedium13Px),
                                            // if(status == 'REJECTED')
                                            // Text('Ditolak', style: CustomStyles.textMedium13Px),
                                          ],
                                        )
                                        ],
                                      ),
                    
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${schedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                      const SizedBox(height: 5),
                                      Text('Kategori : ${schedule.category}', style: CustomStyles.textMedium13Px),
                                      const SizedBox(height: 5),
                                      Text('Tanggal : ${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),

                                     Wrap(
                                      children: [
                                        createdBy == 'PUSAT' ? const SizedBox()
                                        : Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                                ),
                                                onPressed: schedule.status == 'TODO' ? (){
                                                  String startDate = DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(schedule.startDate!));
                                                    String endDate = DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(schedule.endDate!));

                                                    Get.to(() => EditSpecialSchedule(scheduleId: schedule.id!, startDate: startDate, endDate: endDate, 
                                                    user: schedule.user!.id!, branch: schedule.branch!.id!, desc: schedule.description!));

                                                }: null, 
                                                child: Text('Edit jadwal', style: CustomStyles.textMediumGreen13Px)
                                              ),
                                            ],
                                          )
                                      ],
                                     )
                                    ],
                                  ),
                                ),
                              ));
                          })
                        )
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
                    child: RefreshIndicator(
                      onRefresh: ()async{
                        controllerAuditArea.pagingControllerReschedule.refresh();
                      },
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
                                          Wrap(
                                            children: [
                                              if(statusReschedules == 'PENDING')
                                              Text('Pending', style: CustomStyles.textMedium13Px),
                                              if(statusReschedules == 'REQUEST')
                                              Text('Menunggu persetujuan', style: CustomStyles.textMedium13Px),
                                              if(statusReschedules == 'APPROVE')
                                              Text('Disetujui', style: CustomStyles.textMedium13Px),
                                              if(statusReschedules == 'REJECTED')
                                              Text('Ditolak', style: CustomStyles.textMedium13Px),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${reschedules.branch!.name}', style: CustomStyles.textMedium13Px),
                                      const SizedBox(height: 5),
                                      Text('Kategori : ${reschedules.category}', style: CustomStyles.textMedium13Px),
                                      const SizedBox(height: 5),
                                      Text('Tanggal : ${reschedules.startDate} s/d ${reschedules.endDate}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                String startDate = DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(reschedules.startDate!));
                                String endDate = DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(reschedules.endDate!));
                                if (reschedules.status == 'PENDING') {
                                  Get.to(() => InputDataReschedulePage(rescheduleId: reschedules.id!, startDate: startDate, endDate: endDate, 
                                    user: reschedules.user!.id!, branch: reschedules.branch!.id!, desc: reschedules.description!));
                                }else if(reschedules.status == 'REQUEST'){
                                  Get.to(() => DetailReschedulePageAuditArea(rescheduleId: reschedules.id!));
                                }else if(reschedules.status == 'REJECTED'){
                                  Get.to(() => DetailReschedulePageAuditArea(rescheduleId: reschedules.id!));
                                }else if(reschedules.status == 'APPROVE'){
                                  Get.to(() => DetailReschedulePageAuditArea(rescheduleId: reschedules.id!));
                                }
                              });
                            }
                          )
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
                    child: RefreshIndicator(
                      onRefresh: ()async{
                        controllerAuditRegion.pagingControllerMainSchedule.refresh();
                      },
                      child: PagedListView<int, ContentMainScheduleAuditRegion>(
                          pagingController: controllerAuditRegion.pagingControllerMainSchedule, 
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (_, mainSchedule, index){
                              final status = mainSchedule.status;
                              final isActive = mainSchedule.isActive;
                              final kka = mainSchedule.kka?.filename;
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
                                          Wrap(
                                            children: [
                                              if(status == 'TODO')
                                              Text('Belum dikerjakan', style: CustomStyles.textMedium13Px),
                                              if(status == 'PROGRESS')
                                              Text('Sedang dikerjakan', style: CustomStyles.textMedium13Px),
                                              if(status == 'DONE')
                                              Text('Sudah selesai', style: CustomStyles.textMedium13Px),
                                              if(status == 'PENDING')
                                              Text('Pending', style: CustomStyles.textMedium13Px),
                                              if(status == 'REQUEST')
                                              Text('Menunggu persetujuan', style: CustomStyles.textMedium13Px),
                                              if(status == 'APPROVE')
                                              Text('Disetujui', style: CustomStyles.textMedium13Px),
                                              if(status == 'REJECTED')
                                              Text('Ditolak', style: CustomStyles.textMedium13Px),
                                            ],
                                          )
                                        ],
                                      ),
                      
                                      const SizedBox(height: 10),
                                        Text('Cabang : ${mainSchedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                        Text('Kategori : ${mainSchedule.category}', style: CustomStyles.textMedium13Px),
                                        Text('Tanggal : ${mainSchedule.startDate} s/d ${mainSchedule.endDate}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                  if (isActive == 1) {
                                    Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!, kka: kka, startDate: mainSchedule.startDate!, endDate: mainSchedule.endDate!));
                                  } else if(isActive == 0){
                                    snakcBarMessageRed('Alert', 'Anda harus mengunggah KKA terlebih dahulu untuk membuka jadwal berikutnya');
                                  }else if(status == 'TODO'){
                                    Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!, kka: kka, startDate: mainSchedule.startDate!, endDate: mainSchedule.endDate!));
                                  }else if(status == 'PROGRESS'){
                                    Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!, kka: kka, startDate: mainSchedule.startDate!, endDate: mainSchedule.endDate!));
                                  }else if(status == 'DONE'){
                                    Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!, kka: kka, startDate: mainSchedule.startDate!, endDate: mainSchedule.endDate!));
                                  }else if(status == 'PENDING'){
                                    snakcBarMessageRed('Alert', 'Anda harus reschedule terlebih dahulu');
                                  }else if(status == 'APPROVE'){
                                    Get.to(() => DetailMainScheduleAuditRegion(mainScheduleId: mainSchedule.id!, kka: kka, startDate: mainSchedule.startDate!, endDate: mainSchedule.endDate!));
                                  }
                                },
                              );
                            }
                          )
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
                  child: RefreshIndicator(
                    onRefresh: ()async{
                      controllerAuditRegion.pagingControllerSpecialSchedule.refresh();
                    },
                    child: PagedListView<int, ContentListSpecialScheduleAuditRegion>(
                            pagingController: controllerAuditRegion.pagingControllerSpecialSchedule, 
                            builderDelegate: PagedChildBuilderDelegate(
                              itemBuilder: (_, schedule, index){
                                final status = schedule.status;
                                final isActive = schedule.isActive;
                                final kka = schedule.kka?.filename;
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
                                          Wrap(
                                            children: [
                                              if(status == 'TODO')
                                              Text('Belum dikerjakan', style: CustomStyles.textMedium13Px),
                                              if(status == 'PROGRESS')
                                              Text('Sedang dikerjakan', style: CustomStyles.textMedium13Px),
                                              if(status == 'DONE')
                                              Text('Sudah selesai', style: CustomStyles.textMedium13Px),
                                              // if(status == 'PENDING')
                                              // Text('Pending', style: CustomStyles.textMedium13Px),
                                              // if(status == 'REQUEST')
                                              // Text('Menunggu persetujuan', style: CustomStyles.textMedium13Px),
                                              // if(status == 'APPROVE')
                                              // Text('Disetujui', style: CustomStyles.textMedium13Px),
                                              // if(status == 'REJECTED')
                                              // Text('Ditolak', style: CustomStyles.textMedium13Px),
                                            ],
                                          )
                                        ],
                                      ),
                      
                                      const SizedBox(height: 10),
                                        Text('Cabang : ${schedule.branch!.name}', style: CustomStyles.textMedium13Px),
                                        Text('Kategori : ${schedule.category}', style: CustomStyles.textMedium13Px),
                                        Text('Tanggal : ${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                if (isActive == 1) {
                                    Get.to(() => DetailSpecialScheduleAuditRegion(specialScheduleId: schedule.id!, kka: kka, startDate: schedule.startDate!, endDate: schedule.endDate!));
                                  } else if(isActive == 0){
                                    snakcBarMessageRed('Alert', 'Anda harus mengunggah KKA terlebih dahulu untuk membuka jadwal berikutnya');
                                  }else if(status == 'TODO'){
                                    Get.to(() => DetailSpecialScheduleAuditRegion(specialScheduleId: schedule.id!, kka: kka, startDate: schedule.startDate!, endDate: schedule.endDate!));
                                  }else if(status == 'PROGRESS'){
                                    Get.to(() => DetailSpecialScheduleAuditRegion(specialScheduleId: schedule.id!, kka: kka, startDate: schedule.startDate!, endDate: schedule.endDate!));
                                  }else if(status == 'DONE'){
                                    Get.to(() => DetailSpecialScheduleAuditRegion(specialScheduleId: schedule.id!, kka: kka, startDate: schedule.startDate!, endDate: schedule.endDate!));
                                  }
                              },
                            );
                              }
                            )
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
