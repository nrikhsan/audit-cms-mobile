import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/form_input_add_schedule.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
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

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  DataUsers? users;
  DataListBranch? branch;

  void resetValue(){
    setState(() {
      users = null;
      branch = null;
      startDateControllerMainSchedule.clear();
      endDateControllerMainSchedule.clear();
      scheduleDescControllerMainSchedule.clear();
    });
  }

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
                        value: users,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.usersAuditArea.map((users){
                            return DropdownMenuItem(
                              value: users,
                                child: Text('${users.fullname}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                          setState(() {
                            users = value;
                            controllerAuditArea.loadBranchByUserIdAuditArea(value?.id);
                            branch = null;
                          });
                        }
                      ),
                    )
                ),
              )),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
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
                          value: branch,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
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
              )),

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
                            if (users == null || branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                              snackBarMessageRed('Gagal', 'Data jadwal gagal ditambahkan');
                            }else if(DateTime.parse(startDateControllerMainSchedule.text).isAtSameMomentAs(DateTime.parse(endDateControllerMainSchedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh sama dengan tanggal selesai');
                            }else if(DateTime.parse(startDateControllerMainSchedule.text).isAfter(DateTime.parse(endDateControllerMainSchedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                            }else{
                              controllerAuditArea.addLocalDataMainSchedule(users?.id, branch?.id, 
                              startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, 
                              scheduleDescControllerMainSchedule.text, branch?.name, users?.fullname);
                              resetValue();
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
                            Text('${data.user?.fullname}', style: CustomStyles.textRegular13Px),
                            Text('${data.branch?.name}', style: CustomStyles.textRegular13Px),

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
                    width: double.maxFinite,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue
                        ),
                        onPressed: ()async{

                          if (controllerAuditArea.dataListLocalMainSchedulesAuditArea.isEmpty) {
                            snackBarMessageRed('Gagal', 'Data list jadwal utama tidak boleh kosong');
                          }else{
                            controllerAuditArea.addMainSchedules();
                            Get.back();
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

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  DataUsers? users;
  DataListBranch? branch;

  void resetValue() {
  setState(() {
    users = null;
    branch = null;
    startDateControllerSpecialSchedule.clear();
    endDateControllerSpecialSchedule.clear();
    scheduleDescControllerSpecialSchedule.clear();
  });
}

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
                          value: users,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.usersAuditArea.map((users){
                            return DropdownMenuItem(
                              value: users,
                              child: Text('${users.fullname}', style: CustomStyles.textMedium15Px),

                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              users = value;
                              controllerAuditArea.loadBranchByUserIdAuditArea(value?.id);
                              branch = null;
                            });
                          }
                      ),
                    )
                ),
              )),


              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
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
                          value: branch,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
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
              )),

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
                            if (users == null || branch == null || startDateControllerSpecialSchedule.text.isEmpty || endDateControllerSpecialSchedule.text.isEmpty || scheduleDescControllerSpecialSchedule.text.isEmpty) {
                              snackBarMessageRed('Gagal', 'Data jadwal gagal ditambahkan');
                            }else if(DateTime.parse(startDateControllerSpecialSchedule.text).isAtSameMomentAs(DateTime.parse(endDateControllerSpecialSchedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh sama dengan tanggal selesai');
                            }else if(DateTime.parse(startDateControllerSpecialSchedule.text).isAfter(DateTime.parse(endDateControllerSpecialSchedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                            }else{
                              controllerAuditArea.addLocalDataSpecialSchedule(users?.id, branch?.id, 
                              startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text, 
                              scheduleDescControllerSpecialSchedule.text, branch?.name, users?.fullname);
                              resetValue();
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
                            Text('${data.user?.fullname}', style: CustomStyles.textRegular13Px),
                            Text('${data.branch?.name}', style: CustomStyles.textRegular13Px),

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
                    width: double.maxFinite,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                            backgroundColor: CustomColors.blue
                        ),
                        onPressed: ()async{
                          if(controllerAuditArea.dataListLocalSpecialSchedulesAuditArea.isEmpty){
                            snackBarMessageRed('Gagal', 'Data list jadwal khusus tidak boleh kosong');
                          }else{
                            controllerAuditArea.addSpecialSchedules();
                            Get.back();
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
  final String startDate;
  final String endDate;
  final int? user;
  final int? branch;
  final String desc;
  const InputDataReschedulePage({super.key, required this.rescheduleId, required this.startDate, required this.endDate, required this.user, required this.branch, required this.desc});

  @override
  State<InputDataReschedulePage> createState() => _InputDataReschedulePageState();
}

class _InputDataReschedulePageState extends State<InputDataReschedulePage> {

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();
  final TextEditingController scheduleDescControllerReschedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

   @override
  void initState() {
    startDateControllerReschedule.text = widget.startDate;
    endDateControllerReschedule.text = widget.endDate;
    scheduleDescControllerReschedule.text = widget.desc;
    controllerAuditArea.loadBranchByUserIdAuditArea(widget.user);
    _users  = widget.user;
    _branch = widget.branch;
    super.initState();
  }

  @override
  void dispose() {
    startDateControllerReschedule.dispose();
    endDateControllerReschedule.dispose();
    scheduleDescControllerReschedule.dispose();
    super.dispose();
  }

  int? _users;
  int? _branch;

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
              formInputEditScheduleStartDate(context, startDateControllerReschedule, widget.startDate),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputEditScheduleEndDate(context, endDateControllerReschedule, widget.endDate),

              const SizedBox(height: 15),
              Text('Pilih auditor :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
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
                          value: _users,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.usersAuditArea.map((users){
                            return DropdownMenuItem(
                              value: users.id,
                              child: Text('${users.fullname}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              _users = value;
                              final userId = value;
                              controllerAuditArea.loadBranchByUserIdAuditArea(userId);
                              _branch = null;
                            });
                          }
                      ),
                    )
                ),
              )),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),
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
                          value: _branch,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                               _branch = value;
                            });
                          }  
                      ),
                    )
                ),
              )),

              const SizedBox(height: 15),
              Text('Uraian jadwal :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputDescriptionSchedule(scheduleDescControllerReschedule),

              const SizedBox(height: 25),
              Column(
                children: [
                  
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                            backgroundColor: CustomColors.blue
                        ),
                        onPressed: ()async{
                          if (_users == null || _branch == null || startDateControllerReschedule.text.isEmpty || endDateControllerReschedule.text.isEmpty || scheduleDescControllerReschedule.text.isEmpty) {
                              snackBarMessageRed('Gagal', 'Data jadwal gagal ditambahkan');
                            }else if(DateTime.parse(startDateControllerReschedule.text).isAtSameMomentAs(DateTime.parse(endDateControllerReschedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh sama dengan tanggal selesai');
                            }else if(DateTime.parse(startDateControllerReschedule.text).isAfter(DateTime.parse(endDateControllerReschedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                            }else if(startDateControllerReschedule.text == widget.startDate && endDateControllerReschedule.text == widget.endDate){
                              snackBarMessageRed('Gagal', 'tanggal harus diperbarui');
                            }else{
                              controllerAuditArea.requestReschedule(_users, widget.rescheduleId, _branch, 
                                startDateControllerReschedule.text, endDateControllerReschedule.text, scheduleDescControllerReschedule.text);
                              Get.back();
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


