import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/lha/detail_lha.dart';
import 'package:audit_cms/pages/lha/edit_lha_page_audit_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//audit area
class LhaPageAuditArea extends StatefulWidget {
  const LhaPageAuditArea({super.key});

  @override
  State<LhaPageAuditArea> createState() => _LhaPageAuditAreaState();
}

class _LhaPageAuditAreaState extends State<LhaPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
          actions: [
            IconButton(
            onPressed: (){
                showDialogFilterLhaAuditArea();
            },
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),
      body: Obx(() {
        if (controllerAuditArea.isLoading.isTrue) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        } else {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: controllerAuditArea.lhaAuditArea.length,
                itemBuilder: (_, index) {
                  final lha = controllerAuditArea.lhaAuditArea[index];
                  return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(lha.research == 1 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 20),
                                  Text('${lha.inputDate}',
                                      style: CustomStyles.textBold15Px),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text('Auditor : ${lha.auditor}',
                                  style: CustomStyles.textMedium15Px),
                              const SizedBox(height: 5),
                              Text('Cabang : ${lha.branch}',
                                  style: CustomStyles.textMedium15Px),
                              const SizedBox(height: 5),
                              Text('Area : ${lha.area}',
                                  style: CustomStyles.textMedium15Px),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.green),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => EditLhaPageAuditArea(id: lha.id!, lhaDescription: lha.lhaDescription!)));
                                      },
                                      child: Text('Edit',
                                          style: CustomStyles
                                              .textMediumWhite15Px)),
                                  const SizedBox(width: 5),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    DetailLhaPageAuditArea(id: lha.id!)));
                                      },
                                      child: Text('Lihat rincian',
                                          style:
                                              CustomStyles.textMediumWhite15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                }),
          );
        }
      }),
    );
  }
  
  void showDialogFilterLhaAuditArea() {
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
                    title: const Text('Filter data LHA'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),

                    actions: [
                    IconButton(
                      onPressed: (){
                      if (auditorController.text.isNotEmpty) {
                          auditorController.clear();
                          controllerAuditArea.loadLhaAuditArea();
                          branchController.clear();
                          startDateController.clear();
                          endDateController.clear();
                          Get.back();
                        }else if(branchController.text.isNotEmpty){
                          auditorController.clear();
                          controllerAuditArea.loadLhaAuditArea();
                          branchController.clear();
                          startDateController.clear();
                          endDateController.clear();
                          Get.back();
                        }else if(startDateController.text.isNotEmpty || endDateController.text.isNotEmpty){
                          auditorController.clear();
                          controllerAuditArea.loadLhaAuditArea();
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
                  const SizedBox(height: 25),

                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: auditorController,
                    onChanged: (auditor) => auditorController.text = auditor,
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
                    controller: branchController,
                    onChanged: (branch) => branchController.text = branch,
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

                  const SizedBox(height: 25),
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue
                          ),
                          onPressed: (){
                            controllerAuditArea.filterLhaAuditArea(startDateController.text, endDateController.text, auditorController.text, branchController.text);
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
}



//audit region
class LhaPageAuditRegion extends StatefulWidget {
  const LhaPageAuditRegion({super.key});

  @override
  State<LhaPageAuditRegion> createState() => _LhaPageAuditRegionState();
}

class _LhaPageAuditRegionState extends State<LhaPageAuditRegion> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Laporan harian audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.black, size: 25)),
          actions: [
            IconButton(
            onPressed: (){
                showFilterLhaAuditRegion(context);
            },
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),
      body: Obx(() {
        if (controllerAuditRegion.isLoading.value) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        } else {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: controllerAuditRegion.lhaAuditRegion.length,
                itemBuilder: (_, index) {
                  final lha = controllerAuditRegion.lhaAuditRegion[index];
                  return Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: CustomColors.grey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(lha.research == 0 ? Icons.notifications_rounded : null, color: CustomColors.red, size: 20),
                                  Text('${lha.inputDate}',
                                      style: CustomStyles.textBold15Px),
                                ],
                              ),
                              const SizedBox(height: 15),
                                Text('Cabang : ${lha.branch}',
                                    style: CustomStyles.textMedium15Px),
                                const SizedBox(height: 10),
                                Text('Kategori SOP : ${lha.sopCategory}',
                                    style: CustomStyles.textMedium15Px),

                                const SizedBox(height: 10),
                                Text('Tanggal LHA : ${lha.inputDate}',
                                    style: CustomStyles.textMedium15Px),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape:
                                              CustomStyles.customRoundedButton,
                                          backgroundColor: CustomColors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    DetailLhaPageAuditRegion(id: lha.id!)));
                                      },
                                      child: Text('Lihat rincian',
                                          style:
                                              CustomStyles.textMediumWhite15Px))
                                ],
                              )
                            ],
                          ),
                        ));
                }),
          );
        }
      }),
    );
  }

  void showFilterLhaAuditRegion(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: CustomColors.white,
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: CustomColors.white,
                title: const Text('Filter data LHA'),
                titleSpacing: 5,
                titleTextStyle: CustomStyles.textBold18Px,
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  }, 
                  icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                ),
              ),
              
              const SizedBox(height: 25),

                TextField(
                  readOnly: true,
                  controller: startDateController,
                  onChanged: (startDate) => startDateController.text = startDate,
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
                          setState(() {
                            startDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                          });
                      }
                    },
                  ),
                const SizedBox(height: 15),
                TextField(
                  readOnly: true,
                  controller: endDateController,
                  onChanged: (endDate) => endDateController.text = endDate,
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
                          setState(() {
                            endDateController.text = DateFormat('yyyy-MM-dd').format(picker);
                          });
                      }
                    },
                  ),

                  const SizedBox(height: 25),
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
                                
                                Get.back();
                            },
                              child: Text('Simpan data filter', style: CustomStyles.textMediumWhite15Px)
                          )
                        )
                    ]
                  )
                ],
              ),
            )
        );
      }
    );
  }
}
