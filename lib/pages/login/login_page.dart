import 'package:audit_cms/pages/botNav/bottom_nav_page.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailOrUsername = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavPage()));
                    },
                    child:
                        Text('Login', style: CustomStyles.textMediumWhite)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
