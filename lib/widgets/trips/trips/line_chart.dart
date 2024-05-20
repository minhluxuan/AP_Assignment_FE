import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../model/trips/template.dart';

class PricePoint {
  final double x;
  final double y;
  PricePoint({required this.x, required this.y});
}

class LineChartWidget extends StatefulWidget {
  final List<String> date;
  final List<double> prof;
  const LineChartWidget({super.key, required this.date, required this.prof});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late List<PricePoint> points;
  @override
  void initState() {
    points = pricePoints;
    super.initState();
  }

  List<PricePoint> get pricePoints {
    final data = widget.prof;
    return data
        .asMap()
        .map((index, element) =>
            MapEntry(index, PricePoint(x: index.toDouble(), y: element)))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: LineChart(
            LineChartData(
              minY: 5,
              maxY: 25,
              lineBarsData: [
                LineChartBarData(
                  spots:
                      points.map((point) => FlSpot(point.x, point.y)).toList(),
                  isCurved: false,
                  color: mainColor,
                  barWidth: 2,
                  dotData: const FlDotData(
                    show: false,
                  ),
                )
              ],
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    "Doanh thu",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  axisNameSize: 30,
                ),
                rightTitles: const AxisTitles(
                  axisNameWidget: Text(
                    "",
                  ),
                  axisNameSize: 30,
                ),
                topTitles: const AxisTitles(
                  axisNameSize: 0,
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.date[int.parse(points.first.x.toString())],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const Text(
                          "Ngày",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          widget.date[int.parse(points.last.x.toString())],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  axisNameSize: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
