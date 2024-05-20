import 'classList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../bloc/getToken.dart';

Future<List<ListContainer>> fetchIdvehicleData(String url) async {
  var response = await http.get(Uri.parse(url),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    });
  print(url);
  print(response.body);
  if (response.statusCode == 200) {
    print(response.body);
    final jsonData = json.decode(response.body);
    final List<dynamic> routesData = jsonData['data'];
    List<ListContainer> routes = [];

    for (var routeData in routesData) {
      ListContainer route = ListContainer.fromJson(routeData);
      print(route.idVehicle);
      routes.add(route);
    }

    return routes;
  } else {
    throw Exception('Failed to load idVehicle. Error: ${response.statusCode}');
  }
}

List<ListContainer> parseRoutes(String responseBody) {
  final jsonData = json.decode(responseBody);

  final List<dynamic> routesData = jsonData['data'];
  List<ListContainer> routes = [];

  for (var routeData in routesData) {
    ListContainer route = ListContainer.fromJson(routeData);
    print(route.idVehicle);
    routes.add(route);
  }

  return routes;
}
