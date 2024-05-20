import 'load_object.dart';

import '../../model/trips/customer.dart';
import '../../model/trips/trip.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Customer cus = Customer([], []);

void loadCus() {
  List<Trip> tripsWithID = matchTrips
      .where((trip) => trip.passID.any((id) => id == passId))
      .toList();
  cus.cusTrips = tripsWithID;
  for (int i = 0; i < cus.cusTrips!.length; i++) {
    cus.seats!.add(3);
  }
}

Future<void> addPassenger(String vehicle, String id) async {
  final response = await http.post(
    Uri.parse('http://localhost:8082/api/coach/addPassenger/$vehicle/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('http://localhost:8082/api/coach/addPassenger/$vehicle/$id');
  if (response.statusCode == 200) {
    print('Thêm hành khách thành công');
  } else {
    // Xử lý khi thất bại
    print('Thêm hành khách không thành công');
  }
}

Future<void> deletePassenger(String vehicle, String id) async {
  final response = await http.delete(Uri.parse(
      'http://localhost:8082/api/coach/removePassenger/$vehicle/$id'));
  if (response.statusCode == 200) {
    print('Xóa hành khách thành công');
  } else {
    // Xử lý khi thất bại
    print('Xóa hành khách không thành công');
  }
}

Future<void> postData(String id, String des, String dep, String name,
    String seat, int cost, String vehicle) async {
  // Dữ liệu cần gửi
  Map<String, dynamic> data = {
    "idPassenger": id,
    "destination": des,
    "departure": dep,
    "name": name,
    "seatingPosition": seat,
    "cosPassenger": cost,
    "listVehicle": [vehicle],
  };

  // Chuyển đổi dữ liệu sang định dạng JSON
  String jsonData = jsonEncode(data);
  // Gửi request POST đến API
  try {
    if (passId == "") {
      var response = await http.post(
        Uri.parse('http://localhost:8082/api/passenger'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        print('Dữ liệu đã được gửi thành công.');
        print(response.body);
        final responseData = json.decode(response.body);
        final newId = responseData["data"]["idPassenger"] as String?;
        passId = newId!;
        print('ID mới được trả về: $newId');

        addPassenger(vehicle, newId);
      } else {
        print('Gửi dữ liệu không thành công. Mã lỗi: ${response.statusCode}');
      }
    } else {
      addPassenger(vehicle, passId);
    }

    // Kiểm tra mã trạng thái của response
  } catch (e) {
    print('Đã xảy ra lỗi khi gửi dữ liệu: $e');
  }
}

void createCustomer() {}
