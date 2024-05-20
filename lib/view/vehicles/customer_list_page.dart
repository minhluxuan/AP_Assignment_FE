import 'package:flutter/material.dart';
import 'package:newapp/view/thongtinhanhkhach.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  String? selectedPassenger;

  @override
  Widget build(BuildContext context) {
    final List<String> passengers = ["Hành khách 1", "Hành khách 2", "Hành khách 3"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách hành khách'),
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
                          selectedPassenger = value;
                        });
                        // Điều hướng đến trang mới dựa trên lựa chọn của người dùng
                        switch (value) {
                          case 'Hành khách 1':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThongtinhanhkhachPage(),
                              ),
                            );
                            break;
                          case 'Hành khách 2':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThongtinhanhkhachPage(),
                              ),
                            );
                            break;
                          case 'Hành khách 3':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThongtinhanhkhachPage(),
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