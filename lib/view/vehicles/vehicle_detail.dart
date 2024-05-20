import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> vehicle;

  const DetailPage({required this.vehicle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin chi tiết'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: vehicle["vehicleType"].toString().toLowerCase() == "coach" ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${vehicle["idVehicle"]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Loại: ${vehicle["vehicleType"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Tuyến: ${vehicle["departure"]} → ${vehicle["destination"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Sức chứa: ${vehicle["capacity"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Tài xế đảm nhận: ${vehicle["driverList"] != null ? vehicle["driverList"].join(", ") : "Trống"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Danh sách hành khách: ${vehicle["passengerList"] != null ? vehicle["passengerList"].join(", ") : "Trống"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Ghế trống: ${vehicle["emptySeat"] != null ? vehicle["emptySeat"].join(", ") : "Trống"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Ngày bảo dưỡng gần đây: ${vehicle["previousMaintenanceDate"] != null ? vehicle["previousMaintenanceDate"].join(", ") : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Ngày bảo dưỡng kế tiếp (dự kiến): ${vehicle["nextMaintenanceDate"] != null ? vehicle["nextMaintenanceDate"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Trạng thái: ${vehicle["status"] != null ? vehicle["status"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Thời điểm khởi hành: ${vehicle["timeStart"] != null ? vehicle["timeStart"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Thời điểm hoàn thành (dự kiến): ${vehicle["timeEnd"] != null ? vehicle["timeEnd"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            // Add more vehicle details as needed
          ],
        ) : Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${vehicle["idVehicle"]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Loại: ${vehicle["vehicleType"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Tuyến: ${vehicle["departure"]} → ${vehicle["destination"]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Danh sách hàng hóa: ${vehicle["cargoList"] != null ? vehicle["cargoList"] : "Trống"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Loại hàng hóa: ${vehicle["cargoType"] != null ? vehicle["cargoType"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Tải trọng hiện tại: ${vehicle["currentLoad"] != null ? vehicle["currentLoad"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Tài xế đảm nhận: ${vehicle["driverList"] != null ? vehicle["driverList"].join(", ") : "Trống"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Loại nhiên liệu: ${vehicle["fuelType"] != null ? vehicle["fuelType"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Ngày bảo dưỡng gần đây: ${vehicle["previousMaintenanceDate"] != null ? vehicle["previousMaintenanceDate"].join(", ") : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Ngày bảo dưỡng kế tiếp (dự kiến): ${vehicle["nextMaintenanceDate"] != null ? vehicle["nextMaintenanceDate"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Trạng thái: ${vehicle["status"] != null ? vehicle["status"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Thời điểm khởi hành: ${vehicle["timeStart"] != null ? vehicle["timeStart"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Thời điểm hoàn thành (dự kiến): ${vehicle["timeEnd"] != null ? vehicle["timeEnd"] : "Chưa cập nhật"}',
              style: TextStyle(fontSize: 16),
            ),
            ]),
      ),
    );
  }
}
