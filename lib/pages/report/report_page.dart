import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/report/widgetReport/widget_report.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
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
                Tab(text: 'klarifikasi'),
                Tab(text: 'LHA'),
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
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          )
                      ),
                      child: DropdownButton(
                          iconEnabledColor: CustomColors.blue,
                          borderRadius: BorderRadius.circular(10),
                          value: controllerAuditArea.branchIdReport.value,
                          hint: Text('Cabang', style: CustomStyles.textRegularGrey13Px),
                          items: controllerAuditArea.branchForFilterAuditArea.map((branch){
                            return DropdownMenuItem(
                              value: branch.id,
                              child: Text('${branch.name}', style: CustomStyles.textMedium15Px),
                            );
                          }).toList(),
                          onChanged: (value){
                            controllerAuditArea.branchIdReport.value = value;
                          }
                      ),
                    )
                ),
              )),
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
                          snakcBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerClarification.text).isAfter(DateTime.parse(endDateControllerClarification.text))) {
                          snakcBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
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
                          snakcBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerLha.text).isAfter(DateTime.parse(endDateControllerLha.text))) {
                          snakcBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
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


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
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
                Tab(text: 'klarifikasi'),
                Tab(text: 'LHA'),
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
                          snakcBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerClarification.text).isAfter(DateTime.parse(endDateControllerClarification.text))) {
                          snakcBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
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
                          snakcBarMessageRed('Gagal', 'Tanggal mulai dan akhir tidak boleh kosong');
                        } else if(DateTime.parse(startDateControllerLha.text).isAfter(DateTime.parse(endDateControllerLha.text))) {
                          snakcBarMessageRed('Gagal', 'tanggal mulai tidak boleh lebih besar dari tanggal selesai');
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

      ]))
    );
  }
}
