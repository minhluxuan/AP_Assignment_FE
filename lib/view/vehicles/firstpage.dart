import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapp/view/vehicles/detailInfo.dart';
import '../../model/vehicle.dart';
import 'update_infor.dart';
import 'infor.dart';
import 'new_customer.dart';
import 'new_goods.dart';
import 'page2.dart';
import 'package:http/http.dart' as http;
import '../../bloc/getToken.dart';
import '../trips/admin_home.dart';
// ignore: camel_case_types
class firstpageveh extends StatefulWidget {
  const firstpageveh({
    super.key,
  });
  @override
  State<firstpageveh> createState() => _MyAppState();
}

class _MyAppState extends State<firstpageveh> {
  // final List<Driver> driver = [];

  // final random = Random();
  // // final randomNumber = random.nextInt(101);
  // void _handleAddtask(var name, var tuyen, var lisence, var email, var add,
  //     var phonenum, var typeCar, var date, var sex, var cccd) {
  //   final newItem = Driver(
  //     id: (1000000 + random.nextInt(9999999)).toString(),
  //     name: name,
  //     tuyen: tuyen,
  //     lisence: lisence,
  //     add: add,
  //     phonenumber: phonenum,
  //     email: email,
  //     typeCar: typeCar,
  //     date: date,
  //     sex: sex,
  //     cccd: cccd,
  //   );
  //   setState(() {
  //     driver.add(newItem);
  //   });
  // }

  // void _handelDeleteTap(var id) {
  //   setState(() {
  //     driver.removeWhere((items) => items.id == id);
  //   });
  // }
  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminMenu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF143234),
        centerTitle: true,
        title: const Text("Phương tiện",
        style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: () {
            retur;
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            Column(children: [
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              SizedBox(
                // width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2, // Two columns per row
                      crossAxisSpacing: 20, // Spacing between columns
                      mainAxisSpacing: 40, // Spacing between rows
                      children: <Widget>[
                        NewWidget(label: 'ĐĂNG KÝ XE MỚI'),
                        NewWidget(label: 'CẬP NHẬT THÔNG TIN'),
                        NewWidget(label: 'THÔNG TIN CHI TIẾT'),
                        NewWidget(label: 'BẢO DƯỠNG'),
                        NewWidget(label: 'KHÁCH HÀNG'),
                        NewWidget(label: 'HÀNG HÓA'),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewWidget extends StatelessWidget {
  final String label;

  NewWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  Future<List<String>> getData(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8762/api/vehicle'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    });
      print(response);
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        return decodedResponse.data;
      } else {
        print('Error: ${response.statusCode}');
        return []; // Trả về danh sách rỗng nếu có lỗi
      }
    } catch (e) {
      print('Error: $e');
      return []; // Trả về danh sách rỗng nếu có lỗi
    }
  }

@override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextButton(
        onPressed: () {
          switch (label) {
            case "ĐĂNG KÝ XE MỚI":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const page2()),
              );
              break;
            case "CẬP NHẬT THÔNG TIN":
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateInfor(toPage: "INFOR_UPDATE"),
                ),
              );
              break;
            case "THÔNG TIN CHI TIẾT":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailInfo()),
              );
              break;
            case 'BẢO DƯỠNG':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpdateInfor(toPage: "MAINTE")),
              );
              break;
            case 'KHÁCH HÀNG':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewCustomer()),
              );
              break;
            case 'HÀNG HÓA':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewGoods()),
              );
              break;
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF143234)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          )
        )
        
      ),
    );
  }
}