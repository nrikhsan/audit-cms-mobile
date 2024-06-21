import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/report/widgetReport/widget_report.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

//audit area
class ReportPageAuditArea extends StatefulWidget {
  const ReportPageAuditArea({super.key});

  @override
  State<ReportPageAuditArea> createState() => _ReportPageAuditAreaState();
}

class _ReportPageAuditAreaState extends State<ReportPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController startDateControllerClarification = TextEditingController();
  final TextEditingController endDateControllerClarification = TextEditingController();
  final TextEditingController startDateControllerLha = TextEditingController();
  final TextEditingController endDateControllerLha = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  final TextEditingController branchEditingController = TextEditingController();
  int? month;
  int? year;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
    child: Scaffold(
      appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Download laporan'),
            titleSpacing: 20,
            titleTextStyle: CustomStyles.textBold18Px,
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: CustomColors.blue,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelStyle: const TextStyle(
                  color: CustomColors.grey,
                  fontFamily: 'RobotoMedium',
                  fontSize: 13),
              labelStyle: const TextStyle(
                  color: CustomColors.blue,
                  fontFamily: 'RobotoMedium',
                  fontSize: 13),
              tabs: const [
                Tab(text: 'Laporan klarifikasi'),
                Tab(text: 'Laporan LHA'),
                Tab(text: 'Laporan temuan'),
              ],
            ),
          ),
        body: TabBarView(
          children: [

            // 1. laporan klarifikasi
            Scaffold(
              backgroundColor: CustomColors.white,
              body: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10),
                  Text('Dengan cabang', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  Obx(() => SizedBox(
                width: double.maxFinite,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih cabang',
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
                    value: controllerAuditArea.branchIdReport.value,
                    onChanged: (value) {
                      setState(() {
                        controllerAuditArea.branchIdReport.value = value;
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
                            hintText: 'Cari auditor...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        final branchName = controllerAuditArea.branchForFilterAuditArea.firstWhere((element) => element.id == item.value);
                        return branchName.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
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
              Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputStarDateEndDate(context, 'Mulai dari', startDateControllerClarification),
              const SizedBox(height: 10),
              formInputStarDateEndDate(context, 'Sampai dengan', endDateControllerClarification),
              const SizedBox(height: 25),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: ()async {
                        if (startDateControllerClarification.text.isEmpty || endDateControllerClarification.text.isEmpty) {
                          snackBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerClarification.text).isAfter(DateTime.parse(endDateControllerClarification.text))) {
                          snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                        }else{
                          if (await requestPermission(Permission.storage) == true) {
                          downloadReportClarificationAuditArea(AppConstant.downloadReportClarification, controllerAuditArea.branchIdReport.value, startDateControllerClarification, endDateControllerClarification);
                        } else {
                          showSnackbarPermission(context);
                        }
                        }
                      },
                      child: Text('Download laporan klarifikasi',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),

                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red),
                      onPressed: ()async {
                          controllerAuditArea.branchIdReport.value = null;
                          startDateControllerClarification.clear();
                          endDateControllerClarification.clear();
                        },
                      child: Text('Reset filter',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),
                  ],
                ),
            ),
          ),
        ),

        // 2. laporan LHA
        Scaffold(
              backgroundColor: CustomColors.white,
              body: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              const SizedBox(height: 15),
              formInputStarDateEndDate(context, 'Mulai dari', startDateControllerLha),
              const SizedBox(height: 10),
              formInputStarDateEndDate(context, 'Sampai dengan', endDateControllerLha),
              const SizedBox(height: 25),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: ()async {
                        if (startDateControllerLha.text.isEmpty || endDateControllerLha.text.isEmpty) {
                          snackBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerLha.text).isAfter(DateTime.parse(endDateControllerLha.text))) {
                          snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                        }else{
                          if (await requestPermission(Permission.storage) == true) {
                          downloadReportLhaAuditArea(AppConstant.downloadReportLha, startDateControllerLha, endDateControllerLha);
                        } else {
                          showSnackbarPermission(context);
                        }
                        }
                      },
                      child: Text('Download laporan LHA',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),

                    SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red),
                      onPressed: ()async {
                          startDateControllerLha.clear();
                          endDateControllerLha.clear();
                        },
                      child: Text('Reset filter',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),
                  ],
                ),
            ),
          ),
        ),

        //3. Laporan temuan
        Scaffold(
          backgroundColor: CustomColors.white,
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Obx(() => DropdownButton<int>(
                          value: controllerAuditArea.selectedMonthDashboardClarification.value,
                          items: controllerAuditArea.months.map((int month) {
                            return DropdownMenuItem<int>(
                              value: month,
                              child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            controllerAuditArea.selectedMonthDashboardClarification.value = newValue!;
                          },
                        )),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Obx(() => DropdownButton<int>(
                          value: controllerAuditArea.selectedYearDashboardClarification.value,
                          items: controllerAuditArea.years.map((int year) {
                            return DropdownMenuItem<int>(
                              value: year,
                              child: Text(year.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            controllerAuditArea.selectedYearDashboardClarification.value = newValue!;
                          },
                        )),
                  ),

                  const SizedBox(width: 5),
                  SizedBox(
                    child: IconButton(
                      onPressed: (){
                        controllerAuditArea.resetFilterDownloadDashboardClarification();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: ()async {
                        if (await requestPermission(Permission.storage) == true) {
                          downloadReportDashboardClarification(controllerAuditArea.selectedMonthDashboardClarification.value, 
                          controllerAuditArea.selectedYearDashboardClarification.value, AppConstant.downloadDashboardClarification);
                        } else {
                          showSnackbarPermission(context);
                        }
                      },
                      child: Text('Download laporan temuan',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),

            ]),
          ),
        )

      ]))
    );
  }
}

//audit region
class ReportPageAuditRegion extends StatefulWidget {
  const ReportPageAuditRegion({super.key});

  @override
  State<ReportPageAuditRegion> createState() => _ReportPageAuditRegionState();
}

class _ReportPageAuditRegionState extends State<ReportPageAuditRegion> {
  
  final TextEditingController startDateControllerClarification = TextEditingController();
  final TextEditingController endDateControllerClarification = TextEditingController();
  final TextEditingController startDateControllerLha = TextEditingController();
  final TextEditingController endDateControllerLha = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
    child: Scaffold(
      appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Download laporan'),
            titleSpacing: 20,
            titleTextStyle: CustomStyles.textBold18Px,
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: CustomColors.blue,
              splashBorderRadius: BorderRadius.circular(10),
              unselectedLabelStyle: const TextStyle(
                  color: CustomColors.grey,
                  fontFamily: 'RobotoMedium',
                  fontSize: 13),
              labelStyle: const TextStyle(
                  color: CustomColors.blue,
                  fontFamily: 'RobotoMedium',
                  fontSize: 13),
              tabs: const [
                Tab(text: 'Laporan klarifikasi'),
                Tab(text: 'Laporan LHA'),
                Tab(text: 'Laporan temuan'),
              ],
            ),
          ),
        body: TabBarView(
          children: [

            // 1. laporan klarifikasi
            Scaffold(
              backgroundColor: CustomColors.white,
              body: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              const SizedBox(height: 15),
              formInputStarDateEndDate(context, 'Mulai dari', startDateControllerClarification),
              const SizedBox(height: 10),
              formInputStarDateEndDate(context, 'Sampai dengan', endDateControllerClarification),
              const SizedBox(height: 25),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: ()async {
                        if (startDateControllerClarification.text.isEmpty || endDateControllerClarification.text.isEmpty) {
                          snackBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerClarification.text).isAfter(DateTime.parse(endDateControllerClarification.text))) {
                          snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                        }else{
                          if (await requestPermission(Permission.storage) == true) {
                          downloadReportClarificationAuditRegion(AppConstant.downloadReportClarification, startDateControllerClarification, endDateControllerClarification);
                        } else {
                          showSnackbarPermission(context);
                        }
                        }
                      },
                      child: Text('Download laporan klarifikasi',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),

                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red),
                        onPressed: ()async {
                          startDateControllerClarification.clear();
                          endDateControllerClarification.clear();
                        },
                      child: Text('Reset filter',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),
                  ],
                ),
            ),
          ),
        ),

        // 2. laporan LHA
        Scaffold(
              backgroundColor: CustomColors.white,
              body: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              const SizedBox(height: 15),
              formInputStarDateEndDate(context, 'Mulai dari', startDateControllerLha),
              const SizedBox(height: 10),
              formInputStarDateEndDate(context, 'Sampai dengan', endDateControllerLha),
              const SizedBox(height: 25),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: ()async {
                        if (startDateControllerLha.text.isEmpty || endDateControllerLha.text.isEmpty) {
                          snackBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerLha.text).isAfter(DateTime.parse(endDateControllerLha.text))) {
                          snackBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
                        }else{
                          if (await requestPermission(Permission.storage) == true) {
                          downloadReportLhaAuditRegion(AppConstant.downloadReportLha, startDateControllerLha, endDateControllerLha);
                        } else {
                          showSnackbarPermission(context);
                        }
                        }
                      },
                      child: Text('Download laporan LHA',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),

                    SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red),
                      onPressed: ()async {
                          startDateControllerLha.clear();
                          endDateControllerLha.clear();
                        },
                      child: Text('Reset filter',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),
                  ],
                ),
            ),
          ),
        ),

        //3. Laporan temuan
        Scaffold(
          backgroundColor: CustomColors.white,
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Obx(() => DropdownButton<int>(
                          value: controllerAuditRegion.selectedMonthDashboardClarification.value,
                          items: controllerAuditRegion.months.map((int month) {
                            return DropdownMenuItem<int>(
                              value: month,
                              child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            controllerAuditRegion.selectedMonthDashboardClarification.value = newValue!;
                          },
                        )),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Obx(() => DropdownButton<int>(
                          value: controllerAuditRegion.selectedYearDashboardClarification.value,
                          items: controllerAuditRegion.years.map((int year) {
                            return DropdownMenuItem<int>(
                              value: year,
                              child: Text(year.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            controllerAuditRegion.selectedYearDashboardClarification.value = newValue!;
                          },
                        )),
                  ),

                  const SizedBox(width: 5),
                  SizedBox(
                    child: IconButton(
                      onPressed: (){
                        controllerAuditRegion.resetFilterDownloadDashboardClarification();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: ()async {
                        if (await requestPermission(Permission.storage) == true) {
                          downloadReportDashboardClarification(controllerAuditRegion.selectedMonthDashboardClarification.value, controllerAuditRegion.selectedYearDashboardClarification.value, AppConstant.downloadDashboardClarification);
                        } else {
                          showSnackbarPermission(context);
                        }
                      },
                      child: Text('Download laporan temuan',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),

            ]),
          ),
        )

      ]))
    );
  }
}
