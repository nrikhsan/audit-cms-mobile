import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/form_input_add_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//main schedule
class EditMainSchedulePage extends StatefulWidget {
  final int scheduleId;
  final String startDate;
  final String endDate;
  final String description;
  const EditMainSchedulePage({super.key, required this.scheduleId, required this.startDate, required this.endDate, required this.description});

  @override
  State<EditMainSchedulePage> createState() => _EditMainSchedulePageState();
}

class _EditMainSchedulePageState extends State<EditMainSchedulePage> {

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();
  final TextEditingController scheduleDescControllerMainSchedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  int? users;
  int? branch;

  @override
  void initState() {
    startDateControllerMainSchedule.text = widget.startDate;
    endDateControllerMainSchedule.text = widget.endDate;
    scheduleDescControllerMainSchedule.text = widget.description;
    super.initState();
  }

  @override
  void dispose(){
    startDateControllerMainSchedule.dispose();
    endDateControllerMainSchedule.dispose();
    scheduleDescControllerMainSchedule.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Edit jadwal utama'),
          titleSpacing: 5,
          titleTextStyle: CustomStyles.textBold18Px,
          leading: IconButton(
              onPressed: () {
                Get.back();
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
                        value: users,
                          hint: Text('Auditor', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.usersAuditArea.map((users){
                            return DropdownMenuItem(
                              value: users.id,
                                child: Text('${users.fullname}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                          setState(() {
                            users = value;
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
                          items: controllerAuditArea.branchAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
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
              ),

              const SizedBox(height: 15),
              Text('Uraian jadwal :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputDescriptionSchedule(scheduleDescControllerMainSchedule),

                  const SizedBox(height: 40),
                  Center(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                            backgroundColor: CustomColors.blue
                          ),
                          onPressed: ()async{
                    
                            if (users == null || branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                                Get.snackbar('Gagal', 'Data jadwal gagal di edit', snackPosition: SnackPosition.TOP, 
                                  colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{
                            controllerAuditArea.editMainSchedule(widget.scheduleId, users!, branch!, startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, scheduleDescControllerMainSchedule.text);
                            Get.snackbar('Berhasil', 'Data jadwal berhasil di edit', snackPosition: SnackPosition.TOP, 
                                  colorText: CustomColors.white, backgroundColor: CustomColors.green);
                            }
                          },
                          child: Text('Edit jadwal utama', style: CustomStyles.textMediumWhite15Px)
                      ),
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              )
          ),
        ),
      );
  }
}