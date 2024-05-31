import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/form_input_add_schedule.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

  final TextEditingController usersEditingController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();

  DataUsers? users;
  DataListBranch? branch;
  
  @override
  void dispose() {
    usersEditingController.dispose();
    branchEditingController.dispose();
    super.dispose();
  }
  
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
                  child: DropdownButton2<DataUsers>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih auditor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.usersAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.fullname} ${item.office?.map((e) => e.name)}', style: CustomStyles.textMedium13Px, overflow: TextOverflow.ellipsis)
                            ))
                        .toList(),
                    value: users,
                    onChanged: (value) {
                      setState(() {
                        users = value;
                        controllerAuditArea.loadBranchByUserIdAuditArea(value?.id);
                        branch = null;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 400,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: usersEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: usersEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.fullname!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        usersEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<DataListBranch>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih Cabang',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.branchAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: branch,
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 400,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: branchEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: branchEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari cabang...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        branchEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data.user?.fullname} - ${data.branch?.name}', style: CustomStyles.textMedium15Px),
                                const SizedBox(height: 5),
                                Text('Tanggal jadwal : ${data.startDate} s/d ${data.endDate}', style: CustomStyles.textRegularBlack5413Px),
                                const SizedBox(height: 15)
                              ],
                            ),

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

  final TextEditingController usersEditingController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();

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
                  child: DropdownButton2<DataUsers>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih auditor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.usersAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.fullname} ${item.office?.map((e) => e.name)}', style: CustomStyles.textMedium13Px, overflow: TextOverflow.ellipsis,)
                            ))
                        .toList(),
                    value: users,
                    onChanged: (value) {
                      setState(() {
                        users = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 400,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: usersEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: usersEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.fullname!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        usersEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<DataListBranch>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih Cabang',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.branchForFilterAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: branch,
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 400,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: branchEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: branchEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari cabang...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        branchEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data.user?.fullname} - ${data.branch?.name}', style: CustomStyles.textMedium15Px),
                                const SizedBox(height: 5),
                                Text('Tanggal jadwal : ${data.startDate} s/d ${data.endDate}', style: CustomStyles.textRegularBlack5413Px),
                                const SizedBox(height: 15),
                              ],
                            ),

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
  final String? desc;
  final String? suggestion;
  const InputDataReschedulePage({super.key, required this.rescheduleId, required this.startDate, required this.endDate, required this.user, required this.branch, required this.desc, this.suggestion});

  @override
  State<InputDataReschedulePage> createState() => _InputDataReschedulePageState();
}

class _InputDataReschedulePageState extends State<InputDataReschedulePage> {

  final TextEditingController startDateControllerReschedule = TextEditingController();
  final TextEditingController endDateControllerReschedule = TextEditingController();
  final TextEditingController scheduleDescControllerReschedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  final TextEditingController usersEditingController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();

   @override
  void initState() {
    startDateControllerReschedule.text = widget.startDate;
    endDateControllerReschedule.text = widget.endDate;
    scheduleDescControllerReschedule.text = widget.desc ?? '';
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

              Visibility(
                visible: widget.suggestion != null ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Card(
                        elevation: 0,
                        color: CustomColors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Saran revisi :', style: CustomStyles.textMediumWhite15Px),
                              const SizedBox(height: 5),
                              Text('${widget.suggestion}', style: CustomStyles.textRegularWhite13Px),
                            ],
                          )
                        ),
                      ),
                    )
                  ],
                )
              ),
              
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
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih auditor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.usersAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.fullname}\n${item.office?.map((e) => e.name)}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: _users,
                    onChanged: (value) {
                      setState(() {
                        _users = value;
                        controllerAuditArea.loadBranchByUserIdAuditArea(value);
                        _branch = null;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 400,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: usersEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: usersEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final users = controllerAuditArea.usersAuditArea.firstWhere((element) => element.id == item.value);
                        return users.fullname!.isCaseInsensitiveContains(searchValue.capitalizeFirst!);
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        usersEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              const SizedBox(height: 15),
              Text('Pilih cabang :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 10),

              Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih Cabang',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controllerAuditArea.branchAuditArea
                        .map((item) => DropdownMenuItem(
                              value: item.id,
                              child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                            ))
                        .toList(),
                    value: _branch,
                    onChanged: (value) {
                      setState(() {
                        _branch = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: 400,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: branchEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: branchEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari cabang...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final nameBranch = controllerAuditArea.branchAuditArea.firstWhere((element) => element.id == item.value);
                        return nameBranch.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        branchEditingController.clear();
                      }
                    },
                  ),
                ),
              ),),

              const SizedBox(height: 15),
              Text('Uraian jadwal :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputDescriptionSchedule(scheduleDescControllerReschedule),

              const SizedBox(height: 25),
              Column(
                children: [
                
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


