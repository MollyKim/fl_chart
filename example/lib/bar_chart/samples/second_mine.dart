import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class mine2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => mine2State();
}

class mine2State extends State<mine2> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = 0; // data.length

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 300,
                  height: 150,
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
              ),
            ),
            Text('------------------------------------',
              style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.lightGreen, //isTouched ? Colors.lightGreen : Colors.grey ,
        double width = 25,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          colors: isTouched ? [barColor] : [Colors.grey],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(show: false),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      alignment: BarChartAlignment.start,
      barTouchData: BarTouchData(
        enabled: false,
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
        ),
        leftTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(show: false),
      barGroups: [
        makeGroupData(0, 5, isTouched: 0 == touchedIndex),
        makeGroupData(0, 0),
        makeGroupData(0, 0),
        makeGroupData(0, 15, isTouched: 3 == touchedIndex),
        makeGroupData(0, 0),
        makeGroupData(0, 0),
        makeGroupData(0, 5, isTouched: 0 == touchedIndex),
        makeGroupData(0, 0),
        makeGroupData(0, 0),
        makeGroupData(0, 15, isTouched: 3 == touchedIndex),
        makeGroupData(0, 0),
        makeGroupData(0, 0),
        makeGroupData(0, 10, isTouched: 6 == touchedIndex)
      ],//showingGroups(),
    );
  }





  List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 16.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });
}
