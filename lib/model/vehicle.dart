
class Vehicle {
  
  String name = '';
  String car = '';
  String kind = '';
  String license = '';
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

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['name'] ?? '',
      car: json['car'] ?? '',
      kind: json['kind'] ?? '',
      license: json['license'] ?? '',
      previousMaintenanceDate: DateTime.tryParse(json['previousMaintenanceDate'] ?? ''),
      nextMaintenanceDate: DateTime.tryParse(json['nextMaintenanceDate'] ?? ''),
      currentLoad: json['currentLoad'] ?? 0,
      maxLoad: json['maxLoad'] ?? 0,
      cargoList: List<String>.from(json['cargoList'] ?? []),
      departure: json['departure'] ?? '',
      destination: json['destination'] ?? '',
      driverList: List<String>.from(json['driverList'] ?? []),
      numberOfSeats: json['numberOfSeats'] ?? 0,
      numberOfPassengers: json['numberOfPassengers'] ?? 0,
      emptySeat: List<String>.from(json['emptySeat'] ?? []),
      passengerList: List<String>.from(json['passengerList'] ?? []),
      vehicleType: json['vehicleType'] ?? '',
      idPassenger: json['idPassenger'] ?? '',
      seatingPosition: json['seatingPosition'] ?? '',
      cosPassenger: json['cosPassenger'] ?? 0.0,
      idCargo: json['idCargo'] ?? '',
      mass: json['mass'] ?? 0.0,
      receiver: json['receiver'] ?? '',
      sender: json['sender'] ?? '',
      sendingPlace: json['sendingPlace'] ?? '',
      receivingPlace: json['receivingPlace'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      nameCargo: json['nameCargo'] ?? '',
      size: json['size'] ?? 0.0,
      costCargo: json['costCargo'] ?? 0.0,
      idVehicle: json['idVehicle'] ?? '',
      capacity: json['capacity'] ?? 0,
      fuelType: json['fuelType'] ?? '',
      status: json['status'] ?? '',
      timeStart: DateTime.tryParse(json['timeStart'] ?? ''),
      timeEnd: DateTime.tryParse(json['timeEnd'] ?? ''),
      route: json['route'] ?? '',
      selectedPassenger: json['selectedPassenger'] ?? '',
      passengers: json['passengers'] ?? '',
      passenger: json['passenger'] ?? '',
      text: json['text'] ?? '',
      label: json['label'] ?? '',
      cargoType: json['cargoType'] ?? '',
      drivers: json['drivers'] ?? '',
      selectedSeat: json['selectedSeat'] ?? '',
      vehicleS: json['vehicleS'] ?? '',
      kindOfVehicleS: json['kindOfVehicleS'] ?? '',
      startS: json['startS'] ?? '',
      destinationS: json['destinationS'] ?? '',
      dateToStartS: json['dateToStartS'] ?? '',
      timeStartS: json['timeStartS'] ?? '',
      available: json['available'] ?? false,
    );
  }
}
