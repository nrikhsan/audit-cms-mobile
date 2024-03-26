import 'package:audit_cms/data/controller/auth/controller_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../helper/styles/custom_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final ControllerAuth controllerAuth = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Obx((){
        if(controllerAuth.isLoading.isTrue){
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
                        height: 130,
                        width: 300,
                        child: Image.asset('assets/images/logo.png')),

                    const SizedBox(height: 20),

                    TextField(
                        controller: emailController,
                        onChanged: (email) => emailController.text = email,
                        cursorColor: CustomColors.blue,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.account_circle,
                                color: CustomColors.grey, size: 20),
                            labelStyle: CustomStyles.textMediumGrey15Px,
                            labelText: 'Masukan email atau username...',
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
                        controller: passwordController,
                        onChanged: (password) => passwordController.text = password,
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
                          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                              Get.snackbar('Alert', 'Email atau kata sandi tidak boleh kosong', 
                              snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else if(passwordController.text.length < 6){
                            Get.snackbar('Alert', 'Kata sandi harus lebih dari 6 karakter', 
                              snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.red);
                          }else{
                            controllerAuth.login(emailController.text, passwordController.text);
                          }
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
