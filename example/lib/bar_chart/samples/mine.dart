import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => mineState();
}

class mineState extends State<mine> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 300, // 위젯 크기로
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(enabled: false), // 막대기 눌렀을 때 값 위에 안뜨게
                alignment: BarChartAlignment.spaceAround,
                maxY: 20, // largestChartValue
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                    margin: 20,
                  ),
                  leftTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(y: 8, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(y: 14, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                  ),
                  // BarChartGroupData(
                  //   x: 3,
                  //   barRods: [
                  //     BarChartRodData(y: 15, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  //   ],
                  // ),
                  // BarChartGroupData(
                  //   x: 3,
                  //   barRods: [
                  //     BarChartRodData(y: 13, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  //   ],
                  // ),
                  // BarChartGroupData(
                  //   x: 4,
                  //   barRods: [
                  //     BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  //   ],
                  //   //showingTooltipIndicators: [0], 그래프 위에 숫자 보여주는 것
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
