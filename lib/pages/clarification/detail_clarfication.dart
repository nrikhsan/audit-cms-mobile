import 'package:audit_cms/data/controller/controllers.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//audit area
class DetailClarificationPageAuditArea extends StatefulWidget {
  final int id;
  const DetailClarificationPageAuditArea({super.key, required this.id});

  @override
  State<DetailClarificationPageAuditArea> createState() =>
      _DetailClarificationPageAuditAreaState();
}

class _DetailClarificationPageAuditAreaState
    extends State<DetailClarificationPageAuditArea> {
  final ControllerAllData controllerAllData = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAllData.getDetailClarificationAuditArea(widget.id);

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: const Text('Detail klarifikasi'),
        titleTextStyle: CustomStyles.textBold18Px,
        backgroundColor: CustomColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded,
              color: CustomColors.black, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          final detail = controllerAllData.detailClarificationAuditArea.value;
          if (detail == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Auditor :', style: CustomStyles.textBold15Px),
                          const SizedBox(height: 5),
                          Text('${detail.auditor}',
                              style: CustomStyles.textRegular13Px),
                          const SizedBox(height: 20),
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.blue),
                          onPressed: () {
                            showDialogStatusClarificationAuditArea();
                          },
                          child: Text('Ubah status',
                              style: CustomStyles.textMediumWhite15Px))
                    ],
                  ),
                  Text('Cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.branch}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Tanggal klarifikasi :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.clarificationDate}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('No. klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.noClarification}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('No. BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.noBap}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Kategori klarifikasi :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.clarificationCategory}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Batasan evaluasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.limitEvaluation}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Divisi yang diaudi :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.divisionOrAreaBeingAudited}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Bagian :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.part}', style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text(
                    'Atasan langsung :',
                    style: CustomStyles.textBold15Px,
                  ),
                  const SizedBox(height: 5),
                  Text('${detail.directSupervisor}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Kepada yth/jabatan :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.directSupervisor}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('Prioritas temuan :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.findingPriority}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Evaluasi klarifikasi :',
                      style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text(
                      '${detail.clarificationIdentidication!.clarificationEvaluation}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Nominal kerugian :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.clarificationIdentidication!.nominalLoss}',
                      style: CustomStyles.textRegular13Px),
                  const SizedBox(height: 20),
                  Text('Alasan :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${detail.clarificationIdentidication!.reason}',
                      style: CustomStyles.textRegular13Px,
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 20),
                  Text('File klarifikasi :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 140,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.green),
                                onPressed: () async {
                                  await showDialogPdfClarificationPdfAuditArea(
                                      detail.clarificationDoc, context);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('File BAP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 140,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: CustomColors.lightGrey)),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Text('File', style: CustomStyles.textMedium15Px),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CustomStyles.customRoundedButton,
                                    backgroundColor: CustomColors.blue),
                                onPressed: () async {
                                  await showDialogBapAuditArea(
                                      detail.bapDoc, context);
                                },
                                child: Text('Lihat',
                                    style: CustomStyles.textMediumWhite15Px))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Future<void> showDialogPdfClarificationPdfAuditArea(
      String? clarificationDoc, BuildContext context) async {
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
                  title: const Text('File klarifikasi'),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: SfPdfViewer.network(
                  clarificationDoc!,
                  pageSpacing: 0,
                ),
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {
                Map<Permission, PermissionStatus> statuses =
                    await [Permission.storage].request();

                if (statuses[Permission.storage]!.isGranted) {
                  var dir = await DownloadsPathProvider.downloadsDirectory;
                  if (dir != null) {
                    String saveName = 'Klarifikasi_audit.pdf';
                    String savePath = dir.path + "/$saveName";
                    print(savePath);

                    try {
                      await Dio().download(clarificationDoc, savePath,
                          onReceiveProgress: (received, total) {
                        if (total != -1) {
                          print((received / total * 100).toStringAsFixed(0) +"%");
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('File berhasil di unduh',
                            style: CustomStyles.textMediumWhite15Px),
                        backgroundColor: CustomColors.green,
                      ));
                    } catch (error) {
                      throw Exception(error);
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Permintaan izin ditolak',
                          style: CustomStyles.textMedium15Px)));
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }

  showDialogBapAuditArea(String? bapDoc, BuildContext context) async {
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
                  title: const Text('File BAP'),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded,
                          color: CustomColors.black, size: 25)),
                  titleTextStyle: CustomStyles.textBold18Px,
                  automaticallyImplyLeading: false,
                ),
                body: SfPdfViewer.network(
                  bapDoc!,
                  pageSpacing: 0,
                ),
              )),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  shape: CustomStyles.customRoundedButton,
                  backgroundColor: CustomColors.blue),
              onPressed: () async {
                Map<Permission, PermissionStatus> statuses =
                    await [Permission.storage].request();

                if (statuses[Permission.storage]!.isGranted) {
                  var dir = await DownloadsPathProvider.downloadsDirectory;
                  if (dir != null) {
                    String saveName = 'bap_audit.pdf';
                    String savePath = dir.path + "/$saveName";
                    print(savePath);

                    try {
                      await Dio().download(bapDoc, savePath,
                          onReceiveProgress: (received, total) {
                        if (total != -1) {
                          print((received / total * 100).toStringAsFixed(0) +"%");
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('File berhasil di unduh',
                            style: CustomStyles.textMediumWhite15Px),
                        backgroundColor: CustomColors.green,
                      ));
                    } catch (error) {
                      throw Exception(error);
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Permintaan izin ditolak',
                          style: CustomStyles.textMedium15Px)));
                }
              },
              child: Text('Download', style: CustomStyles.textMediumWhite15Px))
        ],
      ),
    );
  }

  void showDialogStatusClarificationAuditArea() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (_) {
          return Container(
              width: double.maxFinite,
              height: 200,
              padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 50),
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Ubah status klarifikasi'),
                    centerTitle: true,
                    titleTextStyle: CustomStyles.textBold18Px,
                    automaticallyImplyLeading: false,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                              backgroundColor: CustomColors.red
                            ),
                          onPressed: () {
                          
                        }, 
                      child: Text('Tutup klarifikasi', style: CustomStyles.textMediumWhite15Px)
                    ),
                  )
                ],
              )
            );
        });
  }
}

//audit region
class DetailClarificationAuditRegion extends StatefulWidget {
  const DetailClarificationAuditRegion({super.key});

  @override
  State<DetailClarificationAuditRegion> createState() =>
      _DetailClarificationAuditRegionState();
}

class _DetailClarificationAuditRegionState
    extends State<DetailClarificationAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
