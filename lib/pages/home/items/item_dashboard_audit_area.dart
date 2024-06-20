import 'package:audit_cms/data/controller/auditArea/controller_audit_area.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/helper/styles/formatter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class ItemDashboardFollowUp extends StatefulWidget {
  final ControllerAuditArea controllerAuditArea;
  const ItemDashboardFollowUp({super.key, required this.controllerAuditArea});

  @override
  State<ItemDashboardFollowUp> createState() => _ItemDashboardFollowUpState();
}

class _ItemDashboardFollowUpState extends State<ItemDashboardFollowUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Tindak lanjut', style: CustomStyles.textBold15Px)),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditArea.selectedMonthFollowUp.value,
                        items: widget.controllerAuditArea.months.map((int month) {
                          return DropdownMenuItem<int>(
                            value: month,
                            child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditArea.selectedMonthFollowUp.value = newValue!;
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditArea.selectedYearFollowUp.value,
                        items: widget.controllerAuditArea.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditArea.selectedYearFollowUp.value = newValue!;
                        },
                      )),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        widget.controllerAuditArea.getFollowUpDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditArea.resetFilterDashboarFollowUp();
                        widget.controllerAuditArea.getFollowUpDashboard();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 1.2,
              child: Obx((){
                if (widget.controllerAuditArea.followUpDashboard.isEmpty) {
                  return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
                } else {
                  return PieChart(
                PieChartData(
                  sections: widget.controllerAuditArea.followUpDataDashboard,
                ),
              );
                }
              })
            ),

            const SizedBox(height: 30),
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Keterangan :', style: CustomStyles.textMedium15Px)),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: Scaffold(
                          backgroundColor: CustomColors.blue,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Tindak lanjut dengan status OPEN', style: CustomStyles.textRegular13Px),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: Scaffold(
                          backgroundColor: CustomColors.red,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Tindak lanjut dengan status CLOSE', style: CustomStyles.textRegular13Px),
                    ],
                  ),
                ],
              )
            ),
      ],
    );
  }
}

class ItemDashboardFindings extends StatefulWidget {
  final ControllerAuditArea controllerAuditArea;
  const ItemDashboardFindings({super.key, required this.controllerAuditArea});

  @override
  State<ItemDashboardFindings> createState() => _ItemDashboardFindingsState();
}

class _ItemDashboardFindingsState extends State<ItemDashboardFindings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 30),
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Jumlah temuan audit', style: CustomStyles.textBold15Px)),
            const SizedBox(height: 20),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditArea.selectedYearFindings.value,
                        items: widget.controllerAuditArea.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditArea.selectedYearFindings.value = newValue!;
                        },
                      )),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        widget.controllerAuditArea.getFindingDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditArea.resetFilterDashboarFindings();
                        widget.controllerAuditArea.getFindingDashboard();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 1.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Obx(() {
                  if (widget.controllerAuditArea.findingsDashboard.isEmpty) {
                    return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
                  } else {
                    return LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta){
                              switch (value.toInt()) {
                              case 0:
                                return const Text('1');
                              case 1:
                                return const Text('2');
                              case 2:
                                return const Text('3');
                              case 3:
                                return const Text('4');
                              case 4:
                                return const Text('5');
                              case 5:
                                return const Text('6');
                              case 6:
                                return const Text('7');
                              case 7:
                                return const Text('8');
                              case 8:
                                return const Text('9');
                              case 9:
                                return const Text('10');
                              case 10:
                                return const Text('11');
                              case 11:
                                return const Text('12');
                              default:
                                return const Text('');
                              }
                            }
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              if (value % 10 == 0) {
                                return Text('${value.toInt()}', style: CustomStyles.textRegular12Px);
                              }
                              return Container();
                            },
                          ),
                        )
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                        color: const Color(0xff37434d),
                        width: 1,
                      )),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                              for (var i = 0; i < widget.controllerAuditArea.findingsDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  widget.controllerAuditArea.findingsDashboard[i].total!.toDouble(),
                                ),
                            ],
                          barWidth: 2,
                          color: CustomColors.blue,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.blue.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(widget.controllerAuditArea.findingsDashboard.length, (index) => index),
                          ),
                      ],
                      gridData: const FlGridData(show: true),
                      minX: 0,
                      maxX: widget.controllerAuditArea.findingsDashboard.length.toDouble() - 1,
                      minY: 0,
                      maxY: (widget.controllerAuditArea.findingsDashboard.isNotEmpty
                        ? widget.controllerAuditArea.findingsDashboard
                            .map((e) => e.total)
                            .reduce((a, b) => a! > b! ? a : b)!
                            .toDouble() + 10
                        : 10),
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                final textStyle = CustomStyles.textMediumWhite15Px;
                                return LineTooltipItem(
                                  '${widget.controllerAuditArea.findingsDashboard[touchedSpot.spotIndex].total} temuan dibulan ${widget.controllerAuditArea.findingsDashboard[touchedSpot.spotIndex].month}',
                                  textStyle,
                                );
                              }).toList();
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                    )
                  );
                  } 
                }),
              ),
            ),
      ],
    );
  }
}

class ItemDashboardNominal extends StatefulWidget {
  final ControllerAuditArea controllerAuditArea;
  const ItemDashboardNominal({super.key, required this.controllerAuditArea});

  @override
  State<ItemDashboardNominal> createState() => _ItemDashboardNominalState();
}

class _ItemDashboardNominalState extends State<ItemDashboardNominal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Nominal temuan audit', style: CustomStyles.textBold15Px)),
            const SizedBox(height: 20),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditArea.selectedYearNominal.value,
                        items: widget.controllerAuditArea.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditArea.selectedYearNominal.value = newValue!;
                        },
                      )),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue,
                        shape: CustomStyles.customRoundedButton
                      ),
                      onPressed: (){
                        widget.controllerAuditArea.getNominalDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditArea.resetFilterDashboarNominal();
                        widget.controllerAuditArea.getNominalDashboard();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 1.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Obx(() {
                  if (widget.controllerAuditArea.nominalDashboard.isEmpty) {
                    return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
                  } else {
                    
                    return LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta){
                              switch (value.toInt()) {
                              case 0:
                                return const Text('1');
                              case 1:
                                return const Text('2');
                              case 2:
                                return const Text('3');
                              case 3:
                                return const Text('4');
                              case 4:
                                return const Text('5');
                              case 5:
                                return const Text('6');
                              case 6:
                                return const Text('7');
                              case 7:
                                return const Text('8');
                              case 8:
                                return const Text('9');
                              case 9:
                                return const Text('10');
                              case 10:
                                return const Text('11');
                              case 11:
                                return const Text('12');
                              default:
                                return const Text('');
                              }
                            }
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 70,
                            getTitlesWidget: (value, meta) {
                            if (value % 100000000 == 0) {
                              return Text(
                                CurrencyFormat.convertToIdr(value ~/ 1, 0).toString(),
                                style: CustomStyles.textRegular8Px);
                            }
                            return Container();
                          }),
                        ),
                      ),
                      gridData: const FlGridData(show: true),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                        color: const Color(0xff37434d),
                        width: 1,
                      )),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                              for (var i = 0; i < widget.controllerAuditArea.nominalDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  widget.controllerAuditArea.nominalDashboard[i].total!.toDouble(),
                                )
                            ],
                          barWidth: 2,
                          color: CustomColors.orange,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.orange.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(widget.controllerAuditArea.nominalDashboard.length, (index) => index),
                          ),
                      ],
                      
                      minX: 0,
                      maxX: widget.controllerAuditArea.nominalDashboard.length.toDouble() - 1,
                      minY: 0,
                      maxY: (widget.controllerAuditArea.nominalDashboard.isNotEmpty
                          ? widget.controllerAuditArea.nominalDashboard
                              .map((e) => e.total)
                              .reduce((a, b) => a! > b! ? a : b)!
                              .toDouble() + 100000000
                          : 10),
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                final textStyle = CustomStyles.textMediumWhite13Px;
                                return LineTooltipItem(
                                  'Nominal temuan di bulan ${widget.controllerAuditArea.nominalDashboard[touchedSpot.spotIndex].month} sebanyak\n${CurrencyFormat.convertToIdr(widget.controllerAuditArea.nominalDashboard[touchedSpot.spotIndex].total, 0)}',
                                  textStyle,
                                );
                              }).toList();
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                    ),
                  );
                  }
                }),
              ),
            ),
      ]
    );
  }
}