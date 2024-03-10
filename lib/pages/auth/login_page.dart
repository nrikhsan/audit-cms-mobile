import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../data/controller/controllers.dart';
import '../../helper/styles/custom_styles.dart';
import '../bottom_navigasi/bott_nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ControllerAllData _controllerAllData = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Obx((){
        if(_controllerAllData.isLoading.isTrue){
          return const Center(
            child: Visibility(
                child: SpinKitCircle(color: CustomColors.blue)
            ),
          );
        }else{
          return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    SizedBox(
                        height: 200,
                        width: 300,
                        child: Image.asset('assets/images/logo.png')),

                    const SizedBox(height: 20),

                    TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: CustomColors.blue,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.account_circle,
                                color: CustomColors.grey, size: 20),
                            labelStyle: CustomStyles.textMediumGrey15Px,
                            labelText: 'Masukan email...',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: CustomColors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: CustomColors.grey)))),

                    const SizedBox(height: 15),
                    TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: CustomColors.blue,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.password_rounded,
                                color: CustomColors.grey, size: 20),
                            labelStyle: CustomStyles.textMediumGrey15Px,
                            labelText: 'Masukan kata sandi...',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: CustomColors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: CustomColors.grey)))),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.blue,
                            shape: CustomStyles.customRoundedButton),
                        onPressed: (){
                          _controllerAllData.login(_emailController.text, _passwordController.text);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => BotNavePageAuditArea()), (route) => false);
                        },
                        child: Text('Masuk',
                            style: CustomStyles.textMediumWhite15Px),
                      ),
                    ),
                  ],
                ),
              )
          );
        }
      })
    );
  }
}
