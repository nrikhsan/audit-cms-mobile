import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

Widget formInputRealizationFollowUp(
    TextEditingController realizationController) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: realizationController,
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

Widget formInputRegarding(
    TextEditingController explanationPenaltyController) {
  return TextField(
    controller: explanationPenaltyController,
    cursorColor: CustomColors.blue,
    maxLines: 5,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan perihal...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputAuditee(
    TextEditingController auditeeLeaderController, String labelText) {
  return TextField(
    controller: auditeeLeaderController,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: labelText,
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
    cursorColor: CustomColors.blue,
    maxLines: 3,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan alasan...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputExplanationNoPenalty(
    TextEditingController explanationNoPenaltyController) {
  return TextField(
    controller: explanationNoPenaltyController,
    cursorColor: CustomColors.blue,
    maxLines: 3,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan alasan...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget formInputcharCossPenalty(TextEditingController lossController, {required String symbol}) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: lossController,
    cursorColor: CustomColors.blue,
    inputFormatters: [
      CurrencyTextInputFormatter.currency(
        locale: 'id_ID',
        decimalDigits: 0,
        symbol: 'Rp'
      )
    ],
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan nominal kerugian...',

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}