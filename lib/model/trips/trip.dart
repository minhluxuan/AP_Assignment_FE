import '../../../model/trips/income.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'driver.dart';
import 'vehicle.dart';
import 'dart:math';

class Trip {
  Driver? driver;
  Vehicle? vehicle;
  String sta2des = '';
  String sta = '';
  String des = '';
  String date = '';
  String time = '';
  String timeend = '';
  double duration = 2;
  double distance = 2;
  double? toTalRevenue;
  double? toTalProfit;
  double? toTalCost;
  double? cost;
  int? numofseat;
  List<String> passID = [];
  List<String>? historyRouteList;
  List<String> historyIncomeList = [];
  List<String>? timeStartList;
  List<String>? timeEndList;
  List<String>? stations;
  List<Income>? incs;
  List<String> seat = [];

  Trip.empty();
  Trip(
    this.driver,
    this.vehicle,
    this.sta2des,
    this.sta,
    this.des,
    this.date,
    this.time,
    this.timeend,
    this.toTalCost,
    this.toTalProfit,
    this.toTalRevenue,
    this.historyRouteList,
    this.historyIncomeList,
    this.timeStartList,
    this.timeEndList,
    this.stations,
    this.duration,
    this.distance,
    this.numofseat,
    this.passID,
    this.seat,
  ) {
    Random random = Random();
    cost = (random.nextDouble() * (0.2) + 1.3) * distance;
    //fetchIncomeData();
  }
  Future<void> fetchIncomeData() async {
    List<Income> fetchedIncomes = [];

    for (var id in historyIncomeList) {
      Income? income = await fetchIncomeByID(id);
      if (income != null) {
        fetchedIncomes.add(income);
      }
    }

    // Gán danh sách dữ liệu đã fetch vào thuộc tính incs
    incs = fetchedIncomes;
  }

  // Phương thức fetch dữ liệu income bằng ID
  Future<Income?> fetchIncomeByID(String id) async {
    var apiUrl = 'http://localhost:8082/api/vehicle/history/Income/$id';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var incomeData = jsonData['data'][0];

      return Income.fromJson(incomeData);
    } else {
      print('Failed to fetch income data: ${response.statusCode}');
      return null;
    }
  }
}
