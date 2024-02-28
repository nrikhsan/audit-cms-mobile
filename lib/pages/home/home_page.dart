import 'dart:async';

import 'package:audit_cms/pages/home/itemHome/items_home.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String currentTime = '';

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      currentTime = DateFormat.Hm().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {

    String currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
      appBar: AppBar(
        backgroundColor: CustomColors.lightGrey,
        title: Text('Waldi'),
        titleTextStyle: CustomStyles.textBold,
        titleSpacing: 5,
        leading: Icon(Icons.account_circle, size: 35, color: CustomColors.grey),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, top: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PT. CMS MAJU SEJAHTERA',
                      style: CustomStyles.textBold15Px),
                  SizedBox(height: 10),
                  Text('Presensi', style: CustomStyles.textRegular),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: CustomColors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range_rounded, color: CustomColors.white, size: 20),
                              SizedBox(width: 10),
                              Text(currentDate, style: CustomStyles.textMediumWhite),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.schedule_rounded, color: CustomColors.white, size: 15),
                              SizedBox(width: 10),
                              Text(currentTime, style: CustomStyles.textRegularWhite15px),
                            ],
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
