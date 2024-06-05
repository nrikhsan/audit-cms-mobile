import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//audit area
class EditProfilePageAuditArea extends StatefulWidget {
  final String? email;
  final String? fullName;
  const EditProfilePageAuditArea({super.key, required this.email, required this.fullName});

  @override
  State<EditProfilePageAuditArea> createState() => _EditProfilePageAuditAreaState();
}

class _EditProfilePageAuditAreaState extends State<EditProfilePageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.email!;
    fullNameController.text = widget.fullName!;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
        appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Edit profil'),
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
              controller: fullNameController,
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
              controller: emailController,
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

            const SizedBox(height: 20),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      showDialogEditProfileAuditArea(emailController.text, fullNameController.text);
                    },
                    child:
                        Text('Edit profil', style: CustomStyles.textMediumWhite15Px)
                  ),
              )
          ],
        )
      ),
    );
  }
  
  void showDialogEditProfileAuditArea(String email, String fullName) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Alert'),
            titleTextStyle: CustomStyles.textBold18Px,
            content: const Text('Simpan perubahan?'),
            contentTextStyle: CustomStyles.textMedium15Px,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red
                          ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Tidak',
                          style: CustomStyles.textMediumWhite15Px)),
                          
                  const SizedBox(width: 5),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green
                          ),
                      onPressed: () {
                        if(email.isEmpty || fullName.isEmpty){
                          Get.snackbar('Gagal', 'field tidak boleh kosong', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }else if(email.isEmail){
                          controllerAuditArea.editProfileUserAuditArea(email, fullName);
                          Get.back();
                          
                        }else{
                          Get.snackbar('Gagal', 'Penulisan email tidak sesuai', snackPosition: SnackPosition.TOP,
                              colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }
                      },
                      child: Text('Ya',
                          style: CustomStyles.textMediumWhite15Px))
                ],
              )
            ],
          );
        }
      );
  }
}

//audit region
class EditProfilePageAuditRegion extends StatefulWidget {
  final String? email;
  final String? fullName;
  const EditProfilePageAuditRegion({super.key, required this.email, required this.fullName});

  @override
  State<EditProfilePageAuditRegion> createState() => _EditProfilePageAuditRegionState();
}

class _EditProfilePageAuditRegionState extends State<EditProfilePageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.email!;
    fullNameController.text = widget.fullName!;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
        appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Edit profil'),
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
              controller: fullNameController,
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
              controller: emailController,
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

            const SizedBox(height: 20),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton),
                    onPressed: () {
                      showDialogEditProfileAuditRegion(emailController.text, fullNameController.text);
                    },
                    child:
                        Text('Edit profil', style: CustomStyles.textMediumWhite15Px)
                  ),
              )
          ],
        )
      ),
    );
  }
  void showDialogEditProfileAuditRegion(String email, String fullName) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Alert'),
            titleTextStyle: CustomStyles.textBold18Px,
            content: const Text('Simpan perubahan?'),
            contentTextStyle: CustomStyles.textMedium15Px,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.red
                          ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Tidak',
                          style: CustomStyles.textMediumWhite15Px)),
                          
                  const SizedBox(width: 5),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CustomStyles.customRoundedButton,
                          backgroundColor: CustomColors.green
                          ),
                      onPressed: () {
                        if(email.isEmpty || fullName.isEmpty){
                          Get.snackbar('Gagal', 'field tidak boleh kosong', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }else if(email.isEmail){
                          controllerAuditRegion.editProfileUserAuditRegion(email, fullName);
                          Get.back();
                         
                        }else{
                          Get.snackbar('Gagal', 'Penulisan email tidak sesuai', snackPosition: SnackPosition.TOP,
                              colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }
                      },
                      child: Text('Ya',
                          style: CustomStyles.textMediumWhite15Px))
                ],
              )
            ],
          );
        }
      );
  }
}