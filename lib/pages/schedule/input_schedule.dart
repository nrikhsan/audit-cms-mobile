import 'package:audit_cms/data/core/response/auditArea/master/response_auditor_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/form_input_add_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/auditArea/controller_audit_area.dart';
import '../../helper/styles/custom_styles.dart';


//audit area
//main schedule
class InputDataSchedulesPageMainSchedule extends StatefulWidget {
  const InputDataSchedulesPageMainSchedule({super.key});

  @override
  State<InputDataSchedulesPageMainSchedule> createState() => _InputDataSchedulesPageMainScheduleState();
}

class _InputDataSchedulesPageMainScheduleState extends State<InputDataSchedulesPageMainSchedule> {

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();
  final TextEditingController scheduleDescControllerMainSchedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.find();

  ModelListAuditorAuditArea? auditor;
  ModelListBranchAuditArea? branch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Input jadwal utama'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded,
                  color: CustomColors.black, size: 25)
          )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
              Text('Mulai dari :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAddScheduleStartDate(context, startDateControllerMainSchedule),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAddScheduleEndDate(context, endDateControllerMainSchedule),

              const SizedBox(height: 15),
              Text('Pilih auditor :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
              SizedBox(
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
                        value: auditor,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.auditorAuditArea.map((ModelListAuditorAuditArea auditor){
                            return DropdownMenuItem(
                              value: auditor,
                                child: Text('${auditor.auditorName}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                          setState(() {
                            auditor = value;
                          });
                          }
                      ),
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
              SizedBox(
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
                          value: branch,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((ModelListBranchAuditArea branch){
                            return DropdownMenuItem(
                              value: branch,
                              child: Text('${branch.branchName}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              branch = value;
                            });
                          }
                      ),
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Uraian jadwal :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputDescriptionSchedule(scheduleDescControllerMainSchedule),

              const SizedBox(height: 25),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('List jadwal', style: CustomStyles.textMedium15Px),
                      TextButton(
                          style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton
                          ),
                          onPressed: ()async{
                            if (auditor == null || branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP, 
                              colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{
                              
                              controllerAuditArea.addLocalDataMainSchedule(auditor!.id!, branch!.id!, auditor!.auditorName!, branch!.branchName!,
                              startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, scheduleDescControllerMainSchedule.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${branch!.branchName}, ${startDateControllerMainSchedule.text}, ${endDateControllerMainSchedule.text}, ${scheduleDescControllerMainSchedule.text}');
                            }
                          },
                          child: Text('Tambah jadwal', style: CustomStyles.textBoldGreen13Px))
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Auditor', style: CustomStyles.textMedium13Px),
                      Text('Cabang', style: CustomStyles.textMedium13Px),
                      Text('Action', style: CustomStyles.textMedium13Px),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalMainSchedulesAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalMainSchedulesAuditArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data.userName!.auditorName}', style: CustomStyles.textRegular13Px),
                            Text('${data.branchName!.branchName}', style: CustomStyles.textRegular13Px),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                controllerAuditArea.deleteLocalDataMainSchedule(data.userId!);
                              },
                            )
                          ],
                        );
                      }
                  )),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: 250,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue
                        ),
                        onPressed: ()async{

                          if (auditor == null || branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                              Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                          controllerAuditArea.addMainSchedules();
                          Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP, 
                          colorText: CustomColors.white, backgroundColor: CustomColors.green);
                          print('Buat jadwal : ${auditor!.id}, ${branch!.id}, ${startDateControllerMainSchedule.text}, ${endDateControllerMainSchedule.text}, ${scheduleDescControllerMainSchedule.text}');
                          Navigator.pop(context);
                          }
                        },
                        child: Text('Buat jadwal utama', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//special schedule
class InputDataSchedulePageSpecialSchedule extends StatefulWidget {
  const InputDataSchedulePageSpecialSchedule({super.key});

  @override
  State<InputDataSchedulePageSpecialSchedule> createState() => _InputDataSchedulePageSpecialScheduleState();
}

class _InputDataSchedulePageSpecialScheduleState extends State<InputDataSchedulePageSpecialSchedule> {

  final TextEditingController startDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController endDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController scheduleDescControllerSpecialSchedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.find();

  ModelListAuditorAuditArea? auditor;
  ModelListBranchAuditArea? branch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Input jadwal khusus'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded,
                  color: CustomColors.black, size: 25)
          )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
              Text('Mulai dari :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAddScheduleStartDate(context, startDateControllerSpecialSchedule),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAddScheduleEndDate(context, endDateControllerSpecialSchedule),

              const SizedBox(height: 15),
              Text('Pilih auditor :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
              SizedBox(
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
                          value: auditor,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.auditorAuditArea.map((ModelListAuditorAuditArea auditor){
                            return DropdownMenuItem(
                              value: auditor,
                              child: Text('${auditor.auditorName}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              auditor = value;
                            });
                          }
                      ),
                    )
                ),
              ),


              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
              SizedBox(
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
                          value: branch,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((ModelListBranchAuditArea branch){
                            return DropdownMenuItem(
                              value: branch,
                              child: Text('${branch.branchName}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              branch = value;
                            });
                          }
                      ),
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Uraian jadwal :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputDescriptionSchedule(scheduleDescControllerSpecialSchedule),

              const SizedBox(height: 25),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('List jadwal', style: CustomStyles.textMedium15Px),
                      TextButton(
                          style: TextButton.styleFrom(
                              shape: CustomStyles.customRoundedButton
                          ),
                          onPressed: ()async{
                            if (auditor == null || branch == null || startDateControllerSpecialSchedule.text.isEmpty || endDateControllerSpecialSchedule.text.isEmpty || scheduleDescControllerSpecialSchedule.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP,
                                  colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{

                              controllerAuditArea.addLocalDataSpecialSchedule(auditor!.id!, branch!.id!, auditor!.auditorName!, branch!.branchName!,
                                  startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text, scheduleDescControllerSpecialSchedule.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${branch!.branchName}, ${startDateControllerSpecialSchedule.text}, ${endDateControllerSpecialSchedule.text}, ${scheduleDescControllerSpecialSchedule.text}');
                            }
                          },
                          child: Text('Tambah jadwal', style: CustomStyles.textBoldGreen13Px))
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Auditor', style: CustomStyles.textMedium13Px),
                      Text('Cabang', style: CustomStyles.textMedium13Px),
                      Text('Action', style: CustomStyles.textMedium13Px),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalSpecialSchedulesAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalSpecialSchedulesAuditArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data.userName!.auditorName}', style: CustomStyles.textRegular13Px),
                            Text('${data.branchName!.branchName}', style: CustomStyles.textRegular13Px),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                controllerAuditArea.deleteLocalDataSpecialSchedule(data.userId!);
                              },
                            )
                          ],
                        );
                      }
                  )),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: 250,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                            backgroundColor: CustomColors.blue
                        ),
                        onPressed: ()async{

                          if (auditor == null || branch == null || startDateControllerSpecialSchedule.text.isEmpty || endDateControllerSpecialSchedule.text.isEmpty || scheduleDescControllerSpecialSchedule.text.isEmpty) {
                            Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                            controllerAuditArea.addSpecialSchedules();
                            Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.green);
                            print('Buat jadwal : ${auditor!.id}, ${branch!.id}, ${startDateControllerSpecialSchedule.text}, ${endDateControllerSpecialSchedule.text}, ${scheduleDescControllerSpecialSchedule.text}');
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Buat jadwal khusus', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//reschedule
class InputDataReschedulePage extends StatefulWidget {
  final int rescheduleId;
  const InputDataReschedulePage({super.key, required this.rescheduleId});

  @override
  State<InputDataReschedulePage> createState() => _InputDataReschedulePageState();
}

class _InputDataReschedulePageState extends State<InputDataReschedulePage> {

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();
  final TextEditingController scheduleDescControllerReschedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.find();

  ModelListAuditorAuditArea? auditor;
  ModelListBranchAuditArea? branch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Request reschedule'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded,
                  color: CustomColors.black, size: 25)
          )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
              Text('Mulai dari :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAddScheduleStartDate(context, startDateControllerReschedule),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputAddScheduleEndDate(context, endDateControllerReschedule),

              const SizedBox(height: 15),
              Text('Pilih auditor :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
              SizedBox(
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
                          value: auditor,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.auditorAuditArea.map((ModelListAuditorAuditArea auditor){
                            return DropdownMenuItem(
                              value: auditor,
                              child: Text('${auditor.auditorName}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              auditor = value;
                            });
                          }
                      ),
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
              SizedBox(
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
                          value: branch,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((ModelListBranchAuditArea branch){
                            return DropdownMenuItem(
                              value: branch,
                              child: Text('${branch.branchName}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              branch = value;
                            });
                          }
                      ),
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Uraian jadwal :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputDescriptionSchedule(scheduleDescControllerReschedule),

              const SizedBox(height: 25),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('List jadwal', style: CustomStyles.textMedium15Px),
                      TextButton(
                          style: TextButton.styleFrom(
                              shape: CustomStyles.customRoundedButton
                          ),
                          onPressed: ()async{
                            if (auditor == null || branch == null || startDateControllerReschedule.text.isEmpty || endDateControllerReschedule.text.isEmpty || scheduleDescControllerReschedule.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP,
                                  colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{

                              controllerAuditArea.addLocalDataReschedule(auditor!.id!, branch!.id!, auditor!.auditorName!, branch!.branchName!,
                                  startDateControllerReschedule.text, endDateControllerReschedule.text, scheduleDescControllerReschedule.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${branch!.branchName}, ${startDateControllerReschedule.text}, ${endDateControllerReschedule.text}, ${scheduleDescControllerReschedule.text}');
                            }
                          },
                          child: Text('Tambah jadwal', style: CustomStyles.textBoldGreen13Px))
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Auditor', style: CustomStyles.textMedium13Px),
                      Text('Cabang', style: CustomStyles.textMedium13Px),
                      Text('Action', style: CustomStyles.textMedium13Px),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalReschedulesAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalReschedulesAuditArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data.userName!.auditorName}', style: CustomStyles.textRegular13Px),
                            Text('${data.branchName!.branchName}', style: CustomStyles.textRegular13Px),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                controllerAuditArea.deleteLocalDataReschedule(data.userId!);
                              },
                            )
                          ],
                        );
                      }
                  )),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: 250,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                            backgroundColor: CustomColors.blue
                        ),
                        onPressed: ()async{

                          if (auditor == null || branch == null || startDateControllerReschedule.text.isEmpty || endDateControllerReschedule.text.isEmpty || scheduleDescControllerReschedule.text.isEmpty) {
                            Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                            controllerAuditArea.addReschedules();
                            Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.green);
                            print('Buat jadwal : ${auditor!.id}, ${branch!.id}, ${startDateControllerReschedule.text}, ${endDateControllerReschedule.text}, ${scheduleDescControllerReschedule.text}');
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Request reschedule', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


