import 'dart:async';

import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/data/controller/auth/controller_auth.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/auth/login_page.dart';
import 'package:audit_cms/pages/profile/change_password_page.dart';
import 'package:audit_cms/pages/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:swipe_refresh/swipe_refresh.dart';


//audit area
class ProfilePageAuditArea extends StatefulWidget {
  const ProfilePageAuditArea({super.key});

  @override
  State<ProfilePageAuditArea> createState() => _ProfilePageAuditAreaState();
}

class _ProfilePageAuditAreaState extends State<ProfilePageAuditArea> {

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));
  final ControllerAuth controllerAuth = Get.put(ControllerAuth(Get.find()));

  StreamController<SwipeRefreshState>refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerAuditArea.getDetailUserAuditArea();
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Profil pengguna'),
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
      body: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
        controllerAuditArea.getDetailUserAuditArea();
      },
      children: [
        Padding(
        padding: const EdgeInsets.all(15),
        child: Obx((){
          final user = controllerAuditArea.detailUserAuditArea.value;
          if (user == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          }else{
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('NIP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.nip}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Nama :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.fullname}', style: CustomStyles.textRegular13Px),

                  Text('Username :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.username}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Email :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.email}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        Get.to(() => EditProfilePageAuditArea(id: user.id!, email: user.email!, username: user.username!));
                        },
                      child: Text('Edit profil', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),

                  const SizedBox(height: 10),
                  
                  Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.password_rounded, color: CustomColors.black, size: 25),
                        title: Text('Ubah kata sandi', style: CustomStyles.textBold15Px),
                        onTap: (){
                          Get.to(() => const ChangePasswordPageAuditArea());
                        },
                      ),
                    ],
                  ),
              ],
            );
          }
        })
      ),
      ])
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
                        Get.offAll(() => const LoginPage());
                        controllerAuth.logout();
                       
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

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));
  final ControllerAuth controllerAuth = Get.put(ControllerAuth(Get.find()));

  
  StreamController<SwipeRefreshState>refreshController = StreamController();

  @override
  void initState() {
    refreshController.add(SwipeRefreshState.loading);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    controllerAuditRegion.getDetailUserAuditRegion();
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: const Text('Profil pengguna'),
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
      body: SwipeRefresh.material(stateStream: refreshController.stream, onRefresh: (){
        controllerAuditRegion.getDetailUserAuditRegion();
      },
      children: [
        Padding(
        padding: const EdgeInsets.all(15),
        child: Obx((){
          final user = controllerAuditRegion.detailUserAuditRegion.value;
          if (user == null) {
            return const Center(child: SpinKitCircle(color: CustomColors.blue));
          }else{
            refreshController.add(SwipeRefreshState.hidden);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('NIP :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.nip}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Nama :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.fullname}', style: CustomStyles.textRegular13Px),

                  Text('Username :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.username}', style: CustomStyles.textRegular13Px),

                  const SizedBox(height: 15),
                  Text('Email :', style: CustomStyles.textBold15Px),
                  const SizedBox(height: 5),
                  Text('${user.email}', style: CustomStyles.textRegular13Px),
                  

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        Get.to(() => EditProfilePageAuditRegion(id: user.id!, email: user.email!, username: user.username!));
                      },
                      child: Text('Edit profil', style: CustomStyles.textMediumWhite15Px)
                    ),
                  ),

                  const SizedBox(height: 10),
                  
                  Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.password_rounded, color: CustomColors.black, size: 25),
                        title: Text('Ubah kata sandi', style: CustomStyles.textBold15Px),
                        onTap: (){
                          Get.to(() => const ChangePasswordPageAuditRegion());
                        },
                      ),
                    ],
                  ),
              ],
            );
          }
        })
      ),
      ],)
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
                        Get.offAll(() => const LoginPage());
                        controllerAuth.logout();
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

