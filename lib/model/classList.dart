class ListContainer {
  String? idVehicle;
  List<String>? driverList;
  dynamic historyRouteList;
  dynamic historyIncomeList;
  dynamic timeStartList;
  dynamic timeEndList;
  dynamic toTalRevenue;
  dynamic toTalProfit;
  dynamic toTalCost;
  int? capacity;
  String? fuelType;
  dynamic status;
  String? route;
  String? vehicleType;
  dynamic timeStart;
  dynamic timeEnd;
  String? destination;
  String? departure;
  String? cargoType;
  dynamic previousMaintenanceDate;
  dynamic nextMaintenanceDate;
  int? currentLoad;
  int? maxLoad;
  dynamic cargoList;

  ListContainer({this.idVehicle, this.driverList, this.historyRouteList, this.historyIncomeList, this.timeStartList, this.timeEndList, this.toTalRevenue, this.toTalProfit, this.toTalCost, this.capacity, this.fuelType, this.status, this.route, this.vehicleType, this.timeStart, this.timeEnd, this.destination, this.departure, this.cargoType, this.previousMaintenanceDate, this.nextMaintenanceDate, this.currentLoad, this.maxLoad, this.cargoList});

  ListContainer.fromJson(Map<String, dynamic> json) {
    idVehicle = json["idVehicle"];
    driverList = json["driverList"] == null ? null : List<String>.from(json["driverList"]);
    historyRouteList = json["historyRouteList"];
    historyIncomeList = json["historyIncomeList"];
    timeStartList = json["timeStartList"];
    timeEndList = json["timeEndList"];
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
    cargoType = json["cargoType"];
    previousMaintenanceDate = json["previousMaintenanceDate"];
    nextMaintenanceDate = json["nextMaintenanceDate"];
    currentLoad = json["currentLoad"];
    maxLoad = json["maxLoad"];
    cargoList = json["cargoList"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idVehicle"] = idVehicle;
    if(driverList != null) {
      _data["driverList"] = driverList;
    }
    _data["historyRouteList"] = historyRouteList;
    _data["historyIncomeList"] = historyIncomeList;
    _data["timeStartList"] = timeStartList;
    _data["timeEndList"] = timeEndList;
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
    _data["cargoType"] = cargoType;
    _data["previousMaintenanceDate"] = previousMaintenanceDate;
    _data["nextMaintenanceDate"] = nextMaintenanceDate;
    _data["currentLoad"] = currentLoad;
    _data["maxLoad"] = maxLoad;
    _data["cargoList"] = cargoList;
    return _data;
  }
}