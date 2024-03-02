import 'package:audit_cms/pages/schedule/priority_schedule_page.dart';
import 'package:audit_cms/pages/schedule/reschedule_page.dart';
import 'package:audit_cms/pages/schedule/special_schedule_page.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: CustomColors.white,
          appBar: AppBar(
            backgroundColor: CustomColors.white,
            title: Text('Jadwal audit wilayah'),
            titleTextStyle: CustomStyles.textBold,
            titleSpacing: 5,
            leading: IconButton(icon: Icon(Icons.arrow_back_rounded, size: 25, color: CustomColors.black), onPressed: (){
              Navigator.pop(context);
            }),
            automaticallyImplyLeading: false,
            bottom: TabBar(
              controller: _tabController,
                isScrollable: false,
                automaticIndicatorColorAdjustment: true,
                splashBorderRadius: BorderRadius.circular(10),
                indicatorColor: CustomColors.blue,
                labelStyle: CustomStyles.textRegular,
                labelPadding: EdgeInsets.all(5),
                onTap:  (index){
                setState(() {
                  _tabController.index = index;
                });
                },
                tabs: [
                  Tab(
                    child: Text('Jadwal utama', style: TextStyle(
                        color: _tabController.index == 0 ? CustomColors.blue : CustomColors.grey)),
                  ),
                  Tab(
                    child: Text('Jadwal khusus', style: TextStyle(
                        color: _tabController.index == 1 ? CustomColors.blue : CustomColors.grey)),
                  ),
                  Tab(
                    child: Text('Reschedule', style: TextStyle(
                        color: _tabController.index == 2 ? CustomColors.blue : CustomColors.grey)),
                  ),
                ]),
          ),
          body: TabBarView(
            controller: _tabController,
              dragStartBehavior: DragStartBehavior.start,
              children: [
                PrioritySchedulePage(),
                SpecialSchedulePage(),
                ReschedulePage(),
              ]
          ),
        )
    );
  }
}
