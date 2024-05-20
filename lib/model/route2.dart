import 'dart:math';

class Routes {
  String? idRoute;
  String? departure;
  String? destination;
  List<String>? station;
  double? distance;
  double? duration;
  double? cost;
  String? income;

  Routes(
      {this.idRoute,
      this.departure,
      this.destination,
      this.station,
      this.distance,
      this.duration,
      this.income}) {
    cost = (distance == null ? 0 : calculateTotalCost(distance!));
  }

  Routes.fromJson(Map<String, dynamic> json) {
    idRoute = json["idRoute"];
    departure = json["departure"];
    destination = json["destination"];
    station =
        json["station"] == null ? null : List<String>.from(json["station"]);
    distance = json["distance"].toDouble();
    duration = json["duration"].toDouble();
    income = json["income"];
  }
}

double calculateTotalCost(double distance) {
  double randomMultiplier = 0.2 + Random().nextDouble() * 0.3;
  double calculatedCost = randomMultiplier * distance;
  return calculatedCost;
}
