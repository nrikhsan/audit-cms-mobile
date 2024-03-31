import 'package:audit_cms/data/core/injection/injection.dart';
import 'package:audit_cms/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Injection().dependencies();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMS AUDIT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginPage()
    );
  }
}
