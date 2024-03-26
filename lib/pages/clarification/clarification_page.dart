import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/clarification/detail_clarfication.dart';
import 'package:audit_cms/pages/clarification/input_clarification_page_audit_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//audit area
class ClarificationPageAuditArea extends StatefulWidget {
  const ClarificationPageAuditArea({super.key});

  @override
  State<ClarificationPageAuditArea> createState() =>
      _ClarificationPageAuditAreaState();
}

class _ClarificationPageAuditAreaState extends State<ClarificationPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.find();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded, size: 25, color: CustomColors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  showDialogFilterClarificationAuditArea();
                },
                icon: const Icon(Icons.tune_rounded,size: 25, color: CustomColors.grey)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Obx(() {
                if (controllerAuditArea.isLoading.value) {
                  return const Center(child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  return Column(
                    children: [
                      ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.clarificationAuitArea.length,
                      itemBuilder: (_, index) {
                        final clarification = controllerAuditArea.clarificationAuitArea[index];
                        return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailClarificationPageAuditArea(id: clarification.id!)));
                  },
                  child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: CustomColors.grey
                    )
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                
                                Text('${clarification.auditor}', style: CustomStyles.textBold15Px),
                                const SizedBox(width: 10),
                                Icon(clarification.statusClarification == 1 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 15),
                              ],
                            ),
                            Text('${clarification.noDocument}', style: CustomStyles.textBold13Px),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Prioritas temuan : ${clarification.findingPriority}', style: CustomStyles.textMedium13Px),
                            Text('Cabang : ${clarification.branch}', style: CustomStyles.textMedium13Px),
                            Text('Batas evaluasi : ${clarification.limitEvaluation}', style: CustomStyles.textMedium13Px),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
                      })
                    ],
                  );
                }
              })
            ],
          ),
        ));
  }
  
  void showDialogFilterClarificationAuditArea() {
    showModalBottomSheet(
      backgroundColor: CustomColors.white,
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50
          ),
          
          width: double.maxFinite,
          child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  AppBar(
                      backgroundColor: CustomColors.white,
                      title: const Text('Filter data klarifikasi'),
                      titleTextStyle: CustomStyles.textBold18Px,
                      leading: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                        icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                      ),
                      actions: [
                    IconButton(
                      onPressed: (){
                      if (auditorController.text.isNotEmpty) {
                          auditorController.clear();
                          controllerAuditArea.loadClarificationAuditArea();
                          branchController.clear();
                          startDateController.clear();
                          endDateController.clear();
                          Get.back();
                        }else if(branchController.text.isNotEmpty){
                          auditorController.clear();
                          controllerAuditArea.loadClarificationAuditArea();
                          branchController.clear();
                          startDateController.clear();
                          endDateController.clear();
                          Get.back();
                        }else if(startDateController.text.isNotEmpty || endDateController.text.isNotEmpty){
                          auditorController.clear();
                          controllerAuditArea.loadClarificationAuditArea();
                          branchController.clear();
                          startDateController.clear();
                          endDateController.clear();
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
                    const SizedBox(height: 20),

                    TextField(
                      controller: auditorController,
                      onChanged: (auditor) => auditorController.text = auditor,
                      cursorColor: CustomColors.blue,
                      decoration: InputDecoration(
                        hintText: 'Auditor...',
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey
                          )
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: branchController,
                      onChanged: (branch) => branchController.text = branch,
                      cursorColor: CustomColors.blue,
                      decoration: InputDecoration(
                        hintText: 'Cabang...',
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey
                          )
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: startDateController,
                      onChanged: (startDate) => startDateController.text = startDate,
                      readOnly: true,
                      cursorColor: CustomColors.blue,
                      decoration: InputDecoration(
                        hintText: 'Mulai dari...',
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        suffixIcon: const Icon(Icons.date_range_rounded, color: CustomColors.lightGrey, size: 25),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey
                          )
                        ),
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

                          if (picked != null) {
                            setState(() {
                              startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                            });
                          }
                      },
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: endDateController,
                      onChanged: (endDate) => endDateController.text = endDate,
                      readOnly: true,
                      cursorColor: CustomColors.blue,
                      decoration: InputDecoration(
                        hintText: 'Sampai dengan...',
                        hintStyle: CustomStyles.textMediumGrey15Px,
                        suffixIcon: const Icon(Icons.date_range_rounded, color: CustomColors.lightGrey, size: 25),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.lightGrey
                          )
                        ),
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

                          if (picked != null) {
                           setState(() {
                              endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
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
                            controllerAuditArea.filterClarificationAuditArea(startDateController.text, endDateController.text, auditorController.text, branchController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
                  )

                  ],
                ),
              ),
        );
      }
    );
  }
}

//audit region
class ClarificationPageAuditRegion extends StatefulWidget {
  const ClarificationPageAuditRegion({super.key});

  @override
  State<ClarificationPageAuditRegion> createState() =>
      _ClarificationPageAuditRegionState();
}

class _ClarificationPageAuditRegionState extends State<ClarificationPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Get.offAll(() => BotNavAuditRegion());
              },
              icon: const Icon(Icons.arrow_back_rounded, size: 25, color: CustomColors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  showBottomSheetFilterClarificationAuditRegion();
                },
                icon: const Icon(Icons.tune_rounded,size: 25, color: CustomColors.grey)),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Obx(() {
                if (controllerAuditRegion.isLoading.value) {
                  return const Center(child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  return Column(
                    children: [
                      ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAuditRegion.clarificationAuditRegion.length,
                      itemBuilder: (_, index) {
                        final clarification = controllerAuditRegion.clarificationAuditRegion[index];
                        return GestureDetector(
                           onTap: (){
                              Get.to(() => InputClarificationPageAuditRegion(id: clarification.id!));
                          },
                  child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: CustomColors.grey
                    )
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            clarification.statusClarification == 1 
                            ? const Icon(Icons.notifications_rounded, color: CustomColors.red, size: 15)
                            : const SizedBox(height: 0)
                          ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${clarification.noDocument}', style: CustomStyles.textBold15Px),
                            IconButton(
                              onPressed: (){
                                showDialogMoreOption(clarification.id!);
                              }, 
                              icon: const Icon(Icons.more_vert_rounded, color: CustomColors.grey, size: 25)
                            )
                        ],),
                        Row(
                          children: [
                            Text('${clarification.noClarification}', style: CustomStyles.textBold13Px),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
                      })
                    ],
                  );
                }
              })
            ],
          ),
        ));
  }
  
  void showBottomSheetFilterClarificationAuditRegion() {
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
                    controller: startDateController,
                    onChanged: (startDate) => startDateController.text = startDate,
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
                          startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),


                  const SizedBox(height: 10),
                  TextField(
                    readOnly: true,
                    controller: endDateController,
                    onChanged: (endDate) => endDateController.text = endDate,
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
                          endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                  
                  Wrap(
                    children: [
                    startDateController.text.isNotEmpty || endDateController.text.isNotEmpty
                    ? SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.red
                      ),
                      onPressed: (){
                        startDateController.clear();
                        endDateController.clear();
                        controllerAuditRegion.loadClarificationAuditRegion();
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
                        controllerAuditRegion.filterClarificationAuditArea(startDateController.text, endDateController.text);
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
  
  void showDialogMoreOption(int id) {
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Action', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CustomStyles.customRoundedButton,
                      backgroundColor: CustomColors.blue
                    ),
                    onPressed: (){
                      Get.to(() => DetailClarificationAuditRegion(id: id));
                    }, 
                    child: Text('Detail klarifikasi', style: CustomStyles.textMediumWhite15Px)
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CustomStyles.customRoundedButton,
                      backgroundColor: CustomColors.red
                    ),
                    onPressed: (){
                      Get.back();
                    }, 
                    child: Text('Kembali', style: CustomStyles.textMediumWhite15Px)
                  ),
                )
              ],
            )
          ],
        );
      }
    );
  }
}
