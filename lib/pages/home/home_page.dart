import 'dart:async';
import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/formatter.dart';
import 'package:audit_cms/pages/bap/bap_page.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/follow_up/follow_up_page.dart';
import 'package:audit_cms/pages/kka/kka_page.dart';
import 'package:audit_cms/pages/lha/lha_page.dart';
import 'package:fl_chart/fl_chart.dart';
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

  int touchedIndex = -1;
  

  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());
    currentTime = DateFormat.Hm().format(DateTime.now());

    return RefreshIndicator(
      onRefresh: ()async{
        controllerAuditArea.getFollowUpDashboard();
        controllerAuditArea.getFindingDashboard();
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

          const SizedBox(height: 20),

          //dashboard finsing status
          Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Status temuan audit', style: CustomStyles.textBold18Px)),

            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: controllerAuditArea.selectedMonthFollowUp.value,
                        items: controllerAuditArea.months.map((int month) {
                          return DropdownMenuItem<int>(
                            value: month,
                            child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controllerAuditArea.selectedMonthFollowUp.value = newValue!;
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: controllerAuditArea.selectedYearFollowUp.value,
                        items: controllerAuditArea.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controllerAuditArea.selectedYearFollowUp.value = newValue!;
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
                        controllerAuditArea.getFollowUpDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        controllerAuditArea.resetFilterDashboarFollowUp();
                        controllerAuditArea.getFollowUpDashboard();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 15/10,
              child: Obx((){
                return PieChart(
                PieChartData(
                  sections: controllerAuditArea.followUpDataDashboard,
                ),
              );
              })
            ),

            const SizedBox(height: 30),
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Keterangan :', style: CustomStyles.textMedium15Px)),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: Scaffold(
                          backgroundColor: CustomColors.blue,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Temuan dengan status OPEN', style: CustomStyles.textRegular13Px),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: Scaffold(
                          backgroundColor: CustomColors.red,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Temuan dengan status CLOSE', style: CustomStyles.textRegular13Px),
                    ],
                  ),
                ],
              )
            ),


            const SizedBox(height: 30),
            //dashboard findings
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Jumlah temuan audit', style: CustomStyles.textBold18Px)),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 20/13,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Obx(() {
                  return LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta){
                              switch (value.toInt()) {
                              case 0:
                                return const Text('1');
                              case 1:
                                return const Text('2');
                              case 2:
                                return const Text('3');
                              case 3:
                                return const Text('4');
                              case 4:
                                return const Text('5');
                              case 5:
                                return const Text('6');
                              case 6:
                                return const Text('7');
                              case 7:
                                return const Text('8');
                              case 8:
                                return const Text('9');
                              case 9:
                                return const Text('10');
                              case 10:
                                return const Text('11');
                              case 11:
                                return const Text('12');
                              default:
                                return const Text('');
                              }
                            }
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)
                        )
                      ),
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                              for (var i = 0; i < controllerAuditArea.findingsDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  controllerAuditArea.findingsDashboard[i].total!.toDouble(),
                                )
                            ],
                          barWidth: 2,
                          color: CustomColors.blue,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.blue.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(controllerAuditArea.findingsDashboard.length, (index) => index),
                          ),
                      ],
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                final textStyle = CustomStyles.textMediumWhite15Px;
                                return LineTooltipItem(
                                  '${controllerAuditArea.findingsDashboard[touchedSpot.spotIndex].total} temuan dibulan ${controllerAuditArea.findingsDashboard[touchedSpot.spotIndex].month}',
                                  textStyle,
                                );
                              }).toList();
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),
            // dashboard nominal
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Nominal temuan audit', style: CustomStyles.textBold18Px)),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 20/13,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Obx(() {
                  return LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta){
                              switch (value.toInt()) {
                              case 0:
                                return const Text('1');
                              case 1:
                                return const Text('2');
                              case 2:
                                return const Text('3');
                              case 3:
                                return const Text('4');
                              case 4:
                                return const Text('5');
                              case 5:
                                return const Text('6');
                              case 6:
                                return const Text('7');
                              case 7:
                                return const Text('8');
                              case 8:
                                return const Text('9');
                              case 9:
                                return const Text('10');
                              case 10:
                                return const Text('11');
                              case 11:
                                return const Text('12');
                              default:
                                return const Text('');
                              }
                            }
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)
                        )
                      ),
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                              for (var i = 0; i < controllerAuditArea.nominalDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  controllerAuditArea.nominalDashboard[i].total!.toDouble(),
                                )
                            ],
                          barWidth: 2,
                          color: CustomColors.orange,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.orange.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(controllerAuditArea.nominalDashboard.length, (index) => index),
                          ),
                      ],
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                final textStyle = CustomStyles.textMediumWhite13Px;
                                return LineTooltipItem(
                                  'Nominal temuan di bulan ${controllerAuditArea.nominalDashboard[touchedSpot.spotIndex].month} sebanyak\n${CurrencyFormat.convertToIdr(controllerAuditArea.nominalDashboard[touchedSpot.spotIndex].total, 0)}',
                                  textStyle,
                                );
                              }).toList();
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                    ),
                  );
                }),
              ),
            ),

            

            const SizedBox(height: 30),
          ],
        )
      )
    ));
  }

  void showModalAllMenuAuditArea(BuildContext context, List<ItemsListHomeAuditArea> listHome) {
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
                            onPressed: (){},
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

  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());
    currentTime = DateFormat.Hm().format(DateTime.now());
    return Scaffold(
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
          ],
        )
      )
    );
  }

  void showModalAllMenuAuditRegion(BuildContext context, List<ItemsListHomeAuditRegion> listHome) {
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
                            onPressed: (){},
                            icon: listHome[index].icon
                        ),
                      ),
                      onTap: (){
                        final id = listHome[index].id;
                        if (id == 1) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const SchedulePageAuditRegion()));
                        }else if(id == 2){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const KkaPageAuditRegion()));
                        }else if(id == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ClarificationPageAuditRegion()));
                        }else if(id == 4){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const BapAuditRegionPage()));
                        }else if(id == 5){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const LhaPageAuditRegion()));
                        }else if(id == 6){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const FollowUpPageAuditRegion()));
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
