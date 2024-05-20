import 'driver.dart';
import 'vehicle.dart';

class Trip {
  Driver? driver;
  Vehicle? vehicle;
  String sta2des = '';
  String date = '';
  String time = '';
  List<String> seat = [];
  Trip(this.driver, this.vehicle, this.sta2des, this.date, this.time) {
    String num = vehicle!.kind.substring(0, vehicle?.kind.indexOf(' '));
    if (vehicle!.name == 'Truck') num = '2';

    for (int i = 1; i <= int.parse(num); i++) {
      seat.insert(seat.length, i.toString());
    }
  }
}
