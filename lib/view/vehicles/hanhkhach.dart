import 'package:flutter/material.dart';

class PassengerListPage extends StatelessWidget {
  final List<String> passengers = ["Tài xế 1", "Tài xế 2", "Tài xế 3"]; // Danh sách các hành khách

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách hành khách'),
      ),
      body: ListView.builder(
        itemCount: passengers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'), // Hiển thị số thứ tự
            ),
            title: Text(passengers[index]),
            // Các thuộc tính khác cho mỗi hành khách
            // Ví dụ: Thông tin chi tiết, số điện thoại, v.v.
          );
        },
      ),
    );
  }
}
