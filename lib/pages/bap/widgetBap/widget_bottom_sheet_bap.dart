import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void showFilterBapAuditArea(BuildContext context, TextEditingController startDateController, TextEditingController endDateController, 
TextEditingController auditorController, ControllerAuditArea controllerAuditArea) {
    showModalBottomSheet(
      backgroundColor: CustomColors.white,
      elevation: 0,
      isScrollControlled: true,
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
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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

                actions: [
                    IconButton(
                      onPressed: (){
                        auditorController.clear();
                        startDateController.clear();
                        endDateController.clear();
                        controllerAuditArea.resetFilterBap();
                      },
                        icon: const Icon(Icons.refresh_rounded, color: CustomColors.grey, size: 25)
                      ),
                  ],
              ),

              const SizedBox(height: 20),

              Text('Dengan auditor :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              
              TextField(
                  cursorColor: CustomColors.blue,
                  controller: auditorController,
                  decoration: InputDecoration(
                    label: const Text('Auditor...'),
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: CustomColors.grey)),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                      )
                    )
                  ),

                  const SizedBox(height: 20),
                  Text('Dengan cabang :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),

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
                          value: controllerAuditArea.branchBap.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchBap.value = value;
                          }
                      ),
                    )
                ),
              )),
                
                const SizedBox(height: 20),
                Text('Dengan tanggal :', style: CustomStyles.textMedium15Px),
                const SizedBox(height: 15),

                TextField(
                  readOnly: true,
                  controller: startDateController,
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
                          startDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                      }
                    },
                  ),
                const SizedBox(height: 15),
                TextField(
                  readOnly: true,
                  controller: endDateController,
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
                          endDateController.text = DateFormat('yyyy-MM-dd').format(picker);
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
                            controllerAuditArea.filterBapAuditArea(auditorController.text, controllerAuditArea.branchBap.value, startDateController.text, endDateController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
                  )
            ],
          ),
          )
        );
      }
    );
  }