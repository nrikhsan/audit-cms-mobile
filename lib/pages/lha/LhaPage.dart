import 'package:audit_cms/pages/lha/input_lha.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';

class LhaPage extends StatefulWidget {
  const LhaPage({super.key});

  @override
  State<LhaPage> createState() => _LhaPageState();
}

class _LhaPageState extends State<LhaPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: Text('Laporan harian audit'),
        titleTextStyle: CustomStyles.textBold,
        titleSpacing: 5,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,
                size: 25, color: CustomColors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.blue,
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => InputLha()));
          },
        child: Icon(Icons.add_rounded, color: CustomColors.white, size: 25),
      ),
    );
  }
}
