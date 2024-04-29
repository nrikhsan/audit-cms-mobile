import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget formInputLimitEvaluation(
    BuildContext context, TextEditingController limitEvaluationController) {
  return TextField(
    readOnly: true,
    controller: limitEvaluationController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range_rounded,
            color: CustomColors.grey, size: 20),
        hintStyle: CustomStyles.textMediumGrey15Px,
        hintText: 'Masukan batasan evaluasi...',
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
        limitEvaluationController.text =
            DateFormat('yyyy-MM-dd').format(picked);
      }
    },
  );
}

Widget formInputAllClarification(
    String label, TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: label,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputLoss(TextEditingController lossController) {
  return TextField(
    controller: lossController,
    keyboardType: TextInputType.number,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan kerugian...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputDesc(TextEditingController descController) {
  return TextField(
    controller: descController,
    maxLines: 5,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan deskripsi atau rekomendasi...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}
