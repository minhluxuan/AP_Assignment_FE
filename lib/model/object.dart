import 'driver.dart';
import 'trip.dart';
import 'vehicle.dart';
import 'dart:math';

List<Driver> drivers = [];
List<Vehicle> vehicles = [];
List<Trip> trips = [];

List<String> generateDaysInJanuary() {
  List<String> days = [];
  for (int i = 1; i <= 31; i++) {
    String day = i < 10 ? '0$i' : '$i';
    days.add('$day/01');
  }
  return days;
}

List<String> januaryDays = generateDaysInJanuary();
List<double> generateRandomNumbers(int count) {
  Random random = Random();
  List<double> numbers = [];
  for (int i = 0; i < count; i++) {
    double randomNumber = random.nextDouble() * 20 + 1;
    numbers.add(randomNumber);
  }
  return numbers;
}

List<double> randomNumbers = generateRandomNumbers(31);

String? vehicleS;
String? kindOfVehicleS;
String? startS;
String? destinationS;
String? dateToStartS;
String? timeStartS;

void cloneObj() {
  drivers.add(Driver(
      add: "1",
      email: "@",
      date: "1/1",
      id: "1",
      lisence: "C1",
      name: "K",
      phonenumber: "0908",
      sex: "M",
      tuyen: "A<->B",
      typeCar: "Car"));
  drivers.add(Driver(
      add: "1",
      email: "@",
      date: "1/1",
      id: "1",
      lisence: "C1",
      name: "K",
      phonenumber: "0908",
      sex: "M",
      tuyen: "A<->B",
      typeCar: "Car"));
  drivers.add(Driver(
      add: "1",
      email: "@",
      date: "1/1",
      id: "1",
      lisence: "C1",
      name: "K",
      phonenumber: "0908",
      sex: "M",
      tuyen: "A<->B",
      typeCar: "Car"));
  drivers.add(Driver(
      add: "1",
      email: "@",
      date: "1/1",
      id: "1",
      lisence: "C1",
      name: "K",
      phonenumber: "0908",
      sex: "M",
      tuyen: "A<->B",
      typeCar: "Car"));
}