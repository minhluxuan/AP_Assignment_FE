import '../../../model/trips/income.dart';

class Vehiclej {
  String? idVehicle;
  List<String>? driverList;
  List<String>? historyRouteList;
  List<String>? historyIncomeList;
  List<Income>? IncomeList;
  List<String>? timeStartList;
  List<String>? timeEndList;
  double? toTalRevenue;
  double? toTalProfit;
  double? toTalCost;
  int? capacity;
  String? fuelType;
  String? status;
  String? route;
  String? vehicleType;
  String? timeStart;
  String? timeEnd;
  String? destination;
  String? departure;
  int? numberOfSeats;
  List<String>? emptySeat;
  List<String>? passID;

  Vehiclej(
      {this.idVehicle,
      this.driverList,
      this.historyRouteList,
      this.historyIncomeList,
      this.timeStartList,
      this.timeEndList,
      this.toTalRevenue,
      this.toTalProfit,
      this.toTalCost,
      this.capacity,
      this.fuelType,
      this.status,
      this.route,
      this.vehicleType,
      this.timeStart,
      this.timeEnd,
      this.destination,
      this.departure,
      this.numberOfSeats,
      this.emptySeat,
      this.passID});

  Vehiclej.fromJson(Map<String, dynamic> json) {
    idVehicle = json["idVehicle"];
    driverList = json["driverList"] == null
        ? null
        : List<String>.from(json["driverList"]);
    historyRouteList = json["historyRouteList"] == null
        ? null
        : List<String>.from(json["historyRouteList"]);
    historyIncomeList = json["historyIncomeList"] == null
        ? null
        : List<String>.from(json["historyIncomeList"]);
    timeStartList = json["timeStartList"] == null
        ? null
        : List<String>.from(json["timeStartList"]);
    timeEndList = json["timeEndList"] == null
        ? null
        : List<String>.from(json["timeEndList"]);
    toTalRevenue = json["toTalRevenue"];
    toTalProfit = json["toTalProfit"];
    toTalCost = json["toTalCost"];
    capacity = json["capacity"];
    fuelType = json["fuelType"];
    status = json["status"];
    route = json["route"];
    vehicleType = json["vehicleType"];
    timeStart = json["timeStart"];
    timeEnd = json["timeEnd"];
    destination = json["destination"];
    departure = json["departure"];
    emptySeat =
        json["emptySeat"] == null ? null : List<String>.from(json["emptySeat"]);
    numberOfSeats = json["numberOfSeats"];
    passID = json["passengerList"] == null
        ? null
        : List<String>.from(json["passengerList"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idVehicle"] = idVehicle;
    if (driverList != null) {
      _data["driverList"] = driverList;
    }
    if (historyRouteList != null) {
      _data["historyRouteList"] = historyRouteList;
    }
    if (historyIncomeList != null) {
      _data["historyIncomeList"] = historyIncomeList;
    }
    if (timeStartList != null) {
      _data["timeStartList"] = timeStartList;
    }
    if (timeEndList != null) {
      _data["timeEndList"] = timeEndList;
    }
    _data["toTalRevenue"] = toTalRevenue;
    _data["toTalProfit"] = toTalProfit;
    _data["toTalCost"] = toTalCost;
    _data["capacity"] = capacity;
    _data["fuelType"] = fuelType;
    _data["status"] = status;
    _data["route"] = route;
    _data["vehicleType"] = vehicleType;
    _data["timeStart"] = timeStart;
    _data["timeEnd"] = timeEnd;
    _data["destination"] = destination;
    _data["departure"] = departure;
    return _data;
  }

  @override
  String toString() {
    return 'Vehiclej{idVehicle: $idVehicle, driverList: $driverList, historyRouteList: $historyRouteList, historyIncomeList: $historyIncomeList, timeStartList: $timeStartList, timeEndList: $timeEndList, toTalRevenue: $toTalRevenue, toTalProfit: $toTalProfit, toTalCost: $toTalCost, capacity: $capacity, fuelType: $fuelType, status: $status, route: $route, vehicleType: $vehicleType, timeStart: $timeStart, timeEnd: $timeEnd, destination: $destination, departure: $departure}';
  }
}
