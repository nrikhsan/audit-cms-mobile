import 'package:audit_cms/data/controller/auth/controller_auth.dart';
import 'package:audit_cms/data/core/injection/injection.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/auth/login_page.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Injection().dependencies();
    final ControllerAuth controllerAuth = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMS AUDIT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: controllerAuth.checkLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SpinKitCircle(color: CustomColors.blue);
          }
          if (controllerAuth.isLoggedIn.value) {
            return BotNavePageAuditArea();
          } else if(controllerAuth.isLoggedIn.value){
            return BotNavAuditRegion();
          }else{
            return const LoginPage();
          }
        },
      ),
    );
  }
}
