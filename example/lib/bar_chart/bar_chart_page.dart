import 'package:example/bar_chart/samples/second_mine.dart';
import 'package:flutter/material.dart';
import 'samples/bar_chart_sample1.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          BarChartSample1(),
          mine2(),
        ],
      ),
    );

  }
}
