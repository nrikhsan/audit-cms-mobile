import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/follow_up/follow_up_page.dart';
import 'package:audit_cms/pages/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//dashboard total
Widget cardMainSchedule(String total, String done, String title, String peresentage){
  return SizedBox(
    width: 200,
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
            Text(title, style: CustomStyles.textMedium15Px),
            const Divider(),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(total, style: CustomStyles.textRegular12Px),
                    const SizedBox(height: 5),
                    Text(done, style: CustomStyles.textRegular12Px),
                  ],
                ),
                Text(peresentage, style: CustomStyles.textBoldBlue18Px),
              ],
            ),
          ],
        ),
      ),
    ),
    onTap: (){
        Get.to(() => const SchedulePageAuditArea());
      },
    )
  );
}

Widget cardSpecialSchedule(String total, String done, String title, String peresentage){
  return SizedBox(
    width: 200,
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
            Text(title, style: CustomStyles.textMedium15Px),
            const Divider(),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(total, style: CustomStyles.textRegular12Px),
                    const SizedBox(height: 5),
                    Text(done, style: CustomStyles.textRegular12Px),
                  ],
                ),
                Text(peresentage, style: CustomStyles.textBoldBlue18Px),
              ],
            ),
          ],
        ),
      ),
    ),
    onTap: (){
        Get.to(() => const SchedulePageAuditArea());
      },
    )
  );
}

Widget cardClarification(String total, String done, String title, String peresentage){
  return SizedBox(
    width: 200,
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
            Text(title, style: CustomStyles.textMedium15Px),
            const Divider(),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(total, style: CustomStyles.textRegular12Px),
                    const SizedBox(height: 5),
                    Text(done, style: CustomStyles.textRegular12Px),
                  ],
                ),
                Text(peresentage, style: CustomStyles.textBoldBlue18Px),
              ],
            ),
          ],
        ),
      ),
    ),
    onTap: (){
        Get.to(() => const ClarificationPageAuditArea());
      },
    )
  );
}

Widget cardFollowUp(String total, String done, String title, String peresentage){
  return SizedBox(
    width: 200,
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
            Text(title, style: CustomStyles.textMedium15Px),
            const Divider(),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(total, style: CustomStyles.textRegular12Px),
                    const SizedBox(height: 5),
                    Text(done, style: CustomStyles.textRegular12Px),
                  ],
                ),
                Text(peresentage, style: CustomStyles.textBoldBlue18Px),
              ],
            ),
          ],
        ),
      ),
    ),
    onTap: (){
        Get.to(() => const FollowUpPageAuditArea());
      },
    )
  );
}

String getRoundedPercentage(double done, double total) {
  if (total == 0) {
    return '0%';
  }
  return '${((done / total) * 100).round()}%';
}

Widget dashboardTotalWidget(ControllerAuditArea controllerAuditArea){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      

            Obx((){
              if (controllerAuditArea.summary.value == null) {
                  return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
              } else {
                final mainSchedule = controllerAuditArea.summary.value?.schedule?.regular;
                final specialSchedule = controllerAuditArea.summary.value?.schedule?.special;
                final clarification = controllerAuditArea.summary.value?.clarification;
                final followUp = controllerAuditArea.summary.value?.followUp;

                String roundedPercentageMainSchedule = getRoundedPercentage(mainSchedule!.done!.toDouble(), mainSchedule.total!.toDouble());
                String roundedPercentageSpecialSchedule = getRoundedPercentage(specialSchedule!.done!.toDouble(), specialSchedule.total!.toDouble());
                String roundedPercentageClarification = getRoundedPercentage(clarification!.done!.toDouble(), clarification.total!.toDouble());
                String roundedPercentageFollowUp = getRoundedPercentage(followUp!.done!.toDouble(), followUp.total!.toDouble());

                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        cardMainSchedule(
                          'Total : ${mainSchedule.total ?? '-'}',
                          'Selesai : ${mainSchedule.done ?? '-'}',
                          'Jadwal utama',
                          roundedPercentageMainSchedule),
                        const SizedBox(width: 5),
                        cardSpecialSchedule(
                          'Total : ${specialSchedule.total ?? '-'}',
                          'Selesai : ${specialSchedule.done ?? '-'}',
                          'Jadwal khusus',
                          roundedPercentageSpecialSchedule),
                        const SizedBox(width: 5),
                        cardClarification(
                        'Total : ${clarification.total ?? '-'}',
                        'Selesai : ${clarification.done ?? '-'}',
                        'Klarifikasi',
                        roundedPercentageClarification),
                        const SizedBox(width: 5),
                        cardFollowUp(
                          'Total : ${followUp.total ?? '-'}',
                          'Selesai : ${followUp.done ?? '-'}',
                          'Tindak lanjut',
                          roundedPercentageFollowUp),
                      ],
                    ),
                  ),
                );
              }
            }),
    ],
  );
}


Widget dashboardRangkingsTopFive(ControllerAuditArea controllerAuditArea){
  return Obx((){
    if (controllerAuditArea.rangkings.value == null) {
      return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controllerAuditArea.rangkings.value?.clarification?.top?.length,
        itemBuilder: (_, index){
          final rangking = controllerAuditArea.rangkings.value?.clarification?.top;
          return ListTile(
            title: index < 3 ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${index +1}. ${rangking?[index].name}', style: CustomStyles.textMedium15Px),
                const Icon(Icons.sentiment_very_satisfied_outlined, color: CustomColors.green, size: 25)
              ],
            ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index +1}. ${rangking?[index].name}', style: CustomStyles.textMedium15Px),
                  const Icon(Icons.sentiment_very_satisfied_outlined, color: CustomColors.green, size: 25)
                ],
              ),
            subtitle: const Divider(),
          );
        },
      );
    }
  });
}

Widget dashboardRangkingsTopSix(ControllerAuditArea controllerAuditArea){
  return Obx((){
    if (controllerAuditArea.rangkings.value == null) {
      return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
    } else {
     return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controllerAuditArea.rangkings.value?.clarification?.bottom?.length,
        itemBuilder: (_, index){
          final rangking = controllerAuditArea.rangkings.value?.clarification?.bottom;
          return ListTile(
            title: index < 3 ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${index +1}. ${rangking?[index].name}', style: CustomStyles.textMedium15Px),
                const Icon(Icons.sentiment_dissatisfied_rounded, color: CustomColors.red, size: 25)
              ],
            ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index +1}. ${rangking?[index].name}', style: CustomStyles.textMedium15Px),
                  const Icon(Icons.sentiment_dissatisfied_rounded, color: CustomColors.red, size: 25)
                ],
              ),
            subtitle: const Divider(),
          );
        },
      ); 
    }
  });
}

Widget dashboardRangkingsFollowUp(ControllerAuditArea controllerAuditArea){
  return Obx((){
    if (controllerAuditArea.rangkings.value == null) {
      return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controllerAuditArea.rangkings.value?.followUp?.length,
        itemBuilder: (_, index){
          final rangking = controllerAuditArea.rangkings.value?.followUp;
          return ListTile(
            title: index < 3 ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${index +1}. ${rangking?[index].name}', style: CustomStyles.textMedium15Px),
                const Icon(Icons.sentiment_very_satisfied_outlined, color: CustomColors.green, size: 25)
              ],
            ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index +1}. ${rangking?[index].name}', style: CustomStyles.textMedium15Px),
                  const Icon(Icons.sentiment_dissatisfied_rounded, color: CustomColors.red, size: 25)
                ],
              ),
            subtitle: const Divider(),
          );
        },
      ); 
    }
  });
}