import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';

Widget formInputUsernameOrEmail(
    String label, TextEditingController textEditingController, IconData icon) {
  return TextField(
      controller: textEditingController,
      onChanged: (value) => textEditingController.text = value,
      cursorColor: CustomColors.blue,
      decoration: InputDecoration(
          suffixIcon: Icon(icon, color: CustomColors.grey, size: 20),
          labelStyle: CustomStyles.textMediumGrey15Px,
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: CustomColors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: CustomColors.grey)
            )
          )
        );
}
