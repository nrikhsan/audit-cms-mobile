import 'package:audit_cms/data/controller/auditRegion/controller_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/helper/styles/formatter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class ItemDashboardFollowUpAuditRegion extends StatefulWidget {
  final ControllerAuditRegion controllerAuditRegion;
  const ItemDashboardFollowUpAuditRegion({super.key, required this.controllerAuditRegion});

  @override
  State<ItemDashboardFollowUpAuditRegion> createState() => _ItemDashboardFollowUpAuditRegionState();
}

class _ItemDashboardFollowUpAuditRegionState extends State<ItemDashboardFollowUpAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Tindak lanjut', style: CustomStyles.textBold15Px)),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditRegion.selectedMonthFollowUp.value,
                        items: widget.controllerAuditRegion.months.map((int month) {
                          return DropdownMenuItem<int>(
                            value: month,
                            child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditRegion.selectedMonthFollowUp.value = newValue!;
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditRegion.selectedYearFollowUp.value,
                        items: widget.controllerAuditRegion.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditRegion.selectedYearFollowUp.value = newValue!;
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
                        widget.controllerAuditRegion.getFollowUpDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditRegion.resetFilterDashboarFollowUp();
                        widget.controllerAuditRegion.getFollowUpDashboard();
                    }, icon: const Icon(Icons.refresh_rounded, color: CustomColors.red, size: 25),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 30),
            AspectRatio(
              aspectRatio: 1.2,
              child: Obx((){
                if (widget.controllerAuditRegion.followUpDashboard.isEmpty) {
                  return Center(child: Text('Tidak ada data', style: CustomStyles.textMedium15Px));
                } else {
                  return PieChart(
                PieChartData(
                  sections: widget.controllerAuditRegion.followUpDataDashboard,
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

class ItemDashboardFindingsAuditRegion extends StatefulWidget {
  final ControllerAuditRegion controllerAuditRegion;
  const ItemDashboardFindingsAuditRegion({super.key, required this.controllerAuditRegion});

  @override
  State<ItemDashboardFindingsAuditRegion> createState() => _ItemDashboardFindingsAuditRegionState();
}

class _ItemDashboardFindingsAuditRegionState extends State<ItemDashboardFindingsAuditRegion> {
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
                        
                        value: widget.controllerAuditRegion.selectedYearFindings.value,
                        items: widget.controllerAuditRegion.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditRegion.selectedYearFindings.value = newValue!;
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
                        widget.controllerAuditRegion.getFindingDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditRegion.resetFilterDashboarFindings();
                        widget.controllerAuditRegion.getFindingDashboard();
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
                  if (widget.controllerAuditRegion.findingsDashboard.isEmpty) {
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
                              for (var i = 0; i < widget.controllerAuditRegion.findingsDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  widget.controllerAuditRegion.findingsDashboard[i].total!.toDouble(),
                                ),
                            ],
                          barWidth: 2,
                          color: CustomColors.blue,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.blue.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(widget.controllerAuditRegion.findingsDashboard.length, (index) => index),
                          ),
                      ],
                      gridData: const FlGridData(show: true),
                      minX: 0,
                      maxX: widget.controllerAuditRegion.findingsDashboard.length.toDouble() - 1,
                      minY: 0,
                      maxY: (widget.controllerAuditRegion.findingsDashboard.isNotEmpty
                        ? widget.controllerAuditRegion.findingsDashboard
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
                                  '${widget.controllerAuditRegion.findingsDashboard[touchedSpot.spotIndex].total} temuan dibulan ${widget.controllerAuditRegion.findingsDashboard[touchedSpot.spotIndex].month}',
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

class ItemDashboardNominalAuditRegion extends StatefulWidget {
  final ControllerAuditRegion controllerAuditRegion;
  const ItemDashboardNominalAuditRegion({super.key, required this.controllerAuditRegion});

  @override
  State<ItemDashboardNominalAuditRegion> createState() => _ItemDashboardNominalAuditRegionState();
}

class _ItemDashboardNominalAuditRegionState extends State<ItemDashboardNominalAuditRegion> {
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
                        
                        value: widget.controllerAuditRegion.selectedYearNominal.value,
                        items: widget.controllerAuditRegion.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditRegion.selectedYearNominal.value = newValue!;
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
                        widget.controllerAuditRegion.getNominalDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditRegion.resetFilterDashboarNominal();
                        widget.controllerAuditRegion.getNominalDashboard();
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
                  if (widget.controllerAuditRegion.nominalDashboard.isEmpty) {
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
                              for (var i = 0; i < widget.controllerAuditRegion.nominalDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  widget.controllerAuditRegion.nominalDashboard[i].total!.toDouble(),
                                )
                            ],
                          barWidth: 2,
                          color: CustomColors.orange,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.orange.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(widget.controllerAuditRegion.nominalDashboard.length, (index) => index),
                          ),
                      ],
                      
                      minX: 0,
                      maxX: widget.controllerAuditRegion.nominalDashboard.length.toDouble() - 1,
                      minY: 0,
                      maxY: (widget.controllerAuditRegion.nominalDashboard.isNotEmpty
                          ? widget.controllerAuditRegion.nominalDashboard
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
                                  'Nominal temuan di bulan ${widget.controllerAuditRegion.nominalDashboard[touchedSpot.spotIndex].month} sebanyak\n${CurrencyFormat.convertToIdr(widget.controllerAuditRegion.nominalDashboard[touchedSpot.spotIndex].total, 0)}',
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
      ],
    );
  }
}

class ItemDivisionDashboardAuditRegion extends StatefulWidget {
  final ControllerAuditRegion controllerAuditRegion;
  const ItemDivisionDashboardAuditRegion({super.key, required this.controllerAuditRegion});

  @override
  State<ItemDivisionDashboardAuditRegion> createState() => _ItemDivisionDashboardAuditRegionState();
}

class _ItemDivisionDashboardAuditRegionState extends State<ItemDivisionDashboardAuditRegion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
            Container(
            margin: const EdgeInsets.only(left: 15),
            child:Text('Jumlah temuan per divisi', style: CustomStyles.textBold15Px)),
            const SizedBox(height: 20),

            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditRegion.selectedMonthDivision.value,
                        items: widget.controllerAuditRegion.months.map((int month) {
                          return DropdownMenuItem<int>(
                            value: month,
                            child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditRegion.selectedMonthDivision.value = newValue!;
                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Obx(() => DropdownButton<int>(
                        
                        value: widget.controllerAuditRegion.selectedYearDivision.value,
                        items: widget.controllerAuditRegion.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.controllerAuditRegion.selectedYearDivision.value = newValue!;
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
                        widget.controllerAuditRegion.getDivisionDashboard();
                    }, child: Text('Filter data', style: CustomStyles.textMediumWhite13Px,)
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                    child: IconButton(
                      onPressed: (){
                        widget.controllerAuditRegion.resetFilterDashboarDivision();
                        widget.controllerAuditRegion.getDivisionDashboard();
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
                  if (widget.controllerAuditRegion.divisionDashboard.isEmpty) {
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
                              int index = value.toInt();
                              if (index >= 0 && index < widget.controllerAuditRegion.divisionDashboard.length) {
                                  return Text('${widget.controllerAuditRegion.divisionDashboard[index].cases}', style: CustomStyles.textRegular12Px);
                              }
                              return const Text('');
                            }
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 33,
                            getTitlesWidget: (value, meta) {
                              if (value % 10 == 0) {
                                return Text('${value.toInt()}', style: CustomStyles.textRegular12Px);
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
                              for (var i = 0; i < widget.controllerAuditRegion.divisionDashboard.length; i++)
                                FlSpot(
                                  i.toDouble(),
                                  widget.controllerAuditRegion.divisionDashboard[i].total!.toDouble(),
                                )
                            ],
                          barWidth: 2,
                          color: CustomColors.green,
                          belowBarData: BarAreaData(
                            show: true,
                            color: CustomColors.green.withOpacity(0.5),
                          ),
                          
                            showingIndicators: List.generate(widget.controllerAuditRegion.divisionDashboard.length, (index) => index),
                          ),
                      ],
                      
                      minX: 0,
                      maxX: widget.controllerAuditRegion.divisionDashboard.length.toDouble() - 1,
                      minY: 0,
                      maxY: (widget.controllerAuditRegion.divisionDashboard.isNotEmpty
                        ? widget.controllerAuditRegion.divisionDashboard
                            .map((e) => e.total)
                            .reduce((a, b) => a! > b! ? a : b)!
                            .toDouble() + 10
                        : 10),
                      lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                final textStyle = CustomStyles.textMediumWhite13Px;
                                return LineTooltipItem(
                                  'Total temuan pada divisi ${widget.controllerAuditRegion.divisionDashboard[touchedSpot.spotIndex].cases} sebanyak\n${widget.controllerAuditRegion.divisionDashboard[touchedSpot.spotIndex].total}',
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