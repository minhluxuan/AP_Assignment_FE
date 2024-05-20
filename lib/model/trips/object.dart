import 'driver.dart';
import 'trip.dart';
import 'vehicle.dart';
import 'dart:math';

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
    double randomNumber = random.nextDouble() * (18 - 13) + 13;
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

List<Driver> drivers = [];
List<Vehicle> vehicles = [];
List<Trip> trips = [];

void cloneObj() {}
