
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:audit_cms/pages/kka/detail_kka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


//audit area
class KkaPageAuditArea extends StatefulWidget {
  const KkaPageAuditArea({super.key});

  @override
  State<KkaPageAuditArea> createState() => _KkaPageAuditAreaState();
}

class _KkaPageAuditAreaState extends State<KkaPageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Kertas kerja audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
        actions: [
          IconButton(onPressed: (){
                showFilterKkaAuditArea(context);
              }, 
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),

      body: Obx((){
        if (controllerAuditArea.isLoading.value) {
            return const Center(
              child: SpinKitCircle(color: CustomColors.blue),
            );
        }else{
          return ListView.builder(
            itemCount: controllerAuditArea.kkaAuditArea.length,
            itemBuilder: (_, index){
              final kka = controllerAuditArea.kkaAuditArea[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => KkaDetailAuditArea(id: kka.id!)));
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
                            Text('Auditor : ${kka.auditor}', style: CustomStyles.textBold15Px),
                            Text('${kka.dateKka}', style: CustomStyles.textBold13Px)
                          ],
                        ),

                        const SizedBox(height: 5),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cabang : ${kka.branch}', style: CustomStyles.textMedium13Px),
                            Text('Area : ${kka.area}', style: CustomStyles.textMedium13Px),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            );
          },
        );
      }
    }),
  );
}
  
  void showFilterKkaAuditArea(BuildContext context) {
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
                title: const Text('Filter data KKA'),
                titleSpacing: 5,
                titleTextStyle: CustomStyles.textBold18Px,
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  }, 
                  icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                ),
              ),

              const SizedBox(height: 20),

              Text('Dengan auditor :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              
              TextField(
                  cursorColor: CustomColors.blue,
                  controller: auditorController,
                  onChanged: (auditor) => auditorController.text = auditor,
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

                  TextField(
                    cursorColor: CustomColors.blue,
                    onChanged: (branch) => branchController.text = branch,
                    controller: branchController,
                    decoration: InputDecoration(
                      label: const Text('Cabang...'),
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
                Text('Dengan tanggal :', style: CustomStyles.textMedium15Px),
                const SizedBox(height: 15),

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
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue
                          ),
                          onPressed: (){
                            controllerAuditArea.getFilterKkaAuditArea(startDateController.text, endDateController.text, auditorController.text, branchController.text);
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
class KkaPageAuditRegion extends StatefulWidget {
  const KkaPageAuditRegion({super.key});

  @override
  State<KkaPageAuditRegion> createState() => _KkaPageAuditRegionState();
}

class _KkaPageAuditRegionState extends State<KkaPageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Kertas kerja audit'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
          Get.offAll(() => BotNavAuditRegion());
        }, icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
        actions: [
          IconButton(onPressed: (){
                showFilterKkaAuditRegion(context);
              }, 
            icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)
          )
        ],
      ),

      body: Obx((){
        if (controllerAuditRegion.isLoading.value) {
            return const Center(
              child: SpinKitCircle(color: CustomColors.blue),
            );
        }else{
          return ListView.builder(
            itemCount: controllerAuditRegion.kkaAuditRegion.length,
            itemBuilder: (_, index){
              final kka = controllerAuditRegion.kkaAuditRegion[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => KkaDetailAuditRegion(id: kka.id!));
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
                            Text('Auditor : ${kka.auditor}', style: CustomStyles.textBold15Px),
                            Text('${kka.dateKka}', style: CustomStyles.textBold13Px)
                          ],
                        ),

                        const SizedBox(height: 5),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cabang : ${kka.branch}', style: CustomStyles.textMedium13Px),
                            Text('Area : ${kka.area}', style: CustomStyles.textMedium13Px),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            );
          },
        );
      }
    }),
  );
  }

  void showFilterKkaAuditRegion(BuildContext context) {
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
                title: const Text('Filter data KKA'),
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
                                controllerAuditRegion.loadKkaAuditRegion();
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
                                controllerAuditRegion.filterKkaAuditRegion(startDateController.text, endDateController.text);
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