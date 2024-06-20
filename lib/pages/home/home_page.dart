import 'dart:async';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/pages/bap/bap_page.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/follow_up/follow_up_page.dart';
import 'package:audit_cms/pages/home/items/item_dashboard_audit_area.dart';
import 'package:audit_cms/pages/home/items/item_dashboard_item_audit_region.dart';
import 'package:audit_cms/pages/home/items/item_dashboard_total_audit_area.dart';
import 'package:audit_cms/pages/home/items/item_dashboard_total_audit_region.dart';
import 'package:audit_cms/pages/kka/kka_page.dart';
import 'package:audit_cms/pages/lha/lha_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final ControllerAuditArea controllerAuditArea = Get.put(ControllerAuditArea(Get.find()));

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

  int? selectedDashboard = 0;
  

  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());
    currentTime = DateFormat.Hm().format(DateTime.now());

    return RefreshIndicator(
      onRefresh: ()async{
        controllerAuditArea.getFollowUpDashboard();
        controllerAuditArea.getFindingDashboard();
        controllerAuditArea.getNominalDashboard();
        controllerAuditArea.getSummary();
        controllerAuditArea.getRangking();
        controllerAuditArea.getDivisionDashboard();
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Audit area CMS'),
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
                    Text('CMS MAJU SEJAHTRA',
                        style: CustomStyles.textBold15Px),
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
                    showModalAllMenuAuditArea(context, listHome);
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

          //dashboard
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text('Dashboard', style: CustomStyles.textBold18Px),
          ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        value: controllerAuditArea.selectedMonthTotal.value,
                        items: controllerAuditArea.months.map((int month) {
                          return DropdownMenuItem<int>(
                            value: month,
                            child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controllerAuditArea.selectedMonthTotal.value = newValue!;
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: controllerAuditArea.selectedYearTotal.value,
                        items: controllerAuditArea.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controllerAuditArea.selectedYearTotal.value = newValue!;
                        },
                      )),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        controllerAuditArea.getSummary();
                        controllerAuditArea.getRangking();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        controllerAuditArea.resetFilterDashboarTotal();
                        controllerAuditArea.getSummary();
                        controllerAuditArea.getRangking();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
              children: [
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: List.generate(4, (index){
                      return ChoiceChip(
                        label: Text(index == 0 ? 'Summary' : index == 1 ? 'Top 5' : index == 2 ? 'Bottom 5' : 'Tindak lanjut', style: CustomStyles.textMedium13Px), 
                        selected: selectedDashboard == index,
                        onSelected: (value){
                          setState(() {
                            selectedDashboard = index;
                          });
                        },
                      );
                    }).toList()
                )
              ],
            ),
            )
            ),
            const SizedBox(height: 20),

          //dashboard total
          Visibility(
            visible: selectedDashboard == 0 ? true : false,
            child: dashboardTotalWidget(controllerAuditArea)
          ),

          //dashboard rankings clarification
          Visibility(
            visible: selectedDashboard == 1 ? true : false,
            child: dashboardRangkingsTopFive(controllerAuditArea)
          ),

          Visibility(
            visible: selectedDashboard == 2 ? true : false,
            child: dashboardRangkingsTopSix(controllerAuditArea)
          ),

          //dashboard rangkings followUp
          Visibility(
            visible: selectedDashboard == 3 ? true : false,
            child: dashboardRangkingsFollowUp(controllerAuditArea)
          ),

          //dashboard finding status
          const SizedBox(height: 20),
          ItemDashboardFollowUp(controllerAuditArea: controllerAuditArea),

          //dashboard division
          ItemDivisionDashboardAuditArea(controllerAuditArea: controllerAuditArea),

          //dashboard findings
          ItemDashboardFindings(controllerAuditArea: controllerAuditArea),  

          //dashboard nominal
          ItemDashboardNominal(controllerAuditArea: controllerAuditArea),
          const SizedBox(height: 30),
        ])
      )
    ));
  }
}


//audit region
class HomePageAuditRegion extends StatefulWidget {
  const HomePageAuditRegion({super.key});

  @override
  State<HomePageAuditRegion> createState() => _HomePageAuditRegionState();
}

class _HomePageAuditRegionState extends State<HomePageAuditRegion> {

  final ControllerAuditRegion controllerAuditRegion = Get.put(ControllerAuditRegion(Get.find()));

  final List<ItemsListHomeAuditRegion> listHome = [
    ItemsListHomeAuditRegion(
        id: 1,
        nameMenu: 'Jadwal',
        icon: const Icon(Icons.schedule_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditRegion(
        id: 5,
        nameMenu: 'LHA',
        icon: const Icon(Icons.content_paste_search_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditRegion(
        id: 2,
        nameMenu: 'KKA',
        icon: const Icon(Icons.paste_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditRegion(
        id: 3,
        nameMenu: 'Klarifikasi',
        icon: const Icon(Icons.class_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditRegion(
        id: 6,
        nameMenu: 'Tdk lanjut',
        icon: const Icon(Icons.follow_the_signs_rounded,
            size: 30, color: CustomColors.orange)),
    ItemsListHomeAuditRegion(
        id: 4,
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

  int? selectedDashboard = 0;

  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());
    currentTime = DateFormat.Hm().format(DateTime.now());
    return RefreshIndicator(
      onRefresh: ()async{
        controllerAuditRegion.getFollowUpDashboard();
        controllerAuditRegion.getFindingDashboard();
        controllerAuditRegion.getNominalDashboard();
        controllerAuditRegion.getDivisionDashboard();
        controllerAuditRegion.getSummary();
        controllerAuditRegion.getRangking();
      },
      child: Scaffold(
       backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: const Text('Audit wilayah CMS'),
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
                    Text('CMS MAJU SEJAHTRA',
                        style: CustomStyles.textBold15Px),
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
                    showModalAllMenuAuditRegion(context, listHome);
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
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const SchedulePageAuditRegion()));
                                      }else if(id == 3){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const ClarificationPageAuditRegion()));
                                      }else if(id == 2){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const KkaPageAuditRegion()));
                                      }else if(id == 4){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const BapAuditRegionPage()));
                                      }else if(id == 5){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const LhaPageAuditRegion()));
                                      }else if(id == 6){
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const FollowUpPageAuditRegion()));
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

          //dashboard
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text('Dashboard', style: CustomStyles.textBold18Px),
          ),

            //dashboard finding status
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        value: controllerAuditRegion.selectedMonthTotal.value,
                        items: controllerAuditRegion.months.map((int month) {
                          return DropdownMenuItem<int>(
                            value: month,
                            child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controllerAuditRegion.selectedMonthTotal.value = newValue!;
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: controllerAuditRegion.selectedYearTotal.value,
                        items: controllerAuditRegion.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controllerAuditRegion.selectedYearTotal.value = newValue!;
                        },
                      )),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        controllerAuditRegion.getSummary();
                        controllerAuditRegion.getRangking();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        controllerAuditRegion.resetFilterDashboarTotal();
                        controllerAuditRegion.getSummary();
                        controllerAuditRegion.getRangking();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
              children: [
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: List.generate(4, (index){
                      return ChoiceChip(
                        label: Text(index == 0 ? 'Summary' : index == 1 ? 'Top 5' : index == 2 ? 'Bottom 5' : 'Tindak lanjut', style: CustomStyles.textMedium13Px), 
                        selected: selectedDashboard == index,
                        onSelected: (value){
                          setState(() {
                            selectedDashboard = index;
                          });
                        },
                      );
                    }).toList()
                )
              ],
            ),
            )
            ),
            const SizedBox(height: 20),

          //dashboard total
          Visibility(
            visible: selectedDashboard == 0 ? true : false,
            child: dashboardTotalWidgetAuditRegion(controllerAuditRegion)
          ),

          //dashboard rankings clarification
          Visibility(
            visible: selectedDashboard == 1 ? true : false,
            child: dashboardRangkingsTopFiveAuditRegion(controllerAuditRegion)
          ),

          Visibility(
            visible: selectedDashboard == 2 ? true : false,
            child: dashboardRangkingsTopSixAuditRegion(controllerAuditRegion)
          ),

          //dashboard rangkings followUp
          Visibility(
            visible: selectedDashboard == 3 ? true : false,
            child: dashboardRangkingsFollowUpAuditRegion(controllerAuditRegion)
          ),

          //dashboard division
          ItemDivisionDashboardAuditRegion(controllerAuditRegion: controllerAuditRegion),
          
          //dashboard finding status
          ItemDashboardFollowUpAuditRegion(controllerAuditRegion: controllerAuditRegion),

          // dashboard findings
          ItemDashboardFindingsAuditRegion(controllerAuditRegion: controllerAuditRegion),  

          // dashboard nominal
          ItemDashboardNominalAuditRegion(controllerAuditRegion: controllerAuditRegion),
          const SizedBox(height: 30),
          ],
        )
      )
    )
    );
  }
}
