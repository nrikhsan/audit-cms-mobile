import 'package:audit_cms/data/core/injection/injection.dart';
import 'package:audit_cms/pages/auth/login_page.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:flutter/material.dart';
import 'helper/prefs/token_manager.dart';

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
    Injection().dependencies();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMS AUDIT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: isLogin ? BotNavePageAuditArea() : const LoginPage(),
    );
  }
}
