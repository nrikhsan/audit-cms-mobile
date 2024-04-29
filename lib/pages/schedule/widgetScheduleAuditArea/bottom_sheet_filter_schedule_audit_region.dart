
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void bottomSheetFilterMainScheduleAuditRegion(BuildContext context, TextEditingController startDateControllerMainSchedule, TextEditingController endDateControllerMainSchedule, 
ControllerAuditRegion controllerAuditRegion){
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
                        controllerAuditRegion.resetfilterMainSchedule();
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
                        controllerAuditRegion.filterMainSchedule(startDateControllerMainSchedule.text, endDateControllerMainSchedule.text);
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

void bottomSheetFilterSpecialScheduleAuditRegion(BuildContext context, TextEditingController startDateControllerSpecialSchedule, TextEditingController endDateControllerSpecialSchedule, 
ControllerAuditRegion controllerAuditRegion){
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
                        controllerAuditRegion.resetfilterSpecialSchedule();
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
                        controllerAuditRegion.filterSpecialSchedule(startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text);
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

void bottomSheetFilterRescheduleAuditRegion(BuildContext context, TextEditingController startDateControllerReschedule, TextEditingController endDateControllerReschedule, 
ControllerAuditRegion controllerAuditRegion){
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
                        controllerAuditRegion.resetFilterReschedule();
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
                        controllerAuditRegion.filterReschedule(startDateControllerReschedule.text, endDateControllerReschedule.text);
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