import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/follow_up/detail_follow_up.dart';
import 'package:audit_cms/pages/follow_up/input_follow_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


//audit area
class FollowUpPageAuditArea extends StatefulWidget {
  const FollowUpPageAuditArea({super.key});

  @override
  State<FollowUpPageAuditArea> createState() => _FollowUpPageAuditAreaState();
}

class _FollowUpPageAuditAreaState extends State<FollowUpPageAuditArea> {

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController auditorController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  final ControllerAuditArea controllerAllData = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Tindak lanjut'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)),
          actions: [
            IconButton(onPressed: (){
            showDialogfilter();
          },
          icon: const Icon(Icons.tune_rounded, color: CustomColors.grey, size: 25)),
          ],
      ),
      body: Obx((){
        
        if (controllerAllData.isLoading.value) {
          return const Center(child: SpinKitCircle(color: CustomColors.blue));
        }else{
          
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: controllerAllData.followUpArea.length,
              itemBuilder: (_, index){
                final followUp = controllerAllData.followUpArea[index];
                return Card(
                  elevation: 0,
                  color: CustomColors.white,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: CustomColors.grey
                    )
                  ),
                  child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No. dokumen : ${followUp.noDocument}', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('Auditor : ${followUp.auditor}', style: CustomStyles.textMedium13Px,),
                          const SizedBox(height: 5),
                          Text('Tanggal : ${followUp.dateFollowUp}', style: CustomStyles.textMedium13Px,),
                          ],
                        ),

                        IconButton(
                          onPressed: (){
                            showAlertFollowUpAuditArea(followUp.id);
                          },
                          icon: const Icon(Icons.more_vert_rounded, color: CustomColors.grey, size: 25)
                        )
                    ],
                  ),
                  ),
                );
              }
            ),
          );
        }
      }),
    );
  }
  
  void showAlertFollowUpAuditArea(int? id) {
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          elevation: 0,
          title: const Text('Tindak lanjut', textAlign: TextAlign.center),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
            Center(
              child: Column(
                children: [

                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.green
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const InputFollowUp()));
                      },
                      child: Text('Input tindak lanjut', style: CustomStyles.textMediumWhite15Px)
                     ),
                  ),

                  const SizedBox(height: 5),

                   SizedBox(
                    width: double.maxFinite,
                     child: TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailFollowUpPageAuditArea(id: id!)));
                      },
                      child: Text('Detail tindak lanjut', style: CustomStyles.textMediumWhite15Px)
                     ),
                   ),

                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.red
                      ),
                        onPressed: (){
                            Get.back();
                        },
                        child: Text('Kembali', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        );
      }
    );
  }
  
  void showDialogfilter() {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: CustomColors.white,
      context: context, 
      builder: (_){
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    title: const Text('Filter data tindak lanjut'),
                    titleTextStyle: CustomStyles.textBold18Px,
                    leading: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close_rounded, color: CustomColors.black, size: 25)
                    ),
                  ),

                  const SizedBox(height: 25),


                  Text('Dengan auditor', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  TextField(
                    controller: auditorController,
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_2_rounded,
                            color: CustomColors.grey, size: 20),
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
                    cursorColor: CustomColors.blue,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_2_rounded,
                            color: CustomColors.grey, size: 20),
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
                  Obx(() => controllerAllData.filterIsActive.value
                    ? SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                          ),
                          onPressed: (){
                            controllerAllData.loadFollowUpAuditArea();
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
                            controllerAllData.filterDataFollowUpAuditArea(startDateController.text, endDateController.text, auditorController.text, branchController.text);
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
class FollowUpPageAuditRegion extends StatefulWidget {
  const FollowUpPageAuditRegion({super.key});

  @override
  State<FollowUpPageAuditRegion> createState() => _FollowUpPageAuditRegionState();
}

class _FollowUpPageAuditRegionState extends State<FollowUpPageAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}