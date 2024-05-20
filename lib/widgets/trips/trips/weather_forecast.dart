/*
 * Copyright Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:newapp/model/template.dart';

int randomTu20Den39() {
  Random random = Random();
  int randomNumber = random.nextInt(20) + 20;
  return randomNumber;
}

int randomTu1Den4() {
  Random random = Random();
  int randomNumber = random.nextInt(3) + 1;
  return randomNumber;
}

class WeatherForecast extends StatefulWidget {
  final String location;
  const WeatherForecast({super.key, required this.location});

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late List<String> days;
  List<String> layDanhSachNgayLienTiep(DateTime homNay) {
    List<String> danhSachNgay = [];
    for (int i = 0; i < 5; i++) {
      DateTime ngay = homNay.add(Duration(days: i));
      String ngayThang = "${ngay.day}/${ngay.month}";
      danhSachNgay.add(ngayThang);
    }
    return danhSachNgay;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      days = layDanhSachNgayLienTiep(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade800),
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.location,
            style: const TextStyle(
                fontSize: mainTextSize, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherWidget(day: days[0]),
              WeatherWidget(day: days[1]),
              WeatherWidget(day: days[2]),
              WeatherWidget(day: days[3]),
              WeatherWidget(day: days[4])
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatefulWidget {
  final String day;
  const WeatherWidget({super.key, required this.day});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late int temper;
  late int we;
  @override
  void initState() {
    super.initState();
    temper = randomTu20Den39();
    we = temper % 4;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
            temper > 33
                ? Icons.sunny
                : temper > 30
                    ? Icons.cloud
                    : temper > 25
                        ? Icons.water_drop_rounded
                        : Icons.cloudy_snowing,
            color: temper > 33
                ? Colors.yellow
                : temper > 30
                    ? Colors.white
                    : temper > 25
                        ? Colors.blue.shade800
                        : Colors.blue,
            size: 40),
        Text("$temper°C"),
        Text(
          widget.day,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
