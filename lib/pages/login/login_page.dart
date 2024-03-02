import 'package:audit_cms/data/repositories/repository.dart';
import 'package:audit_cms/data/repositories/repository_impl.dart';
import 'package:audit_cms/data/service/app_service.dart';
import 'package:audit_cms/pages/botNav/bottom_nav_page.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailOrUsername = TextEditingController();
  final TextEditingController password = TextEditingController();
  late Repository repository;

  @override
  void initState() {
    repository = RepositoryImpl(ApiService());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 150),
                SizedBox(
                    height: 200,
                    width: 300,
                    child: Image.asset('assets/images/logo.png')),
                SizedBox(height: 20),
                TextField(
                    controller: emailOrUsername,
                    cursorColor: CustomColors.blue,
                    decoration: CustomStyles.customInputDecorationEmail),
                SizedBox(height: 15),
                TextField(
                    controller: password,
                    cursorColor: CustomColors.blue,
                    decoration: CustomStyles.customInputDecorationPassword),
                SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.blue,
                          shape: CustomStyles.customRoundedButton),
                      onPressed: () async{
                        final String email = emailOrUsername.text;
                        final String pw = password.text;
                        if (email.isEmpty && pw.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Alert',
                                      style: CustomStyles.textBold),
                                  content: Text(
                                      'Email/username dan kata sandi tidak boleh kosong',
                                      style: CustomStyles.textRegular),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: CustomColors.blue,
                                            shape: CustomStyles.customRoundedButton),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text('Kembali', style: CustomStyles.textMediumWhite))
                                  ],
                                );
                              });
                        } else if (email.isEmpty){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Alert',
                                      style: CustomStyles.textBold),
                                  content: Text(
                                      'Email/username tidak boleh kosong',
                                      style: CustomStyles.textRegular),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: CustomColors.blue,
                                            shape: CustomStyles
                                                .customRoundedButton),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text('Kembali', style: CustomStyles.textMediumWhite))
                                  ],
                                );
                              });
                        }else if(pw.isEmpty){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Alert',
                                      style: CustomStyles.textBold),
                                  content: Text(
                                      'Kata sandi tidak boleh kosong',
                                      style: CustomStyles.textRegular),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: CustomColors.blue,
                                            shape: CustomStyles
                                                .customRoundedButton),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text('Kembali', style: CustomStyles.textMediumWhite))
                                  ],
                                );
                              });
                        }else{
                          repository.login(emailOrUsername.text.toString(), password.text.toString());
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavPage()), (route) => false);
                        }
                      },
                      child:
                          Text('Login', style: CustomStyles.textMediumWhite)),
                )
              ],
            ),
          ),
        ));
  }
}
