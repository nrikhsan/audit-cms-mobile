import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/helper/styles/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dashboardSopAuditArea(ControllerAuditArea controllerAuditArea){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: SizedBox(
      height: 170,
      child: Obx((){
        if (controllerAuditArea.chartSop.isEmpty) {
          return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controllerAuditArea.chartSop.length,
            itemBuilder: (_, index){
              final sop = controllerAuditArea.chartSop[index];
              return cardSop('Kerugian : ${CurrencyFormat.convertToIdr(sop.totalNominalLoss, 0)}', sop.cases ?? '-', 'Total SOP : ${sop.total}', sop.caseCategory ?? '-');
            },
          );
        }
      }),
    ),
  );
}

Widget dashboardSopAuditRegion(ControllerAuditRegion controllerAuditRegion){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: SizedBox(
      height: 170,
      child: Obx((){
        if (controllerAuditRegion.chartSop.isEmpty) {
          return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controllerAuditRegion.chartSop.length,
            itemBuilder: (_, index){
              final sop = controllerAuditRegion.chartSop[index];
              return cardSop('Kerugian : ${CurrencyFormat.convertToIdr(sop.totalNominalLoss, 0)}', sop.cases ?? '-', 'Total SOP : ${sop.total}', sop.caseCategory ?? '-');
            },
          );
        }
      }),
    ),
  );
}

Widget cardSop(String nominalLoss, String cases, String totalSop, String caseCategory){
  return SizedBox(
    width: 250,
    child: GestureDetector(
      child: Card(
      elevation: 0,
      color: CustomColors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: CustomColors.lightGrey,
          width: 1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cases, style: CustomStyles.textMedium13Px),
            const SizedBox(height: 5),
            Text(totalSop, style: CustomStyles.textRegularGrey12Px),
            const Divider(),
            const SizedBox(height: 5),
            Text(nominalLoss, style: CustomStyles.textMediumBlue12Px),
            const SizedBox(height: 5),
            SizedBox(
              width: 210,
              child: Text(caseCategory, style: CustomStyles.textRegular12Px, overflow: TextOverflow.ellipsis, maxLines: 3)),
          ],
        ),
      ),
    ))
  );
}