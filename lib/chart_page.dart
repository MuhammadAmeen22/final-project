import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Color> gradientColors =[
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: LineChart(
          LineChartData(
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white, width: 2)
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 25,
                  getTextStyles: (context, value){
                    return const TextStyle(
                    color: Color(0xff68737d),
                    fontSize:16,
                    fontWeight: FontWeight.bold
                    );
                  },
                  getTitles: (value){
                    switch(value.toInt()){
                      case 0:
                        return '0';
                      case 2:
                        return '50';
                      case 4:
                        return '100';
                      case 6:
                        return '150';
                    }
                    return'';
                  }
                )
              ),
              maxX: 8, maxY: 8, minX: 0, minY: 0, lineBarsData: [
        LineChartBarData(spots: [
          const FlSpot(0, 0),
          const FlSpot(5, 5),
          const FlSpot(7, 6),
          const FlSpot(8, 4),
        ],
          isCurved: true,
          colors: [Colors.black12, Colors.white70, Colors.white],
          barWidth: 5,
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((e) => e.withOpacity(0.3)).toList()
          )
        )
      ])),
    );
  }
}
