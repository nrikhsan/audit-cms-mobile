
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void bottomSheetFilterMainSchedule(BuildContext context, 
TextEditingController auditorControllerMainSchedule, TextEditingController branchControllerMainSChedule, 
TextEditingController startDateControllerMainSchedule, TextEditingController endDateControllerMainSchedule, ControllerAuditArea controllerAuditArea){
  showModalBottomSheet(
    elevation: 0,
    isScrollControlled: true,
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
                    leading: IconButton(
                      onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),
                  actions: [
                    IconButton(
                      onPressed: (){
                      if (auditorControllerMainSchedule.text.isNotEmpty) {
                          auditorControllerMainSchedule.clear();
                          controllerAuditArea.loadMainSchedulesAuditArea();
                          branchControllerMainSChedule.clear();
                          startDateControllerMainSchedule.clear();
                          endDateControllerMainSchedule.clear();
                          Get.back();
                        }else if(branchControllerMainSChedule.text.isNotEmpty){
                          auditorControllerMainSchedule.clear();
                          controllerAuditArea.loadMainSchedulesAuditArea();
                          branchControllerMainSChedule.clear();
                          startDateControllerMainSchedule.clear();
                          endDateControllerMainSchedule.clear();
                          Get.back();
                        }else if(startDateControllerMainSchedule.text.isNotEmpty || endDateControllerMainSchedule.text.isNotEmpty){
                          auditorControllerMainSchedule.clear();
                          controllerAuditArea.loadMainSchedulesAuditArea();
                          branchControllerMainSChedule.clear();
                          startDateControllerMainSchedule.clear();
                          endDateControllerMainSchedule.clear();
                          Get.back();
                        }else{
                          Get.snackbar('Alert', 'Reset data filter gagal', backgroundColor: CustomColors.red, 
                          colorText: CustomColors.white, snackPosition: SnackPosition.TOP);
                        }
                      },
                        icon: const Icon(Icons.refresh_rounded, color: CustomColors.grey, size: 25)
                      ),
                  ],
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
                        startDateControllerMainSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
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
                        endDateControllerMainSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
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
                        branchControllerMainSChedule.text, auditorControllerMainSchedule.text);
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


void bottomSheetFilterSpecialSchedule(BuildContext context, 
TextEditingController auditorControllerSpecialSchedule, TextEditingController branchControllerSpecialSchedule, 
TextEditingController startDateControllerSpecialSchedule, TextEditingController endDateControllerSpecialSchedule, ControllerAuditArea controllerAuditArea){
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

                    actions: [
                    IconButton(
                      onPressed: (){
                      if (auditorControllerSpecialSchedule.text.isNotEmpty) {
                          auditorControllerSpecialSchedule.clear();
                          controllerAuditArea.loadSpecialSchedulesAuditArea();
                          branchControllerSpecialSchedule.clear();
                          startDateControllerSpecialSchedule.clear();
                          endDateControllerSpecialSchedule.clear();
                          Get.back();
                        }else if(branchControllerSpecialSchedule.text.isNotEmpty){
                          auditorControllerSpecialSchedule.clear();
                          controllerAuditArea.loadSpecialSchedulesAuditArea();
                          branchControllerSpecialSchedule.clear();
                          startDateControllerSpecialSchedule.clear();
                          endDateControllerSpecialSchedule.clear();
                          Get.back();
                        }else if(startDateControllerSpecialSchedule.text.isNotEmpty || endDateControllerSpecialSchedule.text.isNotEmpty){
                          auditorControllerSpecialSchedule.clear();
                          controllerAuditArea.loadSpecialSchedulesAuditArea();
                          branchControllerSpecialSchedule.clear();
                          startDateControllerSpecialSchedule.clear();
                          endDateControllerSpecialSchedule.clear();
                          Get.back();
                        }else{
                          Get.snackbar('Alert', 'Reset data filter gagal', backgroundColor: CustomColors.red, 
                          colorText: CustomColors.white, snackPosition: SnackPosition.TOP);
                        }
                      },
                        icon: const Icon(Icons.refresh_rounded, color: CustomColors.grey, size: 25)
                      ),
                  ],
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
                        startDateControllerSpecialSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
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
                        endDateControllerSpecialSchedule.text = DateFormat('yyyy-MM-dd').format(picked);
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
                        controllerAuditArea.filterSpecialSchedulesAuditArea(startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text,
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

void bottomSheetFilterReschedule(BuildContext context, 
TextEditingController auditorControllerReschedule, TextEditingController branchControllerReschedule, 
TextEditingController startDateControllerReschedule, TextEditingController endDateControllerReschedule, ControllerAuditArea controllerAuditArea){

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
                    actions: [
                    IconButton(
                      onPressed: (){
                      if (auditorControllerReschedule.text.isNotEmpty) {
                          auditorControllerReschedule.clear();
                          controllerAuditArea.loadReschedulesAuditArea();
                          branchControllerReschedule.clear();
                          startDateControllerReschedule.clear();
                          endDateControllerReschedule.clear();
                          Get.back();
                        }else if(branchControllerReschedule.text.isNotEmpty){
                          auditorControllerReschedule.clear();
                          controllerAuditArea.loadReschedulesAuditArea();
                          branchControllerReschedule.clear();
                          startDateControllerReschedule.clear();
                          endDateControllerReschedule.clear();
                          Get.back();
                        }else if(startDateControllerReschedule.text.isNotEmpty || endDateControllerReschedule.text.isNotEmpty){
                          auditorControllerReschedule.clear();
                          controllerAuditArea.loadReschedulesAuditArea();
                          branchControllerReschedule.clear();
                          startDateControllerReschedule.clear();
                          endDateControllerReschedule.clear();
                          Get.back();
                        }else{
                          Get.snackbar('Alert', 'Reset data filter gagal', backgroundColor: CustomColors.red, 
                          colorText: CustomColors.white, snackPosition: SnackPosition.TOP);
                        }
                      },
                        icon: const Icon(Icons.refresh_rounded, color: CustomColors.grey, size: 25)
                      ),
                  ],
                    
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
                        startDateControllerReschedule.text = DateFormat('yyyy-MM-dd').format(picked);
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
                        endDateControllerReschedule.text = DateFormat('yyyy-MM-dd').format(picked);
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
                        controllerAuditArea.filterReschedulesAuditArea(startDateControllerReschedule.text, endDateControllerReschedule.text,
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