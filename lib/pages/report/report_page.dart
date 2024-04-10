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
    controllerAuditArea.getReportAuditArea(branchController.text, startDateController.text, endDateController.text);
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: const Text('Laporan'),
            titleTextStyle: CustomStyles.textBold18Px),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Dengan cabang', style: CustomStyles.textMedium15Px),
              const SizedBox(height: 15),
              formInputReportBranchOrUser('Nama cabang...', branchController),
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
                        downloadReportAuditArea('url', controllerAuditArea, branchController, startDateController, endDateController);
                      },
                      child: Text('Download laporan',
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
    controllerAuditRegion.getReportAuditRegion(startDateController.text, endDateController.text);
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Laporan'),
          titleTextStyle: CustomStyles.textBold18Px,
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
                        downloadReportAuditRegion('url', controllerAuditRegion, startDateController, endDateController);
                      },
                      child: Text('Download laporan',
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
