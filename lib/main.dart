import 'package:audit_cms/data/helper/token_manager.dart';
import 'package:audit_cms/pages/botNav/bottom_nav_page.dart';
import 'package:audit_cms/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? isLogin = await TokenManager.isLogin();
  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMS AUDIT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogin ? const BottomNavPage() : const LoginPage(),
    );
  }
}
