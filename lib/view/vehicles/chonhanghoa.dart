import 'package:flutter/material.dart';
import 'package:newapp/view/thongtin_hanghoa.dart';

class ThongtinhanghoaPage extends StatefulWidget {
  @override
  _ThongtinhanghoaPageState createState() => _ThongtinhanghoaPageState();
}

class _ThongtinhanghoaPageState extends State<ThongtinhanghoaPage> {
  String selectedPassenger = ""; // Biến để lưu trạng thái của hành khách được chọn

  @override
  Widget build(BuildContext context) {
    final List<String> passengers = ["Hàng hóa 1", "Hàng hóa 2", "Hàng hóa 3"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách hàng hóa'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: passengers
                  .map(
                    (passenger) => RadioListTile<String>(
                      title: Text(passenger),
                      value: passenger,
                      groupValue: selectedPassenger,
                      onChanged: (value) {
                        setState(() {
                          selectedPassenger = value!;
                        });
                        // Điều hướng đến trang mới dựa trên lựa chọn của người dùng
                        switch (value) {
                          case 'Hàng hóa 1':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoodsDetailPage(),
                              ),
                            );
                            break;
                          case 'Hàng hóa 2':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoodsDetailPage(),
                              ),
                            );
                            break;
                          case 'Hàng hóa 3':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoodsDetailPage(),
                              ),
                            );
                            break;
                          default:
                            break;
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
