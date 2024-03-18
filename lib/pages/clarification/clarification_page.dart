import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/detail_clarfication.dart';
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
  final ControllerAuditArea controllerAllData = Get.find();

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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('No Dokumen', style: CustomStyles.textBold15Px),
                  Text('Tanggal berlaku', style: CustomStyles.textBold15Px),
                  Text('Action', style: CustomStyles.textBold15Px),
                ],
              ),
              Obx(() {
                if (controllerAllData.isLoading.value) {
                  return const Center(
                      child: SpinKitCircle(color: CustomColors.blue));
                } else {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAllData.clarificationAuitArea.length,
                      itemBuilder: (_, index) {
                        final clarification = controllerAllData.clarificationAuitArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${clarification.noClarification}',style: CustomStyles.textMedium13Px),
                            Text('${clarification.clarificationDate}',style: CustomStyles.textMedium13Px),

                            TextButton(
                              style: TextButton.styleFrom(
                                shape: CustomStyles.customRoundedButton,
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailClarificationPageAuditArea(id: clarification.id!)));
                              },
                             child: Text('Lihat', style: CustomStyles.textMediumBlue13Px)
                             )
                          ],
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
          height: 500,
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
                        icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)),
                  ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: auditorController,
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
                            startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                          }
                      },
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: endDateController,
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
                            controllerAllData.loadClarificationAuditArea();
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
                            controllerAllData.filterClarificationAuditArea(startDateController.text, endDateController.text, auditorController.text, branchController.text);
                            Get.back();
                          },
                          child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                      )
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

class _ClarificationPageAuditRegionState
    extends State<ClarificationPageAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
