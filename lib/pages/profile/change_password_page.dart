import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//audit area
class ChangePasswordPageAuditArea extends StatefulWidget {
  final int id;
  final String oldpassword;
  const ChangePasswordPageAuditArea({super.key, required this.id, required this.oldpassword});

  @override
  State<ChangePasswordPageAuditArea> createState() => _ChangePasswordPageAuditAreaState();
}

class _ChangePasswordPageAuditAreaState extends State<ChangePasswordPageAuditArea> {

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final ControllerAuditArea controllerAuditArea = Get.find();

  @override
  void initState() {
    oldPasswordController.text = widget.oldpassword;
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    super.dispose();
  }

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
              readOnly: true,
              onChanged: (oldPassword) => oldPasswordController.text = oldPassword,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
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

            const SizedBox(height: 20),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      if (newPasswordController.text == oldPasswordController.text) {
                        Get.snackbar('Gagal', 'Kata sandi harus beda dari yang sebelumnya', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(newPasswordController.text.length < 6){
                        Get.snackbar('Gagal', 'Kata sandi harus lebih dari 6 karakter', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else{
                        Get.snackbar('Gagal', 'Kata sandi berhasil dirubah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
                        controllerAuditArea.changePasswordAuditArea(widget.id, oldPasswordController.text, newPasswordController.text);
                        Navigator.pop(context);
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


//audit wilayah
class ChangePasswordPageAuditRegion extends StatefulWidget {
  final int id;
  final String oldpassword;
  const ChangePasswordPageAuditRegion({super.key, required this.id, required this.oldpassword});

  @override
  State<ChangePasswordPageAuditRegion> createState() => _ChangePasswordPageAuditRegionState();
}

class _ChangePasswordPageAuditRegionState extends State<ChangePasswordPageAuditRegion> {

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final ControllerAuditRegion controllerAuditRegion = Get.find();

  @override
  void initState() {
    oldPasswordController.text = widget.oldpassword;
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    super.dispose();
  }

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
              readOnly: true,
              onChanged: (oldPassword) => oldPasswordController.text = oldPassword,
              cursorColor: CustomColors.blue,
                decoration: InputDecoration(
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

            const SizedBox(height: 20),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      if (newPasswordController.text == oldPasswordController.text) {
                        Get.snackbar('Gagal', 'Kata sandi harus beda dari yang sebelumnya', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else if(newPasswordController.text.length < 6){
                        Get.snackbar('Gagal', 'Kata sandi harus lebih dari 6 karakter', colorText: CustomColors.white, backgroundColor: CustomColors.red);
                      }else{
                        Get.snackbar('Gagal', 'Kata sandi berhasil dirubah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
                        controllerAuditRegion.changePasswordAuditRegions(widget.id, oldPasswordController.text, newPasswordController.text);
                        Navigator.pop(context);
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