import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget formInputStarDateEndDate(BuildContext context, String label,
    TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
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

//sudah d fixing
void downloadReportClarificationAuditArea(String url, int? branchId, TextEditingController startDateController, TextEditingController endDateController) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_klairifkasi_$timestamp.xlsx';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
          queryParameters: {
            'branch_id': branchId,
            'start_date': startDateController.text,
            'end_date': endDateController.text
          },
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
            }
          },
        );
        snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
      } catch (error) {
        if (error is DioError) {
          if (error.response != null) {
            print('Server responded with error: ${error.response!.statusCode}');
            print('Response data: ${error.response!.data}');
          } else {
            print('Dio error: $error');
          }
        } else {
          print('Error: $error');
        }
        snackBarMessageRed('Gagal', 'Terjadi kesalahan saat mengunduh laporan');
      }
    }
}

//sudah di fixing
void downloadReportLhaAuditArea(String url, TextEditingController startDateController, TextEditingController endDateController) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
        String saveName = 'laporan_lha_$timestamp.pdf';
        String savePath = dir.path + "/$saveName";
        print(savePath);

        final token = await TokenManager.getToken();
        dio.options.headers = {'Authorization': 'Bearer $token'};
        try {
          await dio.download(
            url,
            savePath,
            queryParameters: {
              'start_date': startDateController.text,
              'end_date': endDateController.text
            },
            onReceiveProgress: (received, total) {
              if (total != -1) {
                print((received / total * 100).toStringAsFixed(0) + "%");
              }
            },
          );
          snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
        } catch (error) {
          if (error is DioError) {
            if (error.response != null) {
              print('Server responded with error: ${error.response!.statusCode}');
              print('Response data: ${error.response!.data}');
            } else {
              print('Dio error: $error');
            }
          } else {
            print('Error: $error');
          }
          snackBarMessageRed('Gagal', 'Terjadi kesalahan saat mengunduh laporan');
        }
      }
}

//sudah di fixing
void downloadReportClarificationAuditRegion(String url, TextEditingController startDateController, TextEditingController endDateController) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_klairifkasi_$timestamp.xlsx';
      String savePath = dir.path + "/$saveName";

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
          queryParameters: {
            'start_date': startDateController.text,
            'end_date': endDateController.text
          },
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
            }
          },
        );
        snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
      } catch (error) {
        if (error is DioError) {
          if (error.response != null) {
            print('Server responded with error: ${error.response!.statusCode}');
            print('Response data: ${error.response!.data}');
          } else {
            print('Dio error: $error');
          }
        } else {
          print('Error: $error');
        }
        snackBarMessageRed('Gagal', 'Terjadi kesalahan saat mengunduh laporan');
      }
    }
}

//sudah di fixing
void downloadReportLhaAuditRegion(String url, TextEditingController startDateController, TextEditingController endDateController) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = 'laporan_lha_$timestamp.pdf';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
          queryParameters: {
            'start_date': startDateController.text,
            'end_date': endDateController.text
          },
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
            }
          },
        );
        snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
      } catch (error) {
        if (error is DioError) {
          if (error.response != null) {
            print('Server responded with error: ${error.response!.statusCode}');
            print('Response data: ${error.response!.data}');
          } else {
            print('Dio error: $error');
          }
        } else {
          print('Error: $error');
        }
        snackBarMessageRed('Gagal', 'Terjadi kesalahan saat mengunduh laporan');
      }
    }
  } 