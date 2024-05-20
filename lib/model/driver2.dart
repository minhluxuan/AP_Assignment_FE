// class Driver {
//   final String id;
//   final String name;
//   final String date;
//   final String tuyen;
//   final String add;
//   final String phonenumber;
//   final String email;
//   final String lisence;
//   final String typeCar;
//   final String sex;
//   final String cccd;
//   Driver({
//     required this.id,
//     required this.name,
//     required this.tuyen,
//     required this.add,
//     required this.phonenumber,
//     required this.email,
//     required this.date,
//     required this.lisence,
//     required this.typeCar,
//     required this.sex,
//     required this.cccd,
//   });
class ApiUrls {
  final Uri apiTripsList = Uri.parse('http://localhost:8083/api/drivers');
}

class Driver {
  String id;
  String name;
  String date;
  String tuyen;
  String add;
  String phonenumber;
  String email;
  String lisence;
  String typeCar;
  String sex;
  String cccd;

  Driver({
    required this.id,
    required this.name,
    required this.tuyen,
    required this.add,
    required this.phonenumber,
    required this.email,
    required this.date,
    required this.lisence,
    required this.typeCar,
    required this.sex,
    required this.cccd,
  });

  // kiểm tra null trước khi gán giá trị cho các trường trong hàm từJson
  // Driver.fromJson(Map<String, dynamic> json)
  //     : id = json["id"] ?? "",
  //       name = json["name"] ?? "",
  //       add = json["add"] ?? "",
  //       phonenumber = json["phone_number"] ?? "",
  //       lisence = json["license"] ?? "",
  //       cccd = json["cccd"] ?? "",
  //       tuyen = "",
  //       email = "",
  //       date = "",
  //       typeCar = "",
  //       sex = "";

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "add": add,
  //     "phone_number": phonenumber,
  //     "license": lisence,
  //     "cccd": cccd,
  //   };
  // }
}

// class bioDriver extends Driver {
//   @override
//   String add = '';
//   @override
//   String phonenumber = '';
//   @override
//   String email = "";
//   @override
//   String lisence;
//   @override
//   String typeCar;
//   bioDriver(
//     id,
//     name,
//     tuyen,
//     this.add,
//     this.email,
//     this.lisence,
//     this.phonenumber,
//     this.typeCar,
//   ) : super(id: '', name: '', tuyen: '');
// }
class Drivers {
  String? status;
  String? message;
  List<Data>? data;

  Drivers({this.status, this.message, this.data});

  Drivers.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? name;
  String? address;
  String? phoneNumber;
  String? license;
  String? cccd;
  String? routeId;
  String? yearOfBirth;
  String? gender;
  String? status;
  String? vehicleId;
  String? vehicleType;
  String? email;
  dynamic createdAt;

  Data({
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.license,
    this.cccd,
    this.routeId,
    this.status,
    this.vehicleId,
    this.vehicleType,
    this.email,
    this.createdAt,
    this.gender,
    this.yearOfBirth,
  });

  Data.fromJson(Map<String, dynamic> json) {
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
    createdAt = json["createdAt"];
    yearOfBirth = json["yearOfBirth"];
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["address"] = address;
    data["phone_number"] = phoneNumber;
    data["license"] = license;
    data["cccd"] = cccd;
    data["routeId"] = routeId;
    data["status"] = status;
    data["vehicleId"] = vehicleId;
    data["vehicleType"] = vehicleType;
    data["email"] = email;
    data["createdAt"] = createdAt;
    data["gender"] = gender;
    data["yearOfBirth"] = yearOfBirth;
    return data;
  }
}
