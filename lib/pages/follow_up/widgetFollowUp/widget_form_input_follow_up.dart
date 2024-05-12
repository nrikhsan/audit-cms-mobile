import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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

Widget formInputExplanationPenalty(
    TextEditingController explanationPenaltyController) {
  return TextField(
    controller: explanationPenaltyController,
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

Widget formInputcharCossPenalty(TextEditingController lossController, {required String symbol}) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: lossController,
    cursorColor: CustomColors.blue,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      if(symbol.isNotEmpty) currencyInputFormatter(symbol: symbol),
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

TextInputFormatter currencyInputFormatter({required String symbol}) {
  return TextInputFormatter.withFunction((oldValue, newValue) {
    String newText = newValue.text;
    newText = _formatCurrency(newText);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  });
}

String _formatCurrency(String value) {
  if (value.isEmpty) return '';
  final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  String result = formatter.format(double.parse(value));
  return result;
}

String convertToServerString(String formattedValue) {
  return formattedValue.replaceAll(RegExp(r'[^0-9]'), '');
}