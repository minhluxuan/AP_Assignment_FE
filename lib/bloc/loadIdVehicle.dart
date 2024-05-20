import '../model/containerr.dart';
import 'dart:async';
import '../model/fetchIdVehicle2.dart';

Map<String, String> idRouteToStatusMap = {};
late Future<List<Coach>> fu_trips;
late List<Coach> trips;
// late List<Vehicle> vehicles;
// late List<Driver> drivers;
List<String> danhsach = <String>[];
List<String> danhsach1 = <String>[];

Future<List<String>> load2() async {
  fu_trips = fetchIdvehicleData('http://localhost:8081/api/container');
  trips = await fu_trips;
  for (var trip in trips) {
    if (trip.idVehicle != null && !danhsach.contains(trip.idVehicle)) {
      print(trip.idVehicle);
      danhsach.add(trip.idVehicle!);
    }
  }
  return danhsach;
}

Future<List<String>> load1() async {
  fu_trips = fetchIdvehicleData('http://localhost:8081/api/coach');
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

Future<Map<String, String>> getStatus() async {
  fu_trips = fetchIdvehicleData('http://localhost:8081/api/coach');
  trips = await fu_trips;

  // Đảm bảo rằng idRouteToStatusMap đã được khởi tạo trước khi thêm dữ liệu vào
  idRouteToStatusMap ??= {};

  for (var trip in trips) {
    // Kiểm tra trước khi thêm dữ liệu vào idRouteToStatusMap
    if (trip.idVehicle != null && trip.status != null) {
      idRouteToStatusMap[trip.idVehicle!] = trip.status!;
      print(idRouteToStatusMap[trip.idVehicle!] = trip.status!);
    }
  }

  return idRouteToStatusMap;
}
