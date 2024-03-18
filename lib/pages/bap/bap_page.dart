

import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/detail_bap_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//audit area
class BapAuditAreaPage extends StatefulWidget {
  const BapAuditAreaPage({super.key});

  @override
  State<BapAuditAreaPage> createState() => _BapAuditAreaPageState();
}

class _BapAuditAreaPageState extends State<BapAuditAreaPage> {

  final ControllerAuditArea controllerAuditArea = Get.find();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BAP'),
        titleTextStyle: CustomStyles.textBold18Px,
        titleSpacing: 5,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
        actions: [
          IconButton(
            onPressed: (){
              showFilterBapAuditArea();
            },
           icon: const Icon(Icons.tune_rounded, size: 25, color: CustomColors.grey)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx((){
          if (controllerAuditArea.isLoading.value) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          }else{
            return ListView.builder(
              itemCount: controllerAuditArea.bapAuditArea.length,
              itemBuilder: (_, index){
                final bap = controllerAuditArea.bapAuditArea[index];
                return GestureDetector(
                  child: Card(
                    elevation: 0,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: CustomColors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Auditor : ${bap.auditor}', style: CustomStyles.textBold15Px),
                              Text('${bap.dateBap}', style: CustomStyles.textMedium15Px),
                            ],
                          ),
                          const SizedBox(height: 15),

                          Text('No. Klarifikasi : ${bap.noClarification}', style: CustomStyles.textMedium13Px),
                          Text('No. BAP : ${bap.noBap}', style: CustomStyles.textMedium13Px),
                          
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailBapPageAuditArea(id: bap.id!)));
                  },
                );
              }
            );
          }
        }),
      ),
    );
  }
  
  void showFilterBapAuditArea() {
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

                  TextField(
                    cursorColor: CustomColors.blue,
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
                  Obx(() => controllerAuditArea.filterIsActive.value
                    ? SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                          ),
                          onPressed: (){
                            controllerAuditArea.loadBapAuditArea();
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
                            controllerAuditArea.filterBapAuditArea(startDateController.text, endDateController.text, auditorController.text, branchController.text);
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
class BapAuditRegionPage extends StatefulWidget {
  const BapAuditRegionPage({super.key});

  @override
  State<BapAuditRegionPage> createState() => _BapAuditRegionPageState();
}

class _BapAuditRegionPageState extends State<BapAuditRegionPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}