import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: Text('Laporan audit wilayah'),
        titleTextStyle: CustomStyles.textBold,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                showFilterReport();
              }, icon: Icon(Icons.tune_rounded, size: 25, color: CustomColors.grey)
          )
        ],
      ),
    );
  }

  void showFilterReport() {
    showModalBottomSheet(
      backgroundColor: CustomColors.white,
      isScrollControlled: true,
        context: context,
        builder: (BuildContext context){
          return Container(
            height: 330,
            padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  backgroundColor: CustomColors.transparent,
                  title: Text('Filter data laporan'),
                  centerTitle: true,
                  titleTextStyle: CustomStyles.textBold,
                  automaticallyImplyLeading: false,
                ),
                SizedBox(height: 25),
                Text('Pilih tanggal', style: CustomStyles.textMediumBlack),

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(

                      width: 180,
                      child: TextField(
                        readOnly: true,
                        controller: _startDateController,
                        decoration: CustomStyles.customInputDecorationStartDate,
                        onTap: ()async{
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime.now()
                          );
                          if(picked != null){
                            setState(() {
                              _startDateController.text = DateFormat('dd, MMMM yyyy').format(picked);
                            });
                          }
                        },
                      ),
                    ),

                    SizedBox(
                      width: 180,
                      child: TextField(
                        readOnly: true,
                        controller: _endDateController,
                        decoration: CustomStyles.customInputDecorationEndDate,
                        onTap: ()async{
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime.now()
                          );
                          if(picked != null){
                            setState(() {
                              _endDateController.text = DateFormat('dd, MMMM yyyy').format(picked);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CustomStyles.customRoundedButton,
                        backgroundColor: CustomColors.blue
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                  },
                      child: Text('Simpan data filter', style: CustomStyles.textMediumWhite)
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}