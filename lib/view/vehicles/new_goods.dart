import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapp/view/vehicles/firstpage.dart';
import 'package:newapp/widgets/trips/custom_dropdownlist.dart';
import '../../model/template.dart';
import 'package:http/http.dart' as http;
import '../../bloc/getToken.dart';

class NewGoods extends StatefulWidget {
  const NewGoods({Key? key}) : super(key: key);

  @override
  State<NewGoods> createState() => _NewGoodsState();
}

class _NewGoodsState extends State<NewGoods> {
  TextEditingController nameCargo = TextEditingController();
  TextEditingController idCargo = TextEditingController();
  TextEditingController idVehicle = TextEditingController();
  TextEditingController mass = TextEditingController();
  TextEditingController sendingPlace = TextEditingController();
  TextEditingController receivingPlace = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController sender = TextEditingController();
  TextEditingController receiver = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController costCargo = TextEditingController(); 
  TextEditingController cargoType = TextEditingController();
  // Fix here
  //late String vehicleType;

  @override
  void initState(){
    super.initState();
    idCargo = TextEditingController();
    idVehicle = TextEditingController();
    mass = TextEditingController();
    receiver = TextEditingController();
    sender = TextEditingController();
    sendingPlace = TextEditingController();
    receivingPlace = TextEditingController();
    phoneNumber = TextEditingController();
    cargoType = TextEditingController();
    nameCargo = TextEditingController();
    size = TextEditingController();
    costCargo = TextEditingController();
  }

  void returnToFirstPage() {
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
                onPressed: returnToFirstPage,
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
              child: Container(
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
                      CusTextField(name: idCargo, text: "ID hàng"),
                      const SizedBox(height: 15),
                      CusTextField(name: nameCargo, text: "Tên hàng hóa"),
                      const SizedBox(height: 15),
                      CusTextField(name: cargoType, text: "Loại hàng hóa"),
                       const SizedBox(height: 15),
                      CusTextField(name: mass, text: "Khối lượng"),
                      const SizedBox(height: 15),
                      CusTextField(name: receiver, text: "Người nhận"),
                      const SizedBox(height: 15),
                      CusTextField(name: sender, text: "Người gửi"),
                      const SizedBox(height: 15),
                      CusTextField(name: phoneNumber, text: "Số điện thoại"),
                      const SizedBox(height: 15),
                      CusTextField(name: sendingPlace, text: "Nơi gửi"),
                      const SizedBox(height: 15),
                      CusTextField(name: receivingPlace, text: "Nơi nhận"),
                      const SizedBox(height: 15),
                      const Text(
                        "Xe",
                        style: TextStyle(fontSize: mainTextSize),
                      ),
                      CustomDropdown(
                        items: const ["Container1", "Contarner2"],
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              idVehicle.text = val;
                            });
                          }
                        },
                        isVehicleInfor: true,
                        labelText: '',
                      ),
                      const SizedBox(height: 15),
                      CusTextField(name: costCargo, text: "Giá hàng"),
                      const SizedBox(height: 15),
                      CusTextField(name: size, text: "Thể tích"),
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
              onPressed: () => {
                submitData(),
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
        "idCargo": idCargo.text,
        "idVehicle": idVehicle.text,
        "mass": mass.text,
        "receiver": receiver.text,
        "sender": sender.text,
        "sendingPlace": sendingPlace.text,
        "receivingPlace": receivingPlace.text,
        "phoneNumber": phoneNumber.text,
        "cargoType": cargoType.text,
        "nameCargo": nameCargo.text,
        "size": size.text,
        "costCargo": costCargo.text

      };
      try {
      // Send POST request
      final response = await http.post(
        Uri.parse('http://localhost:8762/api/cargo'),
        body: json.encode(postData),
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    }
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
  const CusTextField({Key? key, required this.name, required this.text}) : super(key: key);

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
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
