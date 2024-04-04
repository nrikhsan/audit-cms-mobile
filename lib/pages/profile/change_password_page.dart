import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//audit area
class ChangePasswordPageAuditArea extends StatefulWidget {
  const ChangePasswordPageAuditArea({super.key});

  @override
  State<ChangePasswordPageAuditArea> createState() => _ChangePasswordPageAuditAreaState();
}

class _ChangePasswordPageAuditAreaState extends State<ChangePasswordPageAuditArea> {

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Ganti kata sandi'),
        titleTextStyle: CustomStyles.textBold18Px,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: (){
                Get.back();
              }, 
            icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: oldPasswordController,
              onChanged: (oldPassword) => oldPasswordController.text = oldPassword,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                  hintText: 'Masukan password lama anda...',
                  hintStyle: CustomStyles.textRegularGrey13Px,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                    )
              )
            ),

            const SizedBox(height: 15),

            TextField(
              controller: newPasswordController,
              onChanged: (newPassword) => newPasswordController.text = newPassword,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                  hintText: 'Masukan password baru anda...',
                  hintStyle: CustomStyles.textRegularGrey13Px,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                    )
              )
            ),

            const SizedBox(height: 15),

            TextField(
              controller: confirmPasswordController,
              onChanged: (configrm) => confirmPasswordController.text = configrm,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi password baru anda...',
                  hintStyle: CustomStyles.textRegularGrey13Px,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                    )
              )
            ),

            const SizedBox(height: 20),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      if (oldPasswordController.text.isEmpty || newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                        Get.snackbar('Gagal', 'Tidak boleh ada field yang kosong', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(oldPasswordController.text == newPasswordController.text){
                        Get.snackbar('Gagal', 'Kata sandi harus berbeda dari yang sebelumnya', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(newPasswordController.text.length < 6 || confirmPasswordController.text.length < 6){
                        Get.snackbar('Gagal', 'Kata sandi harus lebih dari 6 karakter', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(confirmPasswordController.text == newPasswordController.text){
                        Get.snackbar('Gagal', 'Kata sandi berhasil dirubah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
                        controllerAuditArea.changePasswordAuditArea(oldPasswordController.text, newPasswordController.text);
                        Navigator.pop(context);
                      }else{
                       Get.snackbar('Gagal', 'Kata sandi Tidak sesuai', colorText: CustomColors.white, backgroundColor: CustomColors.red); 
                      }
                    },
                    child:
                        Text('Simpan', style: CustomStyles.textMediumWhite15Px)
                  ),
              )
          ],
        )
      ),
      )
    );
  }
}


//audit wilayah
class ChangePasswordPageAuditRegion extends StatefulWidget {
  final int id;
  const ChangePasswordPageAuditRegion({super.key, required this.id});

  @override
  State<ChangePasswordPageAuditRegion> createState() => _ChangePasswordPageAuditRegionState();
}

class _ChangePasswordPageAuditRegionState extends State<ChangePasswordPageAuditRegion> {

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ControllerAuditRegion controllerAuditRegion = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Ganti kata sandi'),
        titleTextStyle: CustomStyles.textBold18Px,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: (){
                Get.back();
              }, 
            icon: const Icon(Icons.arrow_back_rounded, color: CustomColors.black, size: 25)
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: oldPasswordController,
              onChanged: (oldPassword) => oldPasswordController.text = oldPassword,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                  hintText: 'Masukan password lama anda...',
                  hintStyle: CustomStyles.textRegularGrey13Px,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                    )
              )
            ),

            const SizedBox(height: 15),

            TextField(
              controller: newPasswordController,
              onChanged: (newPassword) => newPasswordController.text = newPassword,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                  hintText: 'Masukan password baru anda...',
                  hintStyle: CustomStyles.textRegularGrey13Px,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                    )
              )
            ),

            const SizedBox(height: 15),

            TextField(
              controller: confirmPasswordController,
              onChanged: (confirm) => confirmPasswordController.text = confirm,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi password baru anda...',
                  hintStyle: CustomStyles.textRegularGrey13Px,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: CustomColors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: CustomColors.grey)
                    )
              )
            ),

            const SizedBox(height: 20),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      if (oldPasswordController.text.isEmpty || newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                        Get.snackbar('Gagal', 'Tidak boleh ada field yang kosong', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(oldPasswordController.text == newPasswordController.text){
                        Get.snackbar('Gagal', 'Kata sandi harus berbeda dari yang sebelumnya', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(newPasswordController.text.length < 6 || confirmPasswordController.text.length < 6){
                        Get.snackbar('Gagal', 'Kata sandi harus lebih dari 6 karakter', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(confirmPasswordController.text == newPasswordController.text){
                        Get.snackbar('Gagal', 'Kata sandi berhasil dirubah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
                        controllerAuditRegion.changePasswordAuditRegions(widget.id, oldPasswordController.text, newPasswordController.text, confirmPasswordController.text);
                        Navigator.pop(context);
                      }else{
                       Get.snackbar('Gagal', 'Kata sandi Tidak sesuai', colorText: CustomColors.white, backgroundColor: CustomColors.red); 
                      }
                    },
                    child:
                        Text('Simpan', style: CustomStyles.textMediumWhite15Px)
                  ),
              ) 
          ],
        )
      ),
    );
  }
}
