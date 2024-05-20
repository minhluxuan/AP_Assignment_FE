import 'containerr.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../bloc/getToken.dart';

Future<List<Coach>> fetchIdvehicleData(String url) async {
  var response = await http.get(Uri.parse(url),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    });
  print(url);
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final List<dynamic> routesData = jsonData['data'];
    List<Coach> routes = [];

    for (var routeData in routesData) {
      Coach route = Coach.fromJson(routeData);
      print(route.idVehicle);
      routes.add(route);
    }

    return routes;
  } else {
    throw Exception('Failed to load idVehicle. Error: ${response.statusCode}');
  }
}

List<Coach> parseRoutes(String responseBody) {
  final jsonData = json.decode(responseBody);

  final List<dynamic> routesData = jsonData['data'];
  List<Coach> routes = [];

  for (var routeData in routesData) {
    Coach route = Coach.fromJson(routeData);
    print(route.idVehicle);
    routes.add(route);
  }

  return routes;
}
