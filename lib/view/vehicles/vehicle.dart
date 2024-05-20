import 'dart:ffi';

class Vehicle {
  
  String name = '';
  String car = '';
  String kind = '';
  String license = '';
 // String cargoType = '';
  DateTime? previousMaintenanceDate ;
  DateTime? nextMaintenanceDate;
  int currentLoad = 0;
  int maxLoad = 0;
  List<String> cargoList = [];
  String departure = '';
  String destination = '';
  List<String> driverList = [];
  int numberOfSeats = 0;
  int numberOfPassengers = 0;
  List<String> emptySeat = [];
 List<String> passengerList = [];
  String vehicleType = '';
  String idPassenger = '';
  String seatingPosition = '';
  double cosPassenger = 0.0;
  String idCargo = '';
  double mass = 0.0;
  String receiver = '';
  String sender = '';
  String sendingPlace = '';
  String receivingPlace = '';
  String phoneNumber = '';
  String nameCargo = '';
  double size = 0.0;
  double costCargo = 0.0;
  String idVehicle = '';
  int capacity = 0;
  String fuelType = '';
  String status = '';
  DateTime? timeStart;
  DateTime? timeEnd;
  String route = '';
  String selectedPassenger = '';
  String passengers = '';
  String passenger = '';
  String text = '';
  String label = '';
  String cargoType = '';
  String drivers = '';
  String selectedSeat = '';
  String? vehicleS; // Thêm dấu hỏi phía trước
  String? kindOfVehicleS; // Thêm dấu hỏi phía trước
  String? startS; // Thêm dấu hỏi phía trước
  String? destinationS; // Thêm dấu hỏi phía trước
  String? dateToStartS; // Thêm dấu hỏi phía trước
  String? timeStartS; // Thêm dấu hỏi phía trước

  bool available = false;
   
  Vehicle({
    required this.name,
    required this.car,
    required this.kind,
    required this.license,
    required this.cargoType,
    required this.previousMaintenanceDate,
    required this.nextMaintenanceDate,
    required this.currentLoad,
    required this.maxLoad,
    required this.cargoList,
    required this.departure,
    required this.destination,
    required this.driverList,
    required this.numberOfSeats,
    required this.numberOfPassengers,
    required this.emptySeat,
    required this.passengerList,
    required this.vehicleType,
    required this.idPassenger,
    required this.seatingPosition,
    required this.cosPassenger,
    required this.idCargo,
    required this.mass,
    required this.receiver,
    required this.sender,
    required this.sendingPlace,
    required this.receivingPlace,
    required this.phoneNumber,
    required this.nameCargo,
    required this.size,
    required this.costCargo,
    required this.idVehicle,
    required this.capacity,
    required this.fuelType,
    required this.status,
    required this.timeStart,
    required this.timeEnd,
    required this.route,
    required this.selectedPassenger,
    required this.passengers,
    required this.passenger,
    required this.text,
    required this.label,
    //required this.cargoType,
    required this.drivers,
    required this.selectedSeat,
    required this.vehicleS,
    required this.kindOfVehicleS,
    required this.startS,
    required this.destinationS,
    required this.dateToStartS,
    required this.timeStartS,
    required this.available,
  });
}
