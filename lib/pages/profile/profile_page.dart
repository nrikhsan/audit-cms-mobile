import 'package:audit_cms/data/helper/token_manager.dart';
import 'package:audit_cms/pages/login/login_page.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          title: Text('Profil pengguna'),
          titleTextStyle: CustomStyles.textBold,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.account_circle, size: 50, color: CustomColors.grey),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Waldi', style: CustomStyles.textBold),
                    Text('div.pengawasan@gmail.com',
                        style: CustomStyles.textRegularGrey),
                  ],
                ),
                SizedBox(width: 70),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: CustomColors.blue))
              ],
            ),

            SizedBox(height: 40),

            //NIP
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text('NIP : ', style: CustomStyles.textMediumBlack),
                  Text('160400537', style: CustomStyles.textRegular15Px),
                ],
              ),
            ),

            SizedBox(height: 15),
            //Area
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text('Area : ', style: CustomStyles.textMediumBlack),
                  Text('CIWEST', style: CustomStyles.textRegular15Px),
                ],
              ),
            ),

            SizedBox(height: 15),
            //Area
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text('Kantor cabang : ', style: CustomStyles.textMediumBlack),
                  Text('Kantor cabang - Bandar Lampung',
                      style: CustomStyles.textRegular15Px),
                ],
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
                width: 220,
                child: GestureDetector(
                  child: Card(
                    margin: EdgeInsets.only(left: 10),
                    color: CustomColors.blue,
                    shape: CustomStyles.customRoundedButton,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kanti kata sandi', style: CustomStyles.textMediumWhite),
                          Icon(Icons.password_rounded, color: CustomColors.white, size: 20)
                        ],
                      ),
                    ),
                  ),
                  onTap: (){

                  },
                )
            ),

            SizedBox(height: 100),

            Center(
              child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.red,
                          shape: CustomStyles.customRoundedButton),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Text('Alert',
                                    style: CustomStyles.textBold),
                                content: Text(
                                    'Apakah anda yakin untuk keluar?',
                                    style: CustomStyles.textRegular),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: CustomColors.red,
                                              shape: CustomStyles
                                                  .customRoundedButton),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Tidak', style: CustomStyles.textMediumWhite)),

                                      SizedBox(width: 5),

                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: CustomColors.blue,
                                              shape: CustomStyles
                                                  .customRoundedButton),
                                          onPressed: (){
                                            TokenManager.clearToken();
                                            Navigator.pushAndRemoveUntil(context,
                                                MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                                          },
                                          child: Text('Ya', style: CustomStyles.textMediumWhite))
                                    ],
                                  )
                                ],
                              );
                            }
                        );
                      },
                      child:
                          Text('Logout', style: CustomStyles.textMediumWhite))),
            )
          ],
        ));
  }
}
