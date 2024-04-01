import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';

Widget formInputRealizationFollowUp(
    TextEditingController realizationController) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: realizationController,
    onChanged: (realization) => realizationController.text = realization,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Realisasi...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputExplanationPenalty(
    TextEditingController explanationPenaltyController) {
  return TextField(
    controller: explanationPenaltyController,
    onChanged: (explanationPenalty) =>
        explanationPenaltyController.text = explanationPenalty,
    cursorColor: CustomColors.blue,
    maxLines: 5,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan alasan sanksi...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}