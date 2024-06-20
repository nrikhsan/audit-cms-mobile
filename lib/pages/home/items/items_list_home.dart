import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bap/bap_page.dart';
import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/follow_up/follow_up_page.dart';
import 'package:audit_cms/pages/kka/kka_page.dart';
import 'package:audit_cms/pages/lha/lha_page.dart';
import 'package:audit_cms/pages/schedule/schedule_page.dart';
import 'package:flutter/material.dart';

//audit area
class ItemsListHomeAuditArea{
  int id;
  String nameMenu;
  Icon icon;

  ItemsListHomeAuditArea({required this.nameMenu, required this.icon, required this.id});
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

//audit region
class ItemsListHomeAuditRegion{
  int id;
  String nameMenu;
  Icon icon;

  ItemsListHomeAuditRegion({required this.nameMenu, required this.icon, required this.id});
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