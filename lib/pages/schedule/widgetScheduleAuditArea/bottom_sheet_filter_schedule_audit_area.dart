
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void bottomSheetFilterMainSchedule(BuildContext context, 
TextEditingController auditorControllerMainSchedule, 
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
                        controllerAuditArea.resetFilterMainSchedule();
                        auditorControllerMainSchedule.clear();
                        startDateControllerMainSchedule.clear();
                        endDateControllerMainSchedule.clear();
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
                  Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          )
                      ),
                      child: DropdownButton(
                          iconEnabledColor: CustomColors.blue,
                          borderRadius: BorderRadius.circular(10),
                          value: controllerAuditArea.branchIdMainSchedule.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchIdMainSchedule.value = value;
                            print(controllerAuditArea.branchIdMainSchedule.value);
                          }
                      ),
                    )
                ),
              )),
                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
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

                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        controllerAuditArea.filterMainSchedule(
                          auditorControllerMainSchedule.text, controllerAuditArea.branchIdMainSchedule.value, 
                          startDateControllerMainSchedule.text, endDateControllerMainSchedule.text);
                        
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
TextEditingController auditorControllerSpecialSchedule, 
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
                        controllerAuditArea.resetFilterSpecialSchedule();
                        auditorControllerSpecialSchedule.clear();
                        startDateControllerSpecialSchedule.clear();
                        endDateControllerSpecialSchedule.clear();
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
                  Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          )
                      ),
                      child: DropdownButton(
                          iconEnabledColor: CustomColors.blue,
                          borderRadius: BorderRadius.circular(10),
                          value: controllerAuditArea.branchSpecialSchedule.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchSpecialSchedule.value = value;
                            print(controllerAuditArea.branchSpecialSchedule.value);
                          }
                      ),
                    )
                ),
              )),
                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
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

                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                       controllerAuditArea.filterSpecialSchedule(
                        auditorControllerSpecialSchedule.text, 
                        controllerAuditArea.branchSpecialSchedule.value,
                        startDateControllerSpecialSchedule.text,
                        endDateControllerSpecialSchedule.text
                        );
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
TextEditingController auditorControllerReschedule, 
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
                      controllerAuditArea.resetFilterReschedule();
                        auditorControllerReschedule.clear();
                        startDateControllerReschedule.clear();
                        endDateControllerReschedule.clear();
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
                  Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          )
                      ),
                      child: DropdownButton(
                          iconEnabledColor: CustomColors.blue,
                          borderRadius: BorderRadius.circular(10),
                          value: controllerAuditArea.branchReschedule.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchReschedule.value = value;
                            
                          }
                      ),
                    )
                ),
              )),
                  const SizedBox(height: 15),
                  Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
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

                 const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        controllerAuditArea.filterReschedule(auditorControllerReschedule.text, controllerAuditArea.branchReschedule.value, 
                        startDateControllerReschedule.text, endDateControllerReschedule.text);
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