import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/auth/login_page.dart';
import 'package:audit_cms/pages/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


//audit area
class ProfilePageAuditArea extends StatefulWidget {
  const ProfilePageAuditArea({super.key});

  @override
  State<ProfilePageAuditArea> createState() => _ProfilePageAuditAreaState();
}

class _ProfilePageAuditAreaState extends State<ProfilePageAuditArea> {

  final ControllerAuditArea controllerAllData = Get.find();

  @override
  Widget build(BuildContext context) {
    controllerAllData.getDetailUser();
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Detail pengguna'),
        titleTextStyle: CustomStyles.textBold18Px,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              logout();
            }, 
            icon: const Icon(Icons.logout_rounded, color: CustomColors.red, size: 25)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx((){
          final user = controllerAllData.detailUserAuditArea.value;
          if (user == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          }else{
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.username}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Email :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.email}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('NIP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.nip}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Area :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.area}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Kantor cabang :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.branchOffice}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePageAuditArea(id: user.id!, email: user.email!, username: user.username!)));
                      },
                      child: Text('Edit profil', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),
              ],
            );
          }
        })
      ),
    );
  }
  
  void logout() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Alert'),
            titleTextStyle: CustomStyles.textBold18Px,
            content: const Text('Apakah anda yakin untuk keluar dari akun anda?'),
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
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
                        Get.snackbar('Berhasil', 'Logout berhasil', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.green);
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
class ProfilePageAuditRegion extends StatefulWidget {
  const ProfilePageAuditRegion({super.key});

  @override
  State<ProfilePageAuditRegion> createState() => _ProfilePageAuditRegionState();
}

class _ProfilePageAuditRegionState extends State<ProfilePageAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

