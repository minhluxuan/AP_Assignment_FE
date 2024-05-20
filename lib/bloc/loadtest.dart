import '../model/classList.dart';
import 'dart:async';
import '../model/text2.dart';

Map<String, String> idRouteToStatusMap = {};
late Future<List<ListContainer>> fu_trips;
late List<ListContainer> trips;
// late List<Vehicle> vehicles;
// late List<Driver> drivers;
List<String> danhsach = <String>[];
List<String> danhsach1 = <String>[];

Future<List<String>> load2(String license) async {
  fu_trips = fetchIdvehicleData(
      'http://localhost:8081/api/container/setContainer/$license');
  trips = await fu_trips;
  for (var trip in trips) {
    if (trip.idVehicle != null && !danhsach.contains(trip.idVehicle)) {
      print(trip.idVehicle);
      danhsach.add(trip.idVehicle!);
    }
  }
  return danhsach;
}

Future<List<String>> load1(String license) async {
  fu_trips =
      fetchIdvehicleData('http://localhost:8081/api/coach/setCoach/$license');
  trips = await fu_trips;
  for (var trip in trips) {
    if (trip.idVehicle != null && !danhsach1.contains(trip.idVehicle)) {
      print(trip.idVehicle);
      // String? status = idRouteToStatusMap['${trip.idVehicle}'];

      // print(status);
      danhsach1.add(trip.idVehicle!);
    }
  }
  return danhsach1;
}
