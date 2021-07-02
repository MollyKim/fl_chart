import 'package:example/bar_chart/samples/mine.dart';
import 'package:flutter/material.dart';

import '../bar_chart/samples/bar_chart_sample3.dart';
import '../bar_chart/samples/bar_chart_sample4.dart';
import '../bar_chart/samples/bar_chart_sample5.dart';

class BarChartPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          BarChartSample3(),
          const SizedBox(
            height: 18,
          ),
          mine(),
        ],
      ),
    );
  }
}
