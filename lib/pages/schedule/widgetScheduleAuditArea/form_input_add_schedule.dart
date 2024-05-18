import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget formInputAddScheduleStartDate(
    BuildContext context, TextEditingController startDateController) {
  return TextField(
    readOnly: true,
    controller: startDateController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range_rounded,
            color: CustomColors.grey, size: 20),
        hintStyle: CustomStyles.textMediumGrey15Px,
        hintText: 'Mulai dari...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
    onTap: () async {
      DateTime? picked = await showDatePicker(
          cancelText: 'Tidak',
          confirmText: 'ya',
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
      if (picked != null) {
        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    },
  );
}



Widget formInputAddScheduleEndDate(
    BuildContext context, TextEditingController endDateController) {
  return TextField(
    readOnly: true,
    controller: endDateController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range_rounded,
            color: CustomColors.grey, size: 20),
        hintStyle: CustomStyles.textMediumGrey15Px,
        hintText: 'Sampai dengan...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
    onTap: () async {
      DateTime? picked = await showDatePicker(
          cancelText: 'Tidak',
          confirmText: 'ya',
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
      if (picked != null) {
        endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    },
  );
}

Widget formInputDescriptionSchedule(TextEditingController scheduleController) {
  return TextField(
    controller: scheduleController,
    cursorColor: CustomColors.blue,
    maxLines: 3,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Uraian jadwal...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputEditScheduleStartDate(
    BuildContext context, TextEditingController startDateController, String date) {
  return TextField(
    readOnly: true,
    controller: startDateController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range_rounded,
            color: CustomColors.grey, size: 20),
        hintStyle: CustomStyles.textMediumGrey15Px,
        hintText: 'Mulai dari...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
    onTap: () async {
      DateTime? picked = await showDatePicker(
          cancelText: 'Tidak',
          confirmText: 'ya',
          context: context,
          initialDate: DateTime.parse(date),
          firstDate: DateTime.parse(date),
          lastDate: DateTime(2100));
      if (picked != null) {
        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    },
  );
}

Widget formInputEditScheduleEndDate(
    BuildContext context, TextEditingController startDateController, String date) {
  return TextField(
    readOnly: true,
    controller: startDateController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range_rounded,
            color: CustomColors.grey, size: 20),
        hintStyle: CustomStyles.textMediumGrey15Px,
        hintText: 'Mulai dari...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
    onTap: () async {
      DateTime? picked = await showDatePicker(
          cancelText: 'Tidak',
          confirmText: 'ya',
          context: context,
          initialDate: DateTime.parse(date),
          firstDate: DateTime.parse(date),
          lastDate: DateTime(2100));
      if (picked != null) {
        startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    },
  );
}
