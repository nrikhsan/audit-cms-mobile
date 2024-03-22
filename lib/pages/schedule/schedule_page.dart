import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/schedule/detail_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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
                            showDialogFilterMainSchedulesAuditArea();
                          }
                      ),

                      SpeedDialChild(
                        backgroundColor: CustomColors.green,
                        label: 'Tambah jadwal utama',
                        labelStyle: CustomStyles.textMediumWhite15Px,
                        labelBackgroundColor: CustomColors.green,
                        child: const Icon(Icons.add_rounded, color: CustomColors.white),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const InputDataSchedulesPage()));
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
                            final schedule = controllerAuditArea.mainSchedulesAuditArea[index];
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
                                        Text('${schedule.auditor}', style: CustomStyles.textBold15Px),
                                        Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                    
                                    const SizedBox(height: 10),
                                      Text('Cabang : ${schedule.branch}', style: CustomStyles.textMedium13Px),
                                      
                                      Text('Area : ${schedule.area}', style: CustomStyles.textMedium13Px),
                                  ],
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => DetailSChedulePageAuditAreaState(id: schedule.id!)));
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
                          showDialogFilterSpecialScheduleAuditArea();
                        }
                    ),

                    SpeedDialChild(
                        backgroundColor: CustomColors.green,
                        label: 'Tambah jadwal khusus',
                        labelStyle: CustomStyles.textMediumWhite15Px,
                        labelBackgroundColor: CustomColors.green,
                        child: const Icon(Icons.add_rounded, color: CustomColors.white),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const InputDataSchedulesPage()));
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
                              final schedule = controllerAuditArea.specialSchedulesAuditArea[index];
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
                                          Text('${schedule.auditor}', style: CustomStyles.textBold15Px),
                                          Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                    
                                      const SizedBox(height: 10),
                                      Text('Cabang : ${schedule.branch}', style: CustomStyles.textMedium13Px),
                                      
                                      Text('Area : ${schedule.area}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailSChedulePageAuditAreaState(id: schedule.id!)));
                              },
                              );
                            }
                        );
                      }
                    }),
                  ),
                ),


                // 1. reschedule
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
                            showDialogFilterReschedulesAuditArea();
                          }
                      ),

                      SpeedDialChild(
                          backgroundColor: CustomColors.green,
                          label: 'Tambah reschedule',
                          labelStyle: CustomStyles.textMediumWhite15Px,
                          labelBackgroundColor: CustomColors.green,
                          child: const Icon(Icons.add_rounded, color: CustomColors.white),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const InputDataSchedulesPage()));
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
                                          Text('${reschedules.startDate} s/d ${reschedules.endDate}', style: CustomStyles.textMedium13Px),
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
                                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailSChedulePageAuditAreaState(id: reschedules.id!)));
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

  void showDialogFilterMainSchedulesAuditArea() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (_){
          return Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    title: const Text('Filter data jadwal'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),
                  ),
                  const SizedBox(height: 25),


                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: auditorControllerMainSchedule,
                    onChanged: (auditor) => auditorControllerMainSchedule.text = auditor,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Auditor...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),

                  const SizedBox(height: 15),
                  Text('Dengan cabang', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: branchControllerMainSChedule,
                    onChanged: (branch) => branchControllerMainSChedule.text = branch,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Cabang...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: startDateControllerMainSchedule,
                    onChanged: (startDate) => startDateControllerMainSchedule.text = startDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          startDateControllerMainSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateControllerMainSchedule,
                    onChanged: (endDate) => endDateControllerMainSchedule.text = endDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          endDateControllerMainSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        controllerAuditArea.filterMainSchedule(startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, 
                        branchControllerMainSChedule.text, auditorControllerReschedule.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                ],
              ),
            )
          );
        }
    );
  }

  void showDialogFilterSpecialScheduleAuditArea(){
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (_){
          return Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    title: const Text('Filter data jadwal'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),
                  ),
                  const SizedBox(height: 25),


                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: auditorControllerSpecialSchedule,
                    onChanged: (auditor) => auditorControllerSpecialSchedule.text = auditor,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Auditor...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),

                  const SizedBox(height: 15),
                  Text('Dengan cabang', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: branchControllerSpecialSchedule,
                    onChanged: (branch) => branchControllerSpecialSchedule.text = branch,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Cabang...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: startDateControllerSpecialSchedule,
                    onChanged: (startDate) => startDateControllerSpecialSchedule.text = startDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          startDateControllerSpecialSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateControllerSpecialSchedule,
                    onChanged: (endDate) => endDateControllerSpecialSchedule.text = endDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          endDateControllerSpecialSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        controllerAuditArea.filterSpecialSchedules(startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text, 
                        branchControllerSpecialSchedule.text, auditorControllerSpecialSchedule.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                ],
              ),
            )
          );
        }
    );
  }

  void showDialogFilterReschedulesAuditArea() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (_){
          return Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    title: const Text('Filter data jadwal'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),
                  ),
                  const SizedBox(height: 25),


                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: auditorControllerReschedule,
                    onChanged: (auditor) => auditorControllerReschedule.text = auditor,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Auditor...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),

                  const SizedBox(height: 15),
                  Text('Dengan cabang', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: branchControllerReschedule,
                    onChanged: (branch) => branchControllerReschedule.text = branch,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        labelStyle: CustomStyles.textMediumGrey15Px,
                        labelText: 'Cabang...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: startDateControllerReschedule,
                    onChanged: (startDate) => startDateControllerReschedule.text = startDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          startDateControllerReschedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateControllerReschedule,
                    onChanged: (endDate) => endDateControllerReschedule.text = endDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          endDateControllerReschedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                 const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        controllerAuditArea.filterReschedules(startDateControllerReschedule.text, endDateControllerReschedule.text, 
                        branchControllerReschedule.text, auditorControllerReschedule.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                ],
              ),
            )
          );
        }
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
                            showDialogFilterMainSchedulesAuditRegion();
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
                            final schedule = controllerAuditRegion.mainScheduleAuditRegion[index];
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
                                          Text('${schedule.auditor}', style: CustomStyles.textBold15Px),
                                          Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),
                                        ],
                                      ),
                      
                                      const SizedBox(height: 10),
                                        Text('Cabang : ${schedule.branch}', style: CustomStyles.textMedium13Px),
                                        Text('Area : ${schedule.area}', style: CustomStyles.textMedium13Px),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScheduleAuditRegion(id: schedule.id!)));
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
                          showDialogFilterSpecialSchedulesAuditRegion();
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
                              final schedule = controllerAuditRegion.specialScheduleAuditRegion[index];
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
                                            Text('${schedule.auditor}', style: CustomStyles.textBold15Px),
                                            Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),
                                          ],
                                        ),
                        
                                        const SizedBox(height: 10),
                                          Text('Cabang : ${schedule.branch}', style: CustomStyles.textMedium13Px),
                                          Text('Area : ${schedule.area}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScheduleAuditRegion(id: schedule.id!)));
                                },
                              );
                            }
                          );
                        }
                      }),
                ),
              ),


                // 1. reschedule
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
                            showDialogFilterReschedulesAuditRegion();
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
                              final schedule = controllerAuditRegion.rescheduleAuditRegion[index];
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
                                            Text('${schedule.auditor}', style: CustomStyles.textBold15Px),
                                            Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium13Px),
                                          ],
                                        ),
                        
                                        const SizedBox(height: 10),
                                          Text('Cabang : ${schedule.branch}', style: CustomStyles.textMedium13Px),
                                          Text('Area : ${schedule.area}', style: CustomStyles.textMedium13Px),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScheduleAuditRegion(id: schedule.id!)));
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
  
  void showDialogFilterMainSchedulesAuditRegion() {
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      context: context, 
      builder: (_){
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            left: 15,
            right: 15
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: const Text('Filter data jadwal'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                  ),
                ),

                const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: startDateControllerMainSchedule,
                    onChanged: (startDate) => startDateControllerMainSchedule.text = startDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          startDateControllerMainSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),


                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateControllerMainSchedule,
                    onChanged: (endDate) => endDateControllerMainSchedule.text = endDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          endDateControllerMainSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                  
                  Wrap(
                    children: [
                    startDateControllerMainSchedule.text.isNotEmpty || endDateControllerMainSchedule.text.isNotEmpty
                    ? SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.red
                      ),
                      onPressed: (){
                        startDateControllerMainSchedule.clear();
                        endDateControllerMainSchedule.clear();
                        controllerAuditRegion.loadMainScheduleAuditRegion();
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
                        controllerAuditRegion.filterMainScheduleAuditRegion(startDateControllerMainSchedule.text, endDateControllerMainSchedule.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
  
  void showDialogFilterSpecialSchedulesAuditRegion() {
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      context: context, 
      builder: (_){
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            left: 15,
            right: 15
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: const Text('Filter data jadwal'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                  ),
                ),

                const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: startDateControllerSpecialSchedule,
                    onChanged: (startDate) => startDateControllerSpecialSchedule.text = startDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          startDateControllerSpecialSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),


                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateControllerSpecialSchedule,
                    onChanged: (endDate) => endDateControllerSpecialSchedule.text = endDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          endDateControllerSpecialSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                  
                  Wrap(
                    children: [
                    startDateControllerSpecialSchedule.text.isNotEmpty || endDateControllerSpecialSchedule.text.isNotEmpty
                    ? SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.red
                      ),
                      onPressed: (){
                        startDateControllerSpecialSchedule.clear();
                        endDateControllerSpecialSchedule.clear();
                        controllerAuditRegion.loadSpecialScheduleAuditRegion();
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
                        controllerAuditRegion.filterSpecialScheduleAuditRegion(startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
  
  void showDialogFilterReschedulesAuditRegion() {
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      context: context, 
      builder: (_){
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            left: 15,
            right: 15
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: const Text('Filter data jadwal'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                  ),
                ),

                const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: startDateControllerReschedule,
                    onChanged: (startDate) => startDateControllerReschedule.text = startDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Mulai dari...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          startDateControllerReschedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),


                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateControllerReschedule,
                    onChanged: (endDate) => endDateControllerReschedule.text = endDate,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range_rounded,
                            color: CustomColors.grey, size: 20),
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        hintText: 'Sampai dengan...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: CustomColors.grey)
                        )
                    ),
                    onTap: ()async{
                      DateTime? picked = await showDatePicker(
                          cancelText: 'Tidak',
                          confirmText: 'ya',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100)
                      );
                      if(picked != null){
                        setState(() {
                          endDateControllerReschedule.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                  
                  Wrap(
                    children: [
                    startDateControllerReschedule.text.isNotEmpty || endDateControllerReschedule.text.isNotEmpty
                    ? SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.red
                      ),
                      onPressed: (){
                        startDateControllerReschedule.clear();
                        endDateControllerReschedule.clear();
                        controllerAuditRegion.loadRescheduleAuditRegion();
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
                        controllerAuditRegion.filteRescheduleAuditRegion(startDateControllerReschedule.text, endDateControllerReschedule.text);
                        Get.back();
                      },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
