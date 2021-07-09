import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class mine2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => mine2State();
}

class mine2State extends State<mine2> {
  final Duration animDuration = const Duration(milliseconds: 250);
  ScrollController scrollController = ScrollController();

  int touchedIndex = 7; // data.length


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController(initialScrollOffset: 500);

    void _pointerMoved(PointerEvent point){
      print(point.position);
      print(point.position.dx);
      print(point.position.dy);
      scrollController.jumpTo(0);
      print(scrollController.position.pixels);

    }

    return Listener(
      onPointerUp: _pointerMoved,

      child: AspectRatio(
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
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 500, // depends on data length
                  height: 150,
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
              ),
              Text('------------------------------------',
                style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.lightGreen, //isTouched ? Colors.lightGreen : Colors.grey ,
        double width = 10,
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
      alignment: BarChartAlignment.center,
      groupsSpace: 35,
      barTouchData: BarTouchData(
        enabled: false,
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
               //scrollController.jumpTo((touchedIndex-3)*33);
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
      borderData: FlBorderData(show: true), //need to change false
      barGroups: [
        makeGroupData(10, 1, isTouched: 0 == touchedIndex),
        makeGroupData(10, 5, isTouched: 1 == touchedIndex),
        makeGroupData(10, 3, isTouched: 2 == touchedIndex),
        makeGroupData(10, 7, isTouched: 3 == touchedIndex),
        makeGroupData(10, 7, isTouched: 4 == touchedIndex),
        makeGroupData(10, 7, isTouched: 5 == touchedIndex),
        makeGroupData(10, 7, isTouched: 6 == touchedIndex),
        makeGroupData(10, 7, isTouched: 7 == touchedIndex),
        makeGroupData(0, 0),
        makeGroupData(0, 0),

      ],//showingGroups(),
    );
  }




}
