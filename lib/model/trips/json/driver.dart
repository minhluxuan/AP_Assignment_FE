class Driverj {
  String? id;
  String? name;
  String? address;
  String? phoneNumber;
  String? license;
  String? cccd;
  String? routeId;
  String? status;
  String? vehicleId;
  String? vehicleType;
  String? email;

  Driverj(
      {this.id,
      this.name,
      this.address,
      this.phoneNumber,
      this.license,
      this.cccd,
      this.routeId,
      this.status,
      this.vehicleId,
      this.vehicleType,
      this.email});

  Driverj.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    phoneNumber = json["phone_number"];
    license = json["license"];
    cccd = json["cccd"];
    routeId = json["routeId"];
    status = json["status"];
    vehicleId = json["vehicleId"];
    vehicleType = json["vehicleType"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["address"] = address;
    _data["phone_number"] = phoneNumber;
    _data["license"] = license;
    _data["cccd"] = cccd;
    _data["routeId"] = routeId;
    _data["status"] = status;
    _data["vehicleId"] = vehicleId;
    _data["vehicleType"] = vehicleType;
    _data["email"] = email;
    return _data;
  }

  @override
  String toString() {
    return 'Driverj{id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, license: $license, cccd: $cccd, routeId: $routeId, status: $status, vehicleId: $vehicleId, vehicleType: $vehicleType, email: $email}';
  }
}
