import 'driver.dart';
import 'route.dart';
import 'vehicle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../income.dart';

Future<List<Vehiclej>> fetchVehicleData(String url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<Vehiclej> vehicles = parseVehicles(response.body);
    return vehicles;
  } else {
    print('Failed to load vehicles. Error: ${response.statusCode}');
  }
  return [];
}

List<Vehiclej> parseVehicles(String responseBody) {
  final jsonData = json.decode(responseBody);
  final List<dynamic> vehiclesData = jsonData['data'];
  List<Vehiclej> vehicles = [];

  for (var vehicleData in vehiclesData) {
    Vehiclej vehicle = Vehiclej.fromJson(vehicleData);
    vehicles.add(vehicle);
  }
  return vehicles;
}

Future<List<Routes>> fetchRouteData(String url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<Routes> routes = parseRoutes(response.body);
    return routes;
  } else {
    print('Failed to load routes. Error: ${response.statusCode}');
  }
  return [];
}

List<Routes> parseRoutes(String responseBody) {
  final jsonData = json.decode(responseBody);
  final List<dynamic> routesData = jsonData['data'];
  List<Routes> routes = [];

  for (var routeData in routesData) {
    Routes route = Routes.fromJson(routeData);
    routes.add(route);
  }

  return routes;
}

Future<List<Driverj>> fetchDriverData(String url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<Driverj> routes = parseDrivers(response.body);
    return routes;
  } else {
    print('Failed to load routes. Error: ${response.statusCode}');
  }
  return [];
}

List<Driverj> parseDrivers(String responseBody) {
  final jsonData = json.decode(responseBody);
  final List<dynamic> routesData = jsonData['data'];
  List<Driverj> routes = [];

  for (var routeData in routesData) {
    Driverj route = Driverj.fromJson(routeData);
    routes.add(route);
  }

  return routes;
}

Future<List<String>> getEmptySeats(String vehicle) async {
  List<String> emptySeats = [];

  try {
    var response = await http
        .get(Uri.parse('http://localhost:8082/api/coach/listPassenger/Coach1'));

    if (response.statusCode == 200) {
      // Phân tích dữ liệu JSON
      var jsonData = jsonDecode(response.body);

      // Lấy danh sách các vị trí đã có khách hàng
      List<String> occupiedSeats = [];
      for (var passenger in jsonData['data']) {
        occupiedSeats.add(passenger['seatingPosition']);
      }

      // Tạo danh sách các vị trí chưa có khách hàng
      for (int i = 1; i <= 10; i++) {
        // Giả sử xe có 10 vị trí ngồi, bạn có thể thay đổi số lượng tùy theo nhu cầu
        String seatNumber = i.toString();
        if (!occupiedSeats.contains(seatNumber)) {
          emptySeats.add(seatNumber);
        }
      }
    } else {
      print('Đã xảy ra lỗi: ${response.statusCode}');
    }
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi yêu cầu: $e');
  }

  return emptySeats;
}

Future<List<Income>> layDanhSachIncome(String apiUrl) async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final dataList = jsonData['data'] as List;

    List<Income> incomes =
        dataList.map((item) => Income.fromJson(item)).toList();
    return incomes;
  } else {
    throw Exception('Failed to load incomes. Error: ${response.statusCode}');
  }
}
