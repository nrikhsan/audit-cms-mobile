import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

Widget formInputReportBranchOrUser(
    String label, TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    onChanged: (value) => textEditingController.text = value,
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

Widget formInputStarDateEndDate(BuildContext context, String label,
    TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    onChanged: (value) => textEditingController.text = value,
    readOnly: true,
    cursorColor: CustomColors.blue,
    decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range_rounded,
            color: CustomColors.grey, size: 20),
        hintStyle: CustomStyles.textMediumGrey15Px,
        hintText: label,
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
          firstDate: DateTime(2001),
          lastDate: DateTime(2100));
      if (picked != null) {
        textEditingController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    },
  );
}

void downloadReportAuditArea(String url, ControllerAuditArea controllerAuditArea, TextEditingController branchController, 
TextEditingController startDateController, TextEditingController endDateController)async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.storage].request();

  if (statuses[Permission.storage]!.isGranted) {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_audit_$timestamp.xlsx';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      try {
        await Dio().download(url, savePath,
            onReceiveProgress: (received, total) {
          if (total != -1) {
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        });
        snakcBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
      } catch (error) {
        throw Exception(error);
      }
    }
  } else {
    snakcBarMessageRed('Gagal', 'permintaan akses ditolak');
  }
}

void downloadReportAuditRegion(String url, ControllerAuditRegion controllerAuditRegion, TextEditingController startDateController, 
TextEditingController endDateController)async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.storage].request();

  if (statuses[Permission.storage]!.isGranted) {
    var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_audit_$timestamp.xlsx';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      try {
        await Dio().download(url, savePath,
            onReceiveProgress: (received, total) {
          if (total != -1) {
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        });
        snakcBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
      } catch (error) {
        throw Exception(error);
      }
    }
  } else {
    snakcBarMessageRed('Gagal', 'permintaan akses ditolak');
  }
}
