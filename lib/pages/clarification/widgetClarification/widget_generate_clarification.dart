import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void generateClarificationAuditArea(BuildContext context, ControllerAuditArea controllerAuditArea, TextEditingController branchEditingController,
TextEditingController caseEditingController, TextEditingController caseCategoryEditingController) {
    
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Generate klarifikasi', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<int>(
                        isExpanded: true,
                        hint: Text(
                          'Pilih Cabang',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controllerAuditArea.branchForFilterAuditArea
                            .map((branch) => DropdownMenuItem(
                                  value: branch.id,
                                  child: Text('${branch.name}', style: CustomStyles.textMedium13Px)
                                ))
                            .toList(),
                          value: controllerAuditArea.branchId.value,
                          onChanged: (value) {
                            controllerAuditArea.selectBranch(value);
                            
                          },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          width: 400,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 400,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: branchEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                              right: 5
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: branchEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Cari cabang...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            final nameBranch = controllerAuditArea.branchForFilterAuditArea.firstWhere((element) => element.id == item.value);
                            return nameBranch.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            branchEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih divisi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.caseAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: controllerAuditArea.caseId.value,
                    onChanged: (value) {
                        controllerAuditArea.selectCase(value);
                        controllerAuditArea.loadCaseCategory(value);
                        controllerAuditArea.caseCategoryId.value = null;
                      
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari divisi...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseName = controllerAuditArea.caseAuditArea.firstWhere((element) => element.id == item.value);
                        return caseName.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kategori SOP',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.caseCategory
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px, maxLines: 1, overflow: TextOverflow.ellipsis)
                            ))
                        .toList(),
                    value: controllerAuditArea.caseCategoryId.value,
                    onChanged: (value) {
                        controllerAuditArea.selectCaseCategory(value);
                      
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseCategoryEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseCategoryEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari kategori SOP...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseCategoryName = controllerAuditArea.caseCategory.firstWhere((element) => element.id == item.value);
                        return caseCategoryName.name!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseCategoryEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        if (controllerAuditArea.branchId.value == null || controllerAuditArea.caseId.value == null || controllerAuditArea.caseCategoryId.value == null) {
                          snackBarMessageRed('Alert', 'Tidak boleh ada field yang kosong');
                        } else {
                          controllerAuditArea.generateClarification();
                          resetValueGenerateAuditArea(controllerAuditArea);
                          Get.back();
                        }
                      }, 
                      child: Text('Generate', style: CustomStyles.textMediumGreen15Px)
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                       resetValueGenerateAuditArea(controllerAuditArea);
                      }, 
                      child: Text('Reset', style: CustomStyles.textMediumRed15Px)
                    )
                  ],
                )
              ],
            )
          ],
        );
      }
    );
  }

  
  void resetValueGenerateAuditArea(ControllerAuditArea controllerAuditArea){
    controllerAuditArea.branchId.value = null;
    controllerAuditArea.caseId.value = null;
    controllerAuditArea.caseCategoryId.value = null;
  }


 
  void generateClarificationAuditRegion(BuildContext context, ControllerAuditRegion controllerAuditRegion, TextEditingController branchEditingController,
TextEditingController caseEditingController, TextEditingController caseCategoryEditingController) {
    
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Generate klarifikasi', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<int>(
                        isExpanded: true,
                        hint: Text(
                          'Pilih Cabang',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controllerAuditRegion.branchAuditRegion
                            .map((branch) => DropdownMenuItem(
                                  value: branch.id,
                                  child: Text('${branch.name}', style: CustomStyles.textMedium13Px)
                                ))
                            .toList(),
                          value: controllerAuditRegion.branchId.value,
                          onChanged: (value) {
                            controllerAuditRegion.selectBranch(value);
                            
                          },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          width: 400,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 400,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: branchEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                              right: 5
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: branchEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Cari cabang...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            final nameBranch = controllerAuditRegion.branchAuditRegion.firstWhere((element) => element.id == item.value);
                            return nameBranch.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            branchEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih divisi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditRegion.caseAuditRegion
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: controllerAuditRegion.caseId.value,
                    onChanged: (value) {
                        controllerAuditRegion.selectCase(value);
                        controllerAuditRegion.loadCaseCategoryAuditRegion(value);
                        controllerAuditRegion.caseCategoryId.value = null;
                      
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari divisi...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseName = controllerAuditRegion.caseAuditRegion.firstWhere((element) => element.id == item.value);
                        return caseName.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih kategori SOP',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditRegion.caseCategory
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Text('${item.name}', style: CustomStyles.textMedium13Px, maxLines: 1, overflow: TextOverflow.ellipsis,))
                            ))
                        .toList(),
                    value: controllerAuditRegion.caseCategoryId.value,
                    onChanged: (value) {
                        controllerAuditRegion.selectCaseCategory(value);
                      
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 500,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 500,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: caseCategoryEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: caseCategoryEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari kategori SOP...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final caseCategoryName = controllerAuditRegion.caseCategory.firstWhere((element) => element.id == item.value);
                        return caseCategoryName.name!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        caseCategoryEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        if (controllerAuditRegion.branchId.value == null || controllerAuditRegion.caseId.value == null || controllerAuditRegion.caseCategoryId.value == null) {
                          snackBarMessageRed('Alert', 'Tidak boleh ada field yang kosong');
                        } else {
                          controllerAuditRegion.generateClarification();
                          resetValueGenerateAuditRegion(controllerAuditRegion);
                          Get.back();
                        }
                      }, 
                      child: Text('Generate', style: CustomStyles.textMediumGreen15Px)
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                       resetValueGenerateAuditRegion(controllerAuditRegion);
                      }, 
                      child: Text('Reset', style: CustomStyles.textMediumRed15Px)
                    )
                  ],
                )
              ],
            )
          ],
        );
      }
    );
  }

  void resetValueGenerateAuditRegion(ControllerAuditRegion controllerAuditRegion){
    controllerAuditRegion.branchId.value = null;
    controllerAuditRegion.caseId.value = null;
    controllerAuditRegion.caseCategoryId.value = null;
  }
