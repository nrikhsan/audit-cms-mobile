import 'package:audit_cms/data/core/response/auditArea/master/response_area_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_auditor_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  ModelListAreaAuditArea? area;
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
              TextField(
                readOnly: true,
                controller: startDateControllerMainSchedule,
                onChanged: (startDate) => startDateControllerMainSchedule.text = startDate,
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

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                readOnly: true,
                controller: endDateControllerMainSchedule,
                onChanged: (endDate) => endDateControllerMainSchedule.text = endDate,
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
              Text('Pilih area :', style: CustomStyles.textMedium15Px),
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
                          value: area,
                          hint: Text('Area', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.areaAuditArea.map((ModelListAreaAuditArea area){
                            return DropdownMenuItem(
                              value: area,
                              child: Text('${area.areaName}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              area = value;
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
              TextField(
                controller: scheduleDescControllerMainSchedule,
                onChanged: (desc) => scheduleDescControllerMainSchedule.text = desc,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Uraian jadwal...',
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
                            if (auditor == null || area == null || branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP, 
                              colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{
                              
                              controllerAuditArea.addLocalDataSchedule(auditor!, area!, branch!,
                              startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, scheduleDescControllerMainSchedule.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${area!.areaName}, ${branch!.branchName}, ${startDateControllerMainSchedule.text}, ${endDateControllerMainSchedule.text}, ${scheduleDescControllerMainSchedule.text}');
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
                      Text('Area', style: CustomStyles.textMedium13Px),
                      Text('Cabang', style: CustomStyles.textMedium13Px),
                      Text('Action', style: CustomStyles.textMedium13Px),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalSchedulesAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalSchedulesAuditArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data.auditor}', style: CustomStyles.textRegular13Px),
                            Text('${data.area}', style: CustomStyles.textRegular13Px),
                            Text('${data.branch}', style: CustomStyles.textRegular13Px),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                controllerAuditArea.deleteLocalDataSchedule(data.auditor!);
                                Get.snackbar('Alert', 'Data berhasil dihapus', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
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

                          if (auditor == null || area == null || branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                              Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                          controllerAuditArea.addSchedules(auditor!.id!, area!.id!, branch!.id!,
                              startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, scheduleDescControllerMainSchedule.text);
                          Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP, 
                          colorText: CustomColors.white, backgroundColor: CustomColors.green);
                          print('Buat jadwal : ${auditor!.id}, ${area!.id}, ${branch!.id}, ${startDateControllerMainSchedule.text}, ${endDateControllerMainSchedule.text}, ${scheduleDescControllerMainSchedule.text}');
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
  ModelListAreaAuditArea? area;
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
              TextField(
                readOnly: true,
                controller: startDateControllerSpecialSchedule,
                onChanged: (startDate) => startDateControllerSpecialSchedule.text = startDate,
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

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                readOnly: true,
                controller: endDateControllerSpecialSchedule,
                onChanged: (endDate) => endDateControllerSpecialSchedule.text = endDate,
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
              Text('Pilih area :', style: CustomStyles.textMedium15Px),
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
                          value: area,
                          hint: Text('Area', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.areaAuditArea.map((ModelListAreaAuditArea area){
                            return DropdownMenuItem(
                              value: area,
                              child: Text('${area.areaName}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              area = value;
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
              TextField(
                controller: scheduleDescControllerSpecialSchedule,
                onChanged: (desc) => scheduleDescControllerSpecialSchedule.text = desc,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Uraian jadwal...',
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
                            if (auditor == null || area == null || branch == null || startDateControllerSpecialSchedule.text.isEmpty || endDateControllerSpecialSchedule.text.isEmpty || scheduleDescControllerSpecialSchedule.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP,
                                  colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{

                              controllerAuditArea.addLocalDataSchedule(auditor!, area!, branch!,
                                  startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text, scheduleDescControllerSpecialSchedule.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${area!.areaName}, ${branch!.branchName}, ${startDateControllerSpecialSchedule.text}, ${endDateControllerSpecialSchedule.text}, ${scheduleDescControllerSpecialSchedule.text}');
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
                      Text('Area', style: CustomStyles.textMedium13Px),
                      Text('Cabang', style: CustomStyles.textMedium13Px),
                      Text('Action', style: CustomStyles.textMedium13Px),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalSchedulesAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalSchedulesAuditArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data.auditor}', style: CustomStyles.textRegular13Px),
                            Text('${data.area}', style: CustomStyles.textRegular13Px),
                            Text('${data.branch}', style: CustomStyles.textRegular13Px),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                controllerAuditArea.deleteLocalDataSchedule(data.auditor!);
                                Get.snackbar('Alert', 'Data berhasil dihapus', snackPosition: SnackPosition.TOP,
                                    colorText: CustomColors.white, backgroundColor: CustomColors.red);
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

                          if (auditor == null || area == null || branch == null || startDateControllerSpecialSchedule.text.isEmpty || endDateControllerSpecialSchedule.text.isEmpty || scheduleDescControllerSpecialSchedule.text.isEmpty) {
                            Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                            controllerAuditArea.addSchedules(auditor!.id!, area!.id!, branch!.id!,
                                startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text, scheduleDescControllerSpecialSchedule.text);
                            Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.green);
                            print('Buat jadwal : ${auditor!.id}, ${area!.id}, ${branch!.id}, ${startDateControllerSpecialSchedule.text}, ${endDateControllerSpecialSchedule.text}, ${scheduleDescControllerSpecialSchedule.text}');
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
  const InputDataReschedulePage({super.key});

  @override
  State<InputDataReschedulePage> createState() => _InputDataReschedulePageState();
}

class _InputDataReschedulePageState extends State<InputDataReschedulePage> {

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();
  final TextEditingController scheduleDescControllerReschedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.find();

  ModelListAuditorAuditArea? auditor;
  ModelListAreaAuditArea? area;
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
              TextField(
                readOnly: true,
                controller: startDateControllerReschedule,
                onChanged: (startDate) => startDateControllerReschedule.text = startDate,
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

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              TextField(
                readOnly: true,
                controller: endDateControllerReschedule,
                onChanged: (endDate) => endDateControllerReschedule.text = endDate,
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
              Text('Pilih area :', style: CustomStyles.textMedium15Px),
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
                          value: area,
                          hint: Text('Area', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.areaAuditArea.map((ModelListAreaAuditArea area){
                            return DropdownMenuItem(
                              value: area,
                              child: Text('${area.areaName}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              area = value;
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
              TextField(
                controller: scheduleDescControllerReschedule,
                onChanged: (desc) => scheduleDescControllerReschedule.text = desc,
                cursorColor: CustomColors.blue,
                maxLines: 3,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Uraian jadwal...',
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
                            if (auditor == null || area == null || branch == null || startDateControllerReschedule.text.isEmpty || endDateControllerReschedule.text.isEmpty || scheduleDescControllerReschedule.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP,
                                  colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{

                              controllerAuditArea.addLocalDataSchedule(auditor!, area!, branch!,
                                  startDateControllerReschedule.text, endDateControllerReschedule.text, scheduleDescControllerReschedule.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${area!.areaName}, ${branch!.branchName}, ${startDateControllerReschedule.text}, ${endDateControllerReschedule.text}, ${scheduleDescControllerReschedule.text}');
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
                      Text('Area', style: CustomStyles.textMedium13Px),
                      Text('Cabang', style: CustomStyles.textMedium13Px),
                      Text('Action', style: CustomStyles.textMedium13Px),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerAuditArea.dataListLocalSchedulesAuditArea.length,
                      itemBuilder: (_, index){
                        final data = controllerAuditArea.dataListLocalSchedulesAuditArea[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data.auditor}', style: CustomStyles.textRegular13Px),
                            Text('${data.area}', style: CustomStyles.textRegular13Px),
                            Text('${data.branch}', style: CustomStyles.textRegular13Px),

                            GestureDetector(
                              child: const Icon(Icons.delete, color: CustomColors.red, size: 25),
                              onTap: ()async{
                                controllerAuditArea.deleteLocalDataSchedule(data.auditor!);
                                Get.snackbar('Alert', 'Data berhasil dihapus', snackPosition: SnackPosition.TOP,
                                    colorText: CustomColors.white, backgroundColor: CustomColors.red);
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

                          if (auditor == null || area == null || branch == null || startDateControllerReschedule.text.isEmpty || endDateControllerReschedule.text.isEmpty || scheduleDescControllerReschedule.text.isEmpty) {
                            Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                            controllerAuditArea.addSchedules(auditor!.id!, area!.id!, branch!.id!,
                                startDateControllerReschedule.text, endDateControllerReschedule.text, scheduleDescControllerReschedule.text);
                            Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP,
                                colorText: CustomColors.white, backgroundColor: CustomColors.green);
                            print('Buat jadwal : ${auditor!.id}, ${area!.id}, ${branch!.id}, ${startDateControllerReschedule.text}, ${endDateControllerReschedule.text}, ${scheduleDescControllerReschedule.text}');
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


