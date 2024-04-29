import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//audit area
class EditProfilePageAuditArea extends StatefulWidget {
  final int id;
  final String email;
  final String username;
  const EditProfilePageAuditArea({super.key, required this.id, required this.email, required this.username});

  @override
  State<EditProfilePageAuditArea> createState() => _EditProfilePageAuditAreaState();
}

class _EditProfilePageAuditAreaState extends State<EditProfilePageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.email;
    usernameController.text = widget.username;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              controller: usernameController,
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
                      showDialogEditProfileAuditArea(widget.id, emailController.text, usernameController.text);
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
  
  void showDialogEditProfileAuditArea(int id, String email, String username) {
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
                        if(email.isEmpty || username.isEmpty){
                          Get.snackbar('Gagal', 'field tidak boleh kosong', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }else if(email.isEmail){
                          controllerAuditArea.editProfileUserAuditArea(email, username);
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
  final int id;
  final String email;
  final String username;
  const EditProfilePageAuditRegion({super.key, required this.id, required this.email, required this.username});

  @override
  State<EditProfilePageAuditRegion> createState() => _EditProfilePageAuditRegionState();
}

class _EditProfilePageAuditRegionState extends State<EditProfilePageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.email;
    usernameController.text = widget.username;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              controller: usernameController,
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
                      showDialogEditProfileAuditRegion(widget.id, emailController.text, usernameController.text);
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
  void showDialogEditProfileAuditRegion(int id, String email, String username) {
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
                        if(email.isEmpty || username.isEmpty){
                          Get.snackbar('Gagal', 'field tidak boleh kosong', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                        }else if(email.isEmail){
                          controllerAuditRegion.editProfileUserAuditRegion(email, username);
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