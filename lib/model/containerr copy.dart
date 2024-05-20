class VehicleStatus {
  final String idVehicle;
  final String status;

  VehicleStatus(this.idVehicle, this.status);
}

class Coach {
  String? idVehicle;
  List<String>? driverList;
  List<String>? historyRouteList;
  List<String>? historyIncomeList;
  List<String>? timeStartList;
  List<String>? timeEndList;
  int? toTalRevenue;
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
  int? numberOfPassenger;
  String? previousMaintenanceDate;
  String? nextMaintenanceDate;
  List<String>? emptySeat;
  List<String>? passengerList;

  Coach(
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
      this.numberOfPassenger,
      this.previousMaintenanceDate,
      this.nextMaintenanceDate,
      this.emptySeat,
      this.passengerList});

  Coach.fromJson(Map<String, dynamic> json) {
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
    numberOfSeats = json["numberOfSeats"];
    numberOfPassenger = json["numberOfPassenger"];
    previousMaintenanceDate = json["previousMaintenanceDate"];
    nextMaintenanceDate = json["nextMaintenanceDate"];
    emptySeat =
        json["emptySeat"] == null ? null : List<String>.from(json["emptySeat"]);
    passengerList = json["passengerList"] == null
        ? null
        : List<String>.from(json["passengerList"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idVehicle"] = idVehicle;
    if (driverList != null) {
      data["driverList"] = driverList;
    }
    if (historyRouteList != null) {
      data["historyRouteList"] = historyRouteList;
    }
    if (historyIncomeList != null) {
      data["historyIncomeList"] = historyIncomeList;
    }
    if (timeStartList != null) {
      data["timeStartList"] = timeStartList;
    }
    if (timeEndList != null) {
      data["timeEndList"] = timeEndList;
    }
    data["toTalRevenue"] = toTalRevenue;
    data["toTalProfit"] = toTalProfit;
    data["toTalCost"] = toTalCost;
    data["capacity"] = capacity;
    data["fuelType"] = fuelType;
    data["status"] = status;
    data["route"] = route;
    data["vehicleType"] = vehicleType;
    data["timeStart"] = timeStart;
    data["timeEnd"] = timeEnd;
    data["destination"] = destination;
    data["departure"] = departure;
    data["numberOfSeats"] = numberOfSeats;
    data["numberOfPassenger"] = numberOfPassenger;
    data["previousMaintenanceDate"] = previousMaintenanceDate;
    data["nextMaintenanceDate"] = nextMaintenanceDate;
    if (emptySeat != null) {
      data["emptySeat"] = emptySeat;
    }
    if (passengerList != null) {
      data["passengerList"] = passengerList;
    }
    return data;
  }
}
