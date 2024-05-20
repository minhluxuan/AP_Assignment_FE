class Route {
  String idRoute;
  String departure;
  String destination;
  List<String> station;
  double distance;
  double duration;
  String income;

  Route(
      {required this.idRoute,
      required this.departure,
      required this.destination,
      required this.station,
      required this.distance,
      required this.duration,
      required this.income});
}

// class Route {
//   String? status;
//   String? message;
//   Data? data;

//   Route({this.status, this.message, this.data});

//   Route.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     data = json["data"] == null ? null : Data.fromJson(json["data"]);
//   }

//   Map<String, dynamic> toJson() {
//     // ignore: no_leading_underscores_for_local_identifiers
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["status"] = status;
//     _data["message"] = message;
//     if (data != null) {
//       _data["data"] = data?.toJson();
//     }
//     return _data;
//   }
// }

class Data {
  String? idRoute;
  String? departure;
  String? destination;
  List<dynamic>? station;
  int? distance;
  double? duration;
  String? income;

  Data(
      {this.idRoute,
      this.departure,
      this.destination,
      this.station,
      this.distance,
      this.duration,
      this.income});

  Data.fromJson(Map<String, dynamic> json) {
    idRoute = json["idRoute"];
    departure = json["departure"];
    destination = json["destination"];
    station = json["station"] ?? [];
    distance = json["distance"];
    duration = json["duration"];
    income = json["income"];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idRoute"] = idRoute;
    _data["departure"] = departure;
    _data["destination"] = destination;
    if (station != null) {
      _data["station"] = station;
    }
    _data["distance"] = distance;
    _data["duration"] = duration;
    _data["income"] = income;
    return _data;
  }
}
