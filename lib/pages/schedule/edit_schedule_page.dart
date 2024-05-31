import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/schedule/widgetScheduleAuditArea/form_input_add_schedule.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//main schedule
class EditMainSchedulePage extends StatefulWidget {
  final int scheduleId;
  final String startDate;
  final String endDate;
  final int user;
  final int branch;
  final String? desc;
  const EditMainSchedulePage({super.key, required this.scheduleId, required this.startDate, required this.endDate, required this.user, required this.branch, required this.desc});

  @override
  State<EditMainSchedulePage> createState() => _EditMainSchedulePageState();
}

class _EditMainSchedulePageState extends State<EditMainSchedulePage> {

  final TextEditingController startDateControllerMainSchedule = TextEditingController();
  final TextEditingController endDateControllerMainSchedule = TextEditingController();
  final TextEditingController scheduleDescControllerMainSchedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  final TextEditingController usersEditingController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();

  @override
  void initState(){
    startDateControllerMainSchedule.text = widget.startDate;
    endDateControllerMainSchedule.text = widget.endDate;
    scheduleDescControllerMainSchedule.text = widget.desc ?? '';
    controllerAuditArea.loadBranchByUserIdAuditArea(widget.user);
    _users = widget.user;
    _branch = widget.branch;
    super.initState();
  }

  @override
  void dispose() {
    startDateControllerMainSchedule.dispose();
    endDateControllerMainSchedule.dispose();
    scheduleDescControllerMainSchedule.dispose();
    super.dispose();
  }

  int? _users;
  int? _branch;
  
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
              formInputEditScheduleStartDate(context, startDateControllerMainSchedule, widget.startDate),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputEditScheduleEndDate(context, endDateControllerMainSchedule, widget.endDate),

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
                              child: Text('${item.fullname} ${item.office?.map((e) => e.name)}', style: CustomStyles.textMedium13Px, overflow: TextOverflow.ellipsis,)
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
                        final fullName = controllerAuditArea.usersAuditArea.firstWhere((element) => element.id == item.value);
                        return fullName.fullname!.contains(searchValue);
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
                        final branchName = controllerAuditArea.branchAuditArea.firstWhere((element) => element.id == item.value);
                        return branchName.name!.contains(searchValue);
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
                    
                           if (_users == null || _branch == null || startDateControllerMainSchedule.text.isEmpty || endDateControllerMainSchedule.text.isEmpty || scheduleDescControllerMainSchedule.text.isEmpty) {
                              snackBarMessageRed('Gagal', 'Data jadwal gagal di edit');
                            }else if(DateTime.parse(startDateControllerMainSchedule.text).isAfter(DateTime.parse(endDateControllerMainSchedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                            }else{
                            controllerAuditArea.editMainSchedule(widget.scheduleId, _users!, _branch!, startDateControllerMainSchedule.text, endDateControllerMainSchedule.text, scheduleDescControllerMainSchedule.text);
                              Navigator.pop(context);
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

//special schedule
class EditSpecialSchedule extends StatefulWidget {
  final int scheduleId;
  final String startDate;
  final String endDate;
  final int user;
  final int branch;
  final String? desc;
  const EditSpecialSchedule({super.key, required this.scheduleId, required this.startDate, required this.endDate, required this.user, required this.branch, required this.desc});

  @override
  State<EditSpecialSchedule> createState() => _EditSpecialScheduleState();
}

class _EditSpecialScheduleState extends State<EditSpecialSchedule> {

  final TextEditingController startDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController endDateControllerSpecialSchedule = TextEditingController();
  final TextEditingController scheduleDescControllerSpecialSchedule = TextEditingController();

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  final TextEditingController usersEditingController = TextEditingController();
  final TextEditingController branchEditingController = TextEditingController();


  @override
  void initState() {
    startDateControllerSpecialSchedule.text = widget.startDate;
    endDateControllerSpecialSchedule.text = widget.endDate;
    scheduleDescControllerSpecialSchedule.text = widget.desc ?? '';
    controllerAuditArea.loadBranchByUserIdAuditArea(widget.user);
    _users = widget.user;
    _branch = widget.branch;
    super.initState();
  }

  @override
  void dispose() {
    startDateControllerSpecialSchedule.dispose();
    endDateControllerSpecialSchedule.dispose();
    scheduleDescControllerSpecialSchedule.dispose();
    super.dispose();
  }

  int? _users;
  int? _branch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Edit jadwal Khusus'),
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
              formInputEditScheduleStartDate(context, startDateControllerSpecialSchedule, widget.startDate),

              const SizedBox(height: 15),
              Text('Sampai dengan :', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputEditScheduleEndDate(context, endDateControllerSpecialSchedule, widget.endDate),

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
                              child: Text('${item.fullname} ${item.office?.map((e) => e.name)}', style: CustomStyles.textMedium13Px, overflow: TextOverflow.ellipsis)
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
                        final fullName = controllerAuditArea.usersAuditArea.firstWhere((element) => element.id == item.value);
                        return fullName.fullname!.contains(searchValue);
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
                    items: controllerAuditArea.branchForFilterAuditArea
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
                        final branchName = controllerAuditArea.branchForFilterAuditArea.firstWhere((element) => element.id == item.value);
                        return branchName.name!.contains(searchValue);
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
                            if (_users == null || _branch == null || startDateControllerSpecialSchedule.text.isEmpty || endDateControllerSpecialSchedule.text.isEmpty || scheduleDescControllerSpecialSchedule.text.isEmpty) {
                              snackBarMessageRed('Gagal', 'Data jadwal gagal di edit');
                            }else if(DateTime.parse(startDateControllerSpecialSchedule.text).isAfter(DateTime.parse(endDateControllerSpecialSchedule.text))){
                              snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                            }else{
                            controllerAuditArea.editSpecialSchedule(widget.scheduleId, _users!, _branch!, startDateControllerSpecialSchedule.text, endDateControllerSpecialSchedule.text, scheduleDescControllerSpecialSchedule.text);
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Edit jadwal khusus', style: CustomStyles.textMediumWhite15Px)
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