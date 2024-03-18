import 'dart:async';
import 'package:audit_cms/pages/bap/bap_page.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/follow_up/follow_up_page.dart';
import 'package:audit_cms/pages/kka/kka_page.dart';
import 'package:audit_cms/pages/lha/lha_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helper/styles/custom_styles.dart';
import '../schedule/schedule_page.dart';
import 'items/items_list_home.dart';

//audit area
class HomePageAuditArea extends StatefulWidget {
  const HomePageAuditArea({super.key});

  @override
  State<HomePageAuditArea> createState() => _HomePageAuditAreaState();
}

class _HomePageAuditAreaState extends State<HomePageAuditArea> {

  bool hideALlMenu = false;

  final List<ItemsListHomeAuditArea> listHome = [
    ItemsListHomeAuditArea(
        id: 1,
        nameMenu: 'Jadwal',
        icon: const Icon(Icons.schedule_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditArea(
        id: 2,
        nameMenu: 'LHA',
        icon: const Icon(Icons.content_paste_search_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditArea(
        id: 3,
        nameMenu: 'KKA',
        icon: const Icon(Icons.paste_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditArea(
        id: 4,
        nameMenu: 'Klarifikasi',
        icon: const Icon(Icons.class_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditArea(
        id: 5,
        nameMenu: 'Tdk lanjut',
        icon: const Icon(Icons.follow_the_signs_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditArea(
        id: 6,
        nameMenu: 'BAP',
        icon: const Icon(Icons.book_rounded,
            size: 30, color: CustomColors.orange)),
    ];

  String currentTime = '';
  String currentDate = '';
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
      _updateDate();
    });
  }

  void _updateTime() {
    setState(() {
      currentTime = DateFormat.Hm().format(DateTime.now());
    });
  }

  void _updateDate() {
    setState(() {
      currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());
    currentTime = DateFormat.Hm().format(DateTime.now());

    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Audit CMS'),
          titleTextStyle: CustomStyles.textBold18Px,
          titleSpacing: 15,
          leading: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/images/logo.png')),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              color: CustomColors.white,
              margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: CustomColors.lightGrey),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CMS MAJU SEJAHTERA',
                        style: CustomStyles.textBold15Px),
                    const SizedBox(height: 10),
                    Text('Presensi', style: CustomStyles.textRegular13Px),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: CustomColors.blue,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.date_range_rounded,
                                      color: CustomColors.white, size: 20),
                                  const SizedBox(width: 10),
                                  Text(currentDate,
                                      style: CustomStyles.textMediumWhite15Px),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.schedule_rounded,
                                      color: CustomColors.white, size: 15),
                                  const SizedBox(width: 10),
                                  Text(currentTime,
                                      style: CustomStyles.textRegularWhite13Px),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 15, top: 25),
                    child: Text('Main menu', style: CustomStyles.textBold18Px)),

                GestureDetector(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 25, right: 15),
                      child: Text('Lihat semua', style: CustomStyles.textMediumGrey15Px)),
                  onTap: (){
                    showModalAllMenu(context, listHome);
                  },
                )
              ],
            ),
            SizedBox(
              height: 125,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listHome.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        width: 100,
                        child: Card(
                            shape: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: CustomColors.lightGrey,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            color: CustomColors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      final id = listHome[index].id;
                                      if (id == 1) {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const SchedulePageAuditArea()));
                                      }else if(id == 2){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const LhaPageAuditArea()));
                                      }else if(id == 3){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const KkaPageAuditArea()));
                                      }else if(id == 4){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const ClarificationPageAuditArea()));
                                      }else if(id == 6){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const BapAuditAreaPage()));
                                      }else if(id == 5){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const FollowUpPageAuditArea()));
                                      }
                                    },
                                    icon: listHome[index].icon,
                                  ),
                                  Text(listHome[index].nameMenu,
                                      style: CustomStyles.textBoldGrey13Px),
                                ],
                              ),
                            )),
                      );
                    }),
              ),
            ),
          ],
        )));
  }

  void showModalAllMenu(BuildContext context, List<ItemsListHomeAuditArea> listHome) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            elevation: 0,
            title: const Text('Semua menu'),
            titleTextStyle: CustomStyles.textBold18Px,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.red,
                  shape: CustomStyles.customRoundedButton
                ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Kembali', style: CustomStyles.textMediumWhite15Px)
              )
            ],
            content: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  top: 10, bottom: MediaQuery
                  .of(context).viewInsets.bottom + 50),
              child: ListView.builder(
                  itemCount: listHome.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index){
                    return GestureDetector(
                      child: ListTile(
                        title: Text(listHome[index].nameMenu, style: CustomStyles.textMediumGrey15Px),
                        leading: IconButton(
                            onPressed: (){
                              final id = listHome[index].id;
                              if (id == 1) {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const SchedulePageAuditArea()));
                              }else if(id == 2){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const LhaPageAuditArea()));
                              }else if(id == 3){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const KkaPageAuditArea()));
                              }else if(id == 4){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const ClarificationPageAuditArea()));
                              }else if(id == 6){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const BapAuditAreaPage()));
                              }else if(id == 5){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const FollowUpPageAuditArea()));
                              }
                            },
                            icon: listHome[index].icon
                        ),
                      ),
                      onTap: (){
                        final id = listHome[index].id;
                        if (id == 1) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const SchedulePageAuditArea()));
                        }else if(id == 2){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const LhaPageAuditArea()));
                        }else if(id == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const KkaPageAuditArea()));
                        }else if(id == 4){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ClarificationPageAuditArea()));
                        }else if(id == 6){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const BapAuditAreaPage()));
                        }else if(id == 5){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const FollowUpPageAuditArea()));
                        }
                      },
                    );
                  }
              )
            ),
          );
        }
    );
  }
}


//audit region
class HomePageAuditRegion extends StatefulWidget {
  const HomePageAuditRegion({super.key});

  @override
  State<HomePageAuditRegion> createState() => _HomePageAuditRegionState();
}

class _HomePageAuditRegionState extends State<HomePageAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
