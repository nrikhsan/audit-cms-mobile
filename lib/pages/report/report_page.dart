import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/report/widgetReport/widget_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//audit area
class ReportPageAuditArea extends StatefulWidget {
  const ReportPageAuditArea({super.key});

  @override
  State<ReportPageAuditArea> createState() => _ReportPageAuditAreaState();
}

class _ReportPageAuditAreaState extends State<ReportPageAuditArea> {
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Laporan'),
            titleTextStyle: CustomStyles.textBold18Px,
            actions: [
              TextButton(
                onPressed: (){
                            controllerAuditArea.branchIdReport.value = null;
                            controllerAuditArea.areaId.value = null;
                            startDateController.clear();
                            endDateController.clear();
              }, child: Text('Reset', style: CustomStyles.textMediumRed15Px))],
            ),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
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
              formInputStarDateEndDate(context, 'Mulai dari', startDateController),
              const SizedBox(height: 10),
              formInputStarDateEndDate(context, 'Sampai dengan', endDateController),
              const SizedBox(height: 25),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: () {
                        downloadReportClarificationAuditArea(AppConstant.downloadReportClarification, controllerAuditArea.branchIdReport.value, startDateController, endDateController);
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
                          backgroundColor: CustomColors.green),
                      onPressed: () {
                        downloadReportLhaAuditArea(AppConstant.downloadReportLha, startDateController, endDateController);
                      },
                      child: Text('Download laporan LHA',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    )
                  ],
                ),
            ),
        )
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
  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Laporan'),
          titleTextStyle: CustomStyles.textBold18Px,
          actions: [
              TextButton(
                onPressed: (){
                           
                            startDateController.clear();
                            endDateController.clear();
              }, child: Text('Reset', style: CustomStyles.textMediumRed15Px))],
        ),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dengan tanggal', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputStarDateEndDate(context, 'Mulai dari', startDateController),
              const SizedBox(height: 10),
              formInputStarDateEndDate(context, 'Sampai dengan', endDateController),
              const SizedBox(height: 25),

              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                      onPressed: () {
                       downloadReportClarificationAuditRegion(AppConstant.downloadReportClarification, startDateController, endDateController, context);
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
                          backgroundColor: CustomColors.green),
                      onPressed: () {
                        downloadReportLhaAuditRegion(AppConstant.downloadReportLha, startDateController, endDateController);
                      },
                      child: Text('Download laporan LHA',
                          style: CustomStyles.textMediumWhite15Px)
                      )
                    ),
                  ],
                ),
            ),
        )
    );
  }
}
