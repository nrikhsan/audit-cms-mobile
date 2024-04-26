import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';

Widget formInputDescFinding(
    TextEditingController descriptionFindingsController) {
  return TextField(
    controller: descriptionFindingsController,
    onChanged: (desc) => descriptionFindingsController.text = desc,
    cursorColor: CustomColors.blue,
    maxLines: 3,
    decoration: InputDecoration(
        labelStyle: CustomStyles.textMediumGrey15Px,
        labelText: 'Masukan uraian temuan...',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.grey))),
  );
}

Widget fomrInputRecommendationOrSuggest(
    TextEditingController recomendationController, String label) {
  return TextField(
    controller: recomendationController,
    onChanged: (value) => recomendationController.text = value,
    cursorColor: CustomColors.blue,
    maxLines: 3,
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

Widget formEditLha(TextEditingController lhaDescriptionController, String label) {
  return TextField(
      controller: lhaDescriptionController,
      onChanged: (value) => lhaDescriptionController.text = value,
      maxLines: 5,
      cursorColor: CustomColors.blue,
      decoration: InputDecoration(
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
