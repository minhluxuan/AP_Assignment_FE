// ignore_for_file: non_constant_identifier_names
import '../../model/trips/json/driver.dart';
import '../../model/trips/json/route.dart';
import '../../model/trips/json/vehicle.dart';
import '../../model/trips/json/fetch.dart';
import '../../model/trips/trip.dart';
import '../../model/trips/driver.dart';
import '../../model/trips/vehicle.dart';
import '../../model/trips/income.dart';
import '../../model/trips/object.dart';

late Future<List<Driverj>> fu_drivers;
late Future<List<Vehiclej>> fu_vehicles;
late Future<List<Routes>> fu_trips;
late List<Routes> tripsj;
late List<Vehiclej> vehiclesj;
late List<Driverj> driversj;
late Future<List<String>> fu_seats;
List<String> seats = [];
List<Trip> matchTrips = [];

late Future<List<Income>> fu_inc;
late List<Income> inc;

void load() async {
  fu_trips = fetchRouteData('http://localhost:8082/api/route');
  fu_drivers = fetchDriverData('http://localhost:8082/api/drivers');
  fu_vehicles = fetchVehicleData('http://localhost:8082/api/coach');

  tripsj = await fu_trips;
  driversj = await fu_drivers;
  vehiclesj = await fu_vehicles;
  trips = mergeData(driversj, vehiclesj, tripsj);
}

String passId = "P10";
String name = "Khoa";

String convertDateFormat(String dateTimeString) {
  if (dateTimeString == "") return "";
  DateTime dateTime = DateTime.parse(dateTimeString);

  String formattedDate =
      "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";

  return formattedDate;
}

String convertTimeFormat(String dateTimeString) {
  if (dateTimeString == "") return "";
  DateTime dateTime = DateTime.parse(dateTimeString);

  String formattedTime =
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

  return formattedTime;
}

void getseat(Vehicle vehicle) async {
  fu_seats = getEmptySeats(vehicle.id);
  seats = await fu_seats;
}

List<Trip> mergeData(
    List<Driverj> drivers, List<Vehiclej> vehicles, List<Routes> trips) {
  List<Trip> mergedTrips = [];

  for (Routes route in tripsj) {
    Driverj? driver;
    for (var d in driversj) {
      if (d.routeId == route.idRoute) {
        driver = d;
        break;
      }
    }

    Vehiclej? vehicle;
    for (var d in vehiclesj) {
      if (d.idVehicle == (driver?.vehicleId)) {
        vehicle = d;
        break;
      }
    }
    if (driver != null && vehicle != null) {
      Trip trip = Trip(
        Driver(
            add: driver.address ?? "",
            id: driver.id ?? "",
            date: driver.cccd ?? "",
            email: driver.email ?? "",
            lisence: driver.license ?? "",
            name: driver.name ?? "",
            phonenumber: driver.phoneNumber ?? "",
            sex: "M",
            tuyen: driver.routeId ?? "",
            typeCar: driver.vehicleType ?? ""),
        Vehicle(
            name: vehicle.vehicleType ?? "",
            kind: vehicle.vehicleType ?? "",
            available: vehicle.status ?? "",
            id: vehicle.idVehicle ?? ""),
        "${route.departure ?? ""} - ${route.destination ?? ""}",
        route.departure ?? "",
        route.destination ?? "",
        convertDateFormat(vehicle.timeStart ?? DateTime.now().toString()),
        convertTimeFormat(vehicle.timeStart ?? DateTime.now().toString()),
        convertTimeFormat(vehicle.timeEnd ?? DateTime.now().toString()),
        vehicle.toTalCost ?? 0,
        vehicle.toTalProfit ?? 0,
        vehicle.toTalRevenue ?? 0,
        vehicle.historyRouteList ?? [],
        vehicle.historyIncomeList ?? [],
        vehicle.timeStartList ?? [],
        vehicle.timeEndList ?? [],
        route.station ?? [],
        route.duration ?? 0,
        route.distance ?? 0,
        vehicle.numberOfSeats ?? 0,
        vehicle.passID ?? [],
        vehicle.emptySeat ?? [],
      );
      mergedTrips.add(trip);
    }
  }
  return mergedTrips;
}
