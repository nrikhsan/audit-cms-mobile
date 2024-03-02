import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/lha/LhaPage.dart';
import 'package:audit_cms/pages/schedule/schedule_page.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';

class ItemsHome extends StatelessWidget {

  const ItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //schedule
                  Column(
                    children: [
                      GestureDetector(
                          child: Card(
                            color: CustomColors.white,
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.schedule_rounded, size: 30, color: CustomColors.orange),
                            ),
                          ),
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulePage()));
                        },
                        ),

                      SizedBox(height: 10),
                      Text('Jadwal', style: CustomStyles.textMediumBlack13Px)
                    ],
                  ),

                  //LHA
                  Column(
                    children: [
                      GestureDetector(
                          child: Card(
                            color: CustomColors.white,
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.content_paste_search_rounded, size: 30, color: CustomColors.orange),
                            ),
                          ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LhaPage()));
                        },
                      ),

                      SizedBox(height: 10),
                      Text('LHA', style: CustomStyles.textMediumBlack13Px)
                    ],
                  ),

                  //KKA
                  Column(
                    children: [
                      GestureDetector(
                          child: Card(
                            color: CustomColors.white,
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.post_add_rounded, size: 30, color: CustomColors.orange),
                            ),
                          )
                      ),

                      SizedBox(height: 10),
                      Text('KKA', style: CustomStyles.textMediumBlack13Px)
                    ],
                  ),

                  //clarification
                  Column(
                    children: [
                      GestureDetector(
                          child: Card(
                            color: CustomColors.white,
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.comment_rounded, size: 30, color: CustomColors.orange),
                            ),
                          ),
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ClarificationPage()));
                        },
                      ),

                      SizedBox(height: 10),
                      Text('Klarifikasi', style: CustomStyles.textMediumBlack13Px)
                    ],
                  ),

                  //BAP
                  Column(
                    children: [
                      GestureDetector(
                          child: Card(
                            color: CustomColors.white,
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.book_online_rounded, size: 30, color: CustomColors.orange),
                            ),
                          )
                      ),

                      SizedBox(height: 10),
                      Text('BAP', style: CustomStyles.textMediumBlack13Px)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
