import 'dart:convert';

import 'package:flutter/material.dart';
import '../../model/template.dart';
import '../../widgets/trips/custom_dropdownlist.dart';
import 'firstpage.dart';
import 'package:http/http.dart' as http;
import '../../bloc/getToken.dart';


// Sửa xe chọn là 1 danh sách xe
List<String> seatList = List.generate(32, (index) => (index + 1).toString());

class NewCustomer extends StatefulWidget {
  const NewCustomer({Key? key}) : super(key: key);

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  TextEditingController name = TextEditingController();
  TextEditingController idPassenger = TextEditingController();
  TextEditingController seat = TextEditingController();
  TextEditingController departure = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController cosPassenger = TextEditingController();
  TextEditingController vehicleType = TextEditingController();
  late String vehiclePosition;
  late String seatingPosition;
  late String selectedSeat = ''; // Thêm biến này để lưu trữ ghế được chọn

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const firstpageveh()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, size: 30),
                onPressed: retur,
              ),
              const Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: mainTitleSize,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 223, 223),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusTextField(name: idPassenger, text: "ID khách"),
                      const SizedBox(height: 15),
                      CusTextField(name: name, text: "Họ và tên"),
                      const SizedBox(height: 15),
                      const Text(
                        "Xe",
                        style: TextStyle(fontSize: mainTextSize),
                      ),
                      CustomDropdown(
                        items: const ["Coach1", "Coach2", "Coach3"],
                        onChanged: (val) {
                          setState(() {
                            // vehicleType.text = val!;
                          });
                        },
                        isVehicleInfor: true,
                        labelText: '',
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Vị trí chỗ ngồi",
                        style: TextStyle(fontSize: mainTextSize),
                      ),
                      CustomDropdown(
                        items: seatList,
                        onChanged: (val) {
                          setState(() {
                            selectedSeat = val!;
                          });
                        },
                        isVehicleInfor: true,
                        labelText: '',
                      ),
                      const SizedBox(height: 15),
                      CusTextField(name: departure, text: "Nơi xuất phát"),
                      const SizedBox(height: 15),
                      CusTextField(name: destination, text: "Nơi đến"),
                      const SizedBox(height: 15),
                      CusTextField(name: cosPassenger, text: "Giá vé"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: mainColor,
            ),
            child: TextButton(
              onPressed: () {
                submitData();
              },
              child: const Text(
                "Lưu",
                style: TextStyle(color: Colors.white, fontSize: mainTextSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> submitData() async {
      Map<String, dynamic> postData = {
      "name": name.text,
      "idPassenger": idPassenger.text,
      "seat": seat.text,
      "departure": departure.text,
      "destination": destination.text,
      "cosPassenger": cosPassenger.text,
      "vehicleType": vehicleType.text,
      } ;//as Map<String, dynamic>;
      try { 
      // Send POST request
      final response = await http.post(
        Uri.parse('http://localhost:8762/api/passenger'),
        body: json.encode(postData),
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
      );
      // Check for successful response
      if (response.statusCode == 200) {
        print('Data submitted successfully!');
        print(response.body);
      } else {
        print('Error submitting data: ${response.statusCode}');
        print(response.body);
        // Handle error response (e.g., display error message)
      }
    } on http.ClientException catch (e) {
      print('Error sending request: $e');
      // Handle connection errors
    } catch (e) {
      print('Error: $e');
      // Handle other errors
    }
  } 
}

class CusTextField extends StatefulWidget {
  final TextEditingController name;
  final String text;
  const CusTextField({Key? key, required this.name, required this.text});

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(fontSize: mainTextSize),
        ),
        TextField(
          controller: widget.name,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
