import 'package:audit_cms/pages/clarification/clarification_page.dart';
import 'package:audit_cms/pages/lha/LhaPage.dart';
import 'package:audit_cms/style/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputLha extends StatefulWidget {
  const InputLha({super.key});

  @override
  State<InputLha> createState() => _InputLhaState();
}

class _InputLhaState extends State<InputLha> {

  final TextEditingController uraianTemuanLHA = TextEditingController();
  final TextEditingController temporaryRecommendation = TextEditingController();
  final TextEditingController permanentRecommendation = TextEditingController();
  final TextEditingController recommendationOrSuggest = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime selectDate = DateTime.now();

  Future<void>_selectedDate(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2001),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
        _dateController.text = DateFormat('dd, MMMM yyyy').format(selectDate);
      });
    }
  }

  String _selectedItemsDivision = 'Pilih divisi';
  List<String> listDivision = ['Pilih divisi', 'Divisi 1', 'Divisi 2', 'Divisi 3', 'Divisi 4', 'Divisi 5'];

  String _selectedSOPcategory = 'Pilih SOP';
  List<String> listSOP = ['Pilih SOP', 'SOP 1', 'SOP 2', 'SOP 3', 'SOP 4', 'SOP 5'];

  //Recommendation choice chip button
  bool _showTextFieldRecommendation = false;

  //Search choice chip button
  bool _showTextFieldsearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        title: Text('Input laporan harian audit'),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              //dropdown choose division
              Row(
                children: [
                  Text('Pilih divisi :', style: CustomStyles.textRegular),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: CustomStyles.textBold13Px,
                        value: _selectedItemsDivision,
                        items: listDivision.map((value){
                          return DropdownMenuItem(
                            value: value,
                              child: Text(value, style: CustomStyles.textBold13Px)
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            _selectedItemsDivision = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              //text field uraian temuan
              TextField(
                cursorColor: CustomColors.blue,
                controller: uraianTemuanLHA,
                maxLines: 5,
                decoration: CustomStyles.customInputDecorationUraianTemuanLHA,
              ),

              SizedBox(height: 15),

              //dropdown SOP category
              Row(
                children: [
                  Text('Pilih kategori SOP :', style: CustomStyles.textRegular),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: CustomStyles.textBold13Px,
                        value: _selectedSOPcategory,
                          items: listSOP.map((value){
                            return DropdownMenuItem(
                              value: value,
                                child: Text(value, style: CustomStyles.textBold13Px)
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              _selectedSOPcategory = value!;
                            });
                          }
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              //text field temporary recommendation
              TextField(
                cursorColor: CustomColors.blue,
                controller: temporaryRecommendation,
                maxLines: 3,
                decoration: CustomStyles.customInputTemporaryRecommendation,
              ),

              SizedBox(height: 15),

              //text field permanent recommendation
              TextField(
                cursorColor: CustomColors.blue,
                controller: permanentRecommendation,
                maxLines: 3,
                decoration: CustomStyles.customInputPermanentRecommendation,
              ),

              //choice chip button Recommendation or suggestion
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Rekomendasi/saran :',
                              style: CustomStyles.textRegular)),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: Wrap(spacing: 5, children: [
                          ChoiceChip(
                            label: Text('Ada',
                                style: CustomStyles.textBold13Px),
                            selected: _showTextFieldRecommendation,
                            onSelected: (selected) {
                              setState(() {
                                _showTextFieldRecommendation = selected;
                              });
                            },
                          ),

                          ChoiceChip(
                            label: Text('Tidak ada',
                                style: CustomStyles.textBold13Px),
                            selected: !_showTextFieldRecommendation,
                            onSelected: (selected) {
                              setState(() {
                                _showTextFieldRecommendation = !selected;
                              });
                            },
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _showTextFieldRecommendation,
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TextField(
                        maxLines: 5,
                        controller: recommendationOrSuggest,
                        cursorColor: Colors.indigo,
                        decoration: CustomStyles.customInputRecommendationOrSuggestion
                      ),
                    ),
                  ),
                ],
              ),

              //choice chip button Search
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text('Penelusuran :',
                              style: CustomStyles.textRegular)),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: Wrap(spacing: 5, children: [
                          ChoiceChip(
                            label: Text('Ada',
                                style: CustomStyles.textBold13Px),
                            selected: _showTextFieldsearch,
                            onSelected: (selected) {
                              setState(() {
                                _showTextFieldsearch = selected;
                              });
                            },
                          ),

                          ChoiceChip(
                            label: Text('Tidak ada',
                                style: CustomStyles.textBold13Px),
                            selected: !_showTextFieldsearch,
                            onSelected: (selected) {
                              setState(() {
                                _showTextFieldsearch = !selected;
                              });
                            },
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Visibility(
                    visible: _showTextFieldsearch,
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: _dateController,
                        cursorColor: Colors.indigo,
                        decoration: CustomStyles.customInputDecorationSearch,
                        readOnly: true,
                        onTap: (){
                          _selectedDate(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              //List input LHA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text('List LHA',
                          style: CustomStyles.textBold15Px)
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.add, size: 25, color: CustomColors.blue)),
                  )
                ],
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Divisi',
                      style: CustomStyles.textMediumBlack),
                  Text('Auditor',
                      style: CustomStyles.textMediumBlack),
                  Text('Action',
                      style: CustomStyles.textMediumBlack),
                ],
              ),

              SizedBox(height: 25),
              SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.blue,
                      shape: CustomStyles.customRoundedButton
                    ),
                      onPressed: showAlert,
                      child: Text('Simpan LHA', style: CustomStyles.textMediumWhite)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Alert', style: CustomStyles.textBold),
            content: Text('Simpan laporan harian audit'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.red,
                          shape: CustomStyles
                              .customRoundedButton),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Tidak', style: CustomStyles.textMediumWhite)),

                  SizedBox(width: 5),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.blue,
                          shape: CustomStyles
                              .customRoundedButton),
                      onPressed: (){
                        if(_showTextFieldsearch){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClarificationPage()));
                        }else{
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Ya', style: CustomStyles.textMediumWhite))
                ],
              )
            ],
          );
        }
    );
  }
}
