import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/input_bap_page.audit_region.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class InputIdentificationClarificationAuditRegionPage extends StatefulWidget {
  const InputIdentificationClarificationAuditRegionPage({super.key});

  @override
  State<InputIdentificationClarificationAuditRegionPage> createState() => _InputIdentificationClarificationAuditRegionPageState();
}

class _InputIdentificationClarificationAuditRegionPageState extends State<InputIdentificationClarificationAuditRegionPage> {
  
  final ControllerAuditRegion controllerAuditRegion = Get.find();

  int? _evaluation;
  int? _loss;
  final TextEditingController lossController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  int? _followUp;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Identifikasi klarifikasi'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 5,
          leading: IconButton(
            onPressed: (){
              Get.back();
            }, 
            icon: const Icon(Icons.arrow_back, color: CustomColors.black, size: 25)
          ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),
              Text('Evaluasi klarifikasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip( 
                      label: Text(index == 0 ? 'Tidak ada' : 'Ada', style: CustomStyles.textMedium15Px), 
                      selected: _evaluation == index,
                      onSelected: (bool selected){
                        setState(() {
                          _evaluation = selected ? index: null;
                          print(_evaluation);
                        });
                      },
                    );
                  }
                ).toList()
              ),

              const SizedBox(height: 15),
              Text('Kerugian : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),
              
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak ada' : 'Ada', style: CustomStyles.textMedium15Px), 
                      selected: _loss == index,
                      onSelected: (bool selected){
                        setState(() {
                          _loss = selected ? index : null;
                          print(_loss);
                        });
                      },
                    );
                  }
                ).toList(),
              ),

              const SizedBox(height: 15),
              if(_loss == 1)
              TextField(
                controller: lossController,
                keyboardType: TextInputType.number,
                onChanged: (loss) => lossController.text = loss,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan kerugian...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),


              const SizedBox(height: 15),
              Text('Deskripsi atau rekomendasi : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              TextField(
                controller: descController,
                maxLines: 5,
                onChanged: (desc) => descController.text = desc,
                cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                    labelStyle: CustomStyles.textMediumGrey15Px,
                    labelText: 'Masukan deskripsi atau rekomendasi...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: CustomColors.grey)
                    )
                ),
              ),

              const SizedBox(height: 15),
              Text('Tindak lanjut : ', style: CustomStyles.textBold15Px),
              const SizedBox(height: 15),

              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  2, (index){
                    return ChoiceChip(
                      label: Text(index == 0 ? 'Tidak' : 'Ya', style: CustomStyles.textMedium15Px), 
                      selected: _followUp == index,
                      onSelected: (bool selected){
                        setState(() {
                          _followUp = selected ? index : null;
                          print(_followUp);
                        });
                      },
                    );
                  }
                ).toList()
              ),

              const SizedBox(height: 15),
              Obx((){
                final clarification = controllerAuditRegion.documentClarificationAuditRegion.value;
                if(clarification == null){
                  return const Center(child: SpinKitCircle(color: CustomColors.blue));
                }else{
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    Text('File klarifikasi', style: CustomStyles.textMedium15Px),
                    const SizedBox(height: 15),
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
                                  await showDialogPdfClarificationPdfAuditRegion(clarification.clarificationDoc, context);
                                },
                                child: Text('Lihat', style: CustomStyles.textMediumWhite15Px)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.blue),
                            onPressed: () async {
                              if (_evaluation == null || _loss == null || descController.text.isEmpty || _followUp == null) {
                                Get.snackbar('Alert', 'Tidak boleh ada field yang kosong', snackPosition: SnackPosition.TOP, backgroundColor: CustomColors.red, colorText: CustomColors.white);
                              }else if(_followUp == 1){
                                controllerAuditRegion.inputIdentificatinClarificationAuditRegion(_evaluation!, lossController.text, descController.text, _followUp!);
                                Get.to(() => const InputBapPageAuditRegion());
                                print('${_evaluation}, ${lossController.text}, ${descController.text}, ${_followUp}');
                              }else if (_followUp == 0){
                                Get.offAll(() => BotNavAuditRegion());
                              }
                            },
                          child: Text('Simpan identifikasi', style: CustomStyles.textMediumWhite15Px)
                        ),
                      ),
                    ],
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDialogPdfClarificationPdfAuditRegion(String? clarificationDoc, BuildContext context) async {
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
      ),
    );
  }
}