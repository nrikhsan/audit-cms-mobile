import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/navigation_controller.dart';
import '../../helper/styles/custom_styles.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../report/report_page.dart';

//audit area
class BotNavePageAuditArea extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  BotNavePageAuditArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (navigationController.tabIndex.value) {
          case 0:
            return const HomePageAuditArea();
          case 1:
            return const ReportPageAuditArea();
          case 2:
            return const ProfilePageAuditArea();
          default:
            return const ProfilePageAuditArea();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: navigationController.tabIndex.value,
        elevation: 3,
        selectedItemColor: CustomColors.blue,
        selectedLabelStyle: CustomStyles.textMedium13Px,
        unselectedLabelStyle: CustomStyles.textMedium13Px,
        unselectedFontSize: 13,
        selectedFontSize: 13,
        backgroundColor: CustomColors.white,
        onTap: navigationController.changeTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_rounded, size: 25),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 25),
            label: 'Profile',
          ),
        ],
      )),
    );
  }
}


//audit region
class BotNavAuditRegion extends StatelessWidget {
  const BotNavAuditRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


