import 'package:audit_cms/pages/home/home_page.dart';
import 'package:audit_cms/pages/profile/profile_page.dart';
import 'package:audit_cms/pages/report/report_page.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int currentIndex = 0;
  final List<Widget> listPage = [
    HomePage(),
    ReportPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    if(mounted){
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: listPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
          elevation: 3,
          selectedItemColor: CustomColors.blue,
          backgroundColor: CustomColors.white,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          selectedLabelStyle: CustomStyles.textRegular,
          unselectedItemColor: CustomColors.grey,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: 'Laporan'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profil'
            )
          ]
      ),
    );
  }
}
