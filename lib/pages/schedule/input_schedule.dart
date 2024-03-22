import 'package:audit_cms/data/core/response/auditArea/response_dropdown_audit_area.dart';
import 'package:audit_cms/pages/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/controller/auditArea/controller_audit_area.dart';
import '../../helper/styles/custom_styles.dart';


//audit area
class InputDataSchedulesPage extends StatefulWidget {
  const InputDataSchedulesPage({super.key});

  @override
  State<InputDataSchedulesPage> createState() => _InputDataSchedulesPageState();
}

class _InputDataSchedulesPageState extends State<InputDataSchedulesPage> {

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController scheduleDescController = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.find();

  ModelListAuditorAuditArea? auditor;
  ModelListAreaAuditArea? area;
  ModelListBranchAuditArea? branch;
  ModelListStatusAuditArea? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Input jadwal audit'),
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
                    startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
                  }
                },
              ),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
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
                    endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
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
              Text('Pilih status :', style: CustomStyles.textMedium15Px),
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
                          value: status,
                          hint: Text('Status', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.statusAuditArea.map((ModelListStatusAuditArea status){
                            return DropdownMenuItem(
                              value: status,
                              child: Text('${status.statusName}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value)async{
                            setState(() {
                              status = value;
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
                controller: scheduleDescController,
                onChanged: (desc) => scheduleDescController.text = desc,
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
                            if (auditor == null || area == null || branch == null || status == null || startDateController.text.isEmpty || endDateController.text.isEmpty || scheduleDescController.text.isEmpty) {
                              Get.snackbar('Alert', 'Field tidak boleh kosong', snackPosition: SnackPosition.TOP, 
                              colorText: CustomColors.white, backgroundColor: CustomColors.red);
                            }else{
                              
                              controllerAuditArea.addLocalDataSchedule(auditor!, area!, branch!, status!,
                              startDateController.text, endDateController.text, scheduleDescController.text);
                              print('Tambah data lokal jadwal : ${auditor!.auditorName}, ${area!.areaName}, ${branch!.branchName}, ${status!.statusName}, ${startDateController.text}, ${endDateController.text}, ${scheduleDescController.text}');
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

                          if (auditor == null || area == null || branch == null || status == null || startDateController.text.isEmpty || endDateController.text.isEmpty || scheduleDescController.text.isEmpty) {
                              Get.snackbar('Gagal', 'Data jadwal gagal dibuat', snackPosition: SnackPosition.TOP, 
                                colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                          controllerAuditArea.addSchedules(auditor!.id!, area!.id!, branch!.id!, status!.id!,
                              startDateController.text, endDateController.text, scheduleDescController.text);

                          Get.snackbar('Berhasil', 'Berhasil menambahkan data jadwal', snackPosition: SnackPosition.TOP, 
                          colorText: CustomColors.white, backgroundColor: CustomColors.green);
                          print('Buat jadwal : ${auditor!.id}, ${area!.id}, ${branch!.id}, ${status!.id}, ${startDateController.text}, ${endDateController.text}, ${scheduleDescController.text}');
                          Navigator.pop(context);
                          }
                        },
                        child: Text('Buat jadwal', style: CustomStyles.textMediumWhite15Px)
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
