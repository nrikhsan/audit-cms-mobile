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

  final ControllerAuditArea controllerAllData = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();

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
                            showDialogFilterMainSchedules();
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
                      if (controllerAllData.isLoading.isTrue) {
                        return const Center(child: SpinKitCircle(color: CustomColors.blue));
                      } else {
                        return ListView.builder(
                          itemCount: controllerAllData.mainSchedulesAuditArea.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final schedule = controllerAllData.mainSchedulesAuditArea[index];
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
                                        Text('Auditor : ${schedule.auditor}', style: CustomStyles.textBold15Px),
                                        Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium15Px),
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
                          showDialogFilterSpecialScheduleSchedules();
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
                      if(controllerAllData.isLoading.isTrue){
                        return const Center(
                            child: SpinKitCircle(color: CustomColors.blue)
                        );
                      }else{
                        return ListView.builder(
                            itemCount: controllerAllData.specialSchedulesAuditArea.length,
                            itemBuilder: (_, index){
                              final schedule = controllerAllData.specialSchedulesAuditArea[index];
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
                                          Text('Auditor : ${schedule.auditor}', style: CustomStyles.textBold15Px),
                                          Text('${schedule.startDate} s/d ${schedule.endDate}', style: CustomStyles.textMedium15Px),
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
                            showDialogFilterReschedules();
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
                      if(controllerAllData.isLoading.isTrue){
                        return const Center(child: SpinKitCircle(color: CustomColors.blue));
                      }else{
                        return ListView.builder(
                            itemCount: controllerAllData.resSchedulesAuditArea.length,
                            itemBuilder: (_, index){
                              final reschedules = controllerAllData.resSchedulesAuditArea[index];
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
                                          Text('Auditor : ${reschedules.auditor}', style: CustomStyles.textBold15Px),
                                          Text('${reschedules.startDate} s/d ${reschedules.endDate}', style: CustomStyles.textMedium15Px),
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

  void showDialogFilterMainSchedules() {
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
                    controller: auditorController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_2_rounded,
                            color: CustomColors.grey, size: 20),
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
                    controller: branchController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.account_balance_rounded,
                            color: CustomColors.grey, size: 20),
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
                    controller: startDateController,
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
                        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateController,
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
                        endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  Obx(() => controllerAllData.filterIsActive.value
                    ? SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                          ),
                          onPressed: (){
                            controllerAllData.loadMainSchedulesAuditArea();
                            startDateController.clear();
                            endDateController.clear();
                            auditorController.clear();
                            branchController.clear();
                            Get.back();
                          },
                          child: Text('Reset', style: CustomStyles.textMediumWhite15Px)
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
                            controllerAllData.filterMainSchedule(startDateController.text, endDateController.text, auditorController.text, branchController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
                  )
                )
                ],
              ),
            )
          );
        }
    );
  }

  void showDialogFilterSpecialScheduleSchedules(){
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
                    controller: auditorController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_2_rounded,
                            color: CustomColors.grey, size: 20),
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
                    controller: branchController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.account_balance_rounded,
                            color: CustomColors.grey, size: 20),
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
                    controller: startDateController,
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
                        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateController,
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
                        endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 25),
                  Obx(() => controllerAllData.filterIsActive.value
                    ? SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                          ),
                          onPressed: (){
                            controllerAllData.loadSpecialSchedulesAuditArea();
                            startDateController.clear();
                            endDateController.clear();
                            auditorController.clear();
                            branchController.clear();
                            Get.back();
                          },
                          child: Text('Reset', style: CustomStyles.textMediumWhite15Px)
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
                            controllerAllData.filterSpecialSchedules(startDateController.text, endDateController.text, auditorController.text, branchController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
                  )
                )
                ],
              ),
            )
          );
        }
    );
  }

  void showDialogFilterReschedules() {
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
                    controller: auditorController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_2_rounded,
                            color: CustomColors.grey, size: 20),
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
                    controller: branchController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.account_balance_rounded,
                            color: CustomColors.grey, size: 20),
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
                    controller: startDateController,
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
                        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateController,
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
                        endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                      }
                    },
                  ),

                 const SizedBox(height: 25),
                  Obx(() => controllerAllData.filterIsActive.value
                    ? SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                          ),
                          onPressed: (){
                            controllerAllData.loadReschedulesAuditArea();
                            startDateController.clear();
                            endDateController.clear();
                            auditorController.clear();
                            branchController.clear();
                            Get.back();
                          },
                          child: Text('Reset', style: CustomStyles.textMediumWhite15Px)
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
                            controllerAllData.filterReschedules(startDateController.text, endDateController.text, auditorController.text, branchController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
                  )
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
