import 'package:audit_cms/data/constant/app_constants.dart';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/clarification/input_identification_clarification_page.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:audit_cms/permission/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void filterClarificationAuditArea(
    BuildContext context,
    TextEditingController startDateController,
    TextEditingController endDateController,
    TextEditingController auditorController,
    ControllerAuditArea controllerAuditArea,
    TextEditingController branchEditingController) {
  showModalBottomSheet(
      backgroundColor: CustomColors.white,
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: CustomColors.white,
                  title: const Text('Filter data klarifikasi'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  actions: [
                    IconButton(
                        onPressed: () {
                          auditorController.clear();
                          startDateController.clear();
                          endDateController.clear();
                          controllerAuditArea.resetFilterClarification();
                        },
                        icon: const Icon(Icons.refresh_rounded,
                            color: CustomColors.grey, size: 25)),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Dengan auditor :', style: CustomStyles.textMedium15Px),
                const SizedBox(height: 15),
                TextField(
                  controller: auditorController,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    hintText: 'Auditor...',
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.lightGrey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.lightGrey)),
                  ),
                ),

                  const SizedBox(height: 20),
                  Text('Dengan cabang :', style: CustomStyles.textMedium15Px),
                  const SizedBox(height: 15),
                  Obx(() => SizedBox(
                    width: double.maxFinite,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<int>(
                        isExpanded: true,
                        hint: Text(
                          'Pilih Cabang',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controllerAuditArea.branchForFilterAuditArea
                            .map((item) => DropdownMenuItem(
                                  value: item.id,
                                  child: Text('${item.name}', style: CustomStyles.textMedium13Px)
                                ))
                            .toList(),
                          value: controllerAuditArea.branchCla.value,
                          onChanged: (value) {
                            controllerAuditArea.branchCla.value = value;
                            
                          },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          width: 400,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 400,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: branchEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                              right: 5
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: branchEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Cari cabang...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            final nameBranch = controllerAuditArea.branchForFilterAuditArea.firstWhere((element) => element.id == item.value);
                            return nameBranch.name!.isCaseInsensitiveContains(searchValue.toUpperCase());
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            branchEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),),
                const SizedBox(height: 20),
                Text('Dengan tanggal :', style: CustomStyles.textMedium15Px),
                const SizedBox(height: 20),
                TextField(
                  controller: startDateController,
                  readOnly: true,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    hintText: 'Mulai dari...',
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.lightGrey, size: 25),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.lightGrey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.lightGrey)),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));

                    if (picked != null) {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: endDateController,
                  readOnly: true,
                  cursorColor: CustomColors.blue,
                  decoration: InputDecoration(
                    hintText: 'Sampai dengan...',
                    hintStyle: CustomStyles.textMediumGrey15Px,
                    suffixIcon: const Icon(Icons.date_range_rounded,
                        color: CustomColors.lightGrey, size: 25),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: CustomColors.lightGrey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: CustomColors.lightGrey)),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));

                    if (picked != null) {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CustomStyles.customRoundedButton,
                            backgroundColor: CustomColors.blue),
                        onPressed: () {
                          controllerAuditArea.filterClarificationAuditArea(
                              auditorController.text,
                              controllerAuditArea.branchCla.value,
                              startDateController.text,
                              endDateController.text);
                          Get.back();
                        },
                        child: Text('Simpan data filter',
                            style: CustomStyles.textMediumWhite15Px)))
              ],
            ),
          ),
        );
      });
}


void showBottomSheetFilterClarificationAuditRegion(
    BuildContext context,
    TextEditingController startDateController,
    TextEditingController endDateController,
    ControllerAuditRegion controllerAuditRegion) {
  showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(
              top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              left: 15,
              right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: const Text('Filter data jadwal'),
                  titleTextStyle: CustomStyles.textBold18Px,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                ),
                const SizedBox(height: 10),
                TextField(
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
                          borderSide:
                              const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.grey))),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));
                    if (picked != null) {
                      startDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextField(
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
                          borderSide:
                              const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.grey))),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        cancelText: 'Tidak',
                        confirmText: 'ya',
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2100));
                    if (picked != null) {
                      endDateController.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: [
                    startDateController.text.isNotEmpty ||
                            endDateController.text.isNotEmpty
                        ? SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.red),
                                onPressed: () {
                                  startDateController.clear();
                                  endDateController.clear();
                                  controllerAuditRegion
                                      .resetFilterClarification();
                                  Get.back();
                                },
                                child: Text('Reset data filter',
                                    style: CustomStyles.textMediumWhite15Px)))
                        : SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () {
                                  controllerAuditRegion
                                      .filterClarification(
                                          startDateController.text,
                                          endDateController.text);
                                  Get.back();
                                },
                                child: Text('Simpan data filter',
                                    style: CustomStyles.textMediumWhite15Px)),
                          )
                  ],
                )
              ],
            ),
          ),
        );
      });
}

void showDialogPdfClarificationPdfAuditArea(BuildContext context, String title, String fileName) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: CustomColors.white,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
              width: double.maxFinite,
              height: 400,
              child: Scaffold(
                appBar: AppBar(
                  titleSpacing: 5,
                  backgroundColor: CustomColors.white,
                  title: Text(title),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: FutureBuilder(
                  future: getToken(),
                  builder: (_, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: SpinKitCircle(color: CustomColors.blue));
                    } else {
                      print(fileName);
                      final data = snapshot.data;
                    return SfPdfViewer.network(
                      headers: {'Authorization': 'Bearer $data'},
                      '${AppConstant.documentClarification}$fileName',
                      pageSpacing: 0,
                      );
                    }
                  }
                )
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {
                if (await requestPermission(Permission.storage) == true) {
                  downloadFileClarification('${AppConstant.downloadClarification}$fileName', fileName);
                } else {
                  showSnackbarPermission(context);
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
}

// sudah di fixing
void downloadFileClarification(String url, String fileName) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      // String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = '$fileName';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
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
void downloadFileClarificationAuditRegion(String url, ControllerAuditRegion controllerAuditRegion, String fileName) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      // String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = '$fileName';
      String savePath = dir.path + "/$saveName";
      print(savePath);

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
            }
          },
        );
        snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
        controllerAuditRegion.pagingControllerClarification.refresh();
        
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

Future<String?>getToken()async{
  return await TokenManager.getToken();
}

void downloadFileClarificationAuditArea(String url, String fileName, ControllerAuditArea controllerAuditArea) async {
  final Dio dio = Dio();
  var dir = await DownloadsPathProvider.downloadsDirectory;
    if (dir != null) {
      // String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      String saveName = fileName;
      String savePath = dir.path + "/$saveName";
      print(savePath);

      final token = await TokenManager.getToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      try {
        await dio.download(
          url,
          savePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
            }
          },
        );
        snackBarMessageGreen('Berhasil', '$saveName berhasil di unduh');
        controllerAuditArea.pagingControllerClarificationAuditArea.refresh();
        
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

void uploadClarificationAuditArea(BuildContext context, int id, ControllerAuditArea controllerAuditArea) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: AppBar(
              title: Text('Upload klarifikasi', style: CustomStyles.textBold18Px),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                  controllerAuditArea.selectedFileName.value = '';
                }, icon: const Icon(Icons.close, color: CustomColors.grey, size: 25))
              ],
            ),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Obx(() => Text(controllerAuditArea.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                TextButton(
                  onPressed: () =>
                      controllerAuditArea.pickFileClarificationAuditArea(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 20),

                Obx(() => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.blue,
                      shape: CustomStyles.customRoundedButton
                    ),
                    onPressed: controllerAuditArea.selectedFileName.value.isNotEmpty
                    ? () {
                        controllerAuditArea.uploadClarificationAuditArea(controllerAuditArea.selectedFileName.value,
                        id);
                          
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => InputIdentifcationClarificationAuditArea(clarificationId: id)),
                            );
                         }
                    : null,
                    child: Text('Upload', style: CustomStyles.textMediumWhite13Px),
                    )),

                    const SizedBox(height: 15),
              ],
            ),
            
          );
        }
      );
  }

void uploadClarificationAuditRegion(BuildContext context, int? id, ControllerAuditRegion controllerAuditRegion) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            title: AppBar(
              title: Text('Upload klarifikasi', style: CustomStyles.textBold18Px),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                  controllerAuditRegion.selectedFileName.value = '';
                }, icon: const Icon(Icons.close, color: CustomColors.grey, size: 25))
              ],
            ),
            titleTextStyle: CustomStyles.textBold18Px,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Obx(() => Text(controllerAuditRegion.selectedFileName.value, style: CustomStyles.textRegularGrey13Px)),

                TextButton(
                  onPressed: () =>
                      controllerAuditRegion.pickFileClarificationAuditRegion(),
                  child: Text('Choose File', style: CustomStyles.textMediumGreen15Px),
                ),

                const SizedBox(height: 20),

                Obx(() => SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.blue,
                      shape: CustomStyles.customRoundedButton
                    ),
                        onPressed: controllerAuditRegion.selectedFileName.value.isNotEmpty
                        ? () {
                              controllerAuditRegion.uploadClarificationAuditRegion(controllerAuditRegion.selectedFileName.value,
                              id);
                              Get.off(() => InputIdentificationClarificationAuditRegionPage(clarificationId: id));
                           }
                        : null,
                        child: Text('Upload', style: CustomStyles.textMediumWhite13Px),
                      ),
                )),
                const SizedBox(height: 15)
              ],
            ),
          );
        }
      );
  }
