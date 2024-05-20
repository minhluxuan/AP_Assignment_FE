import 'package:flutter/material.dart';

class DriverListPage extends StatelessWidget {
  final List<String> drivers = ["Tài xế 1", "Tài xế 2", "Tài xế 3"]; // Danh sách tài xế

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách tài xế'),
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'), // Hiển thị số thứ tự
            ),
            title: Text(drivers[index]),
            // Các thuộc tính khác cho mỗi tài xế, ví dụ như thông tin chi tiết, số điện thoại, v.v.
          );
        },
      ),
    );
  }
}
