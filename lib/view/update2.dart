import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/driver2.dart';
import '../view/firstpage2.dart';
import '../widgets/sex.dart';
import '../widgets/tuyenxe2.dart';
import '../widgets/dropdown2.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:email_validator/email_validator.dart';
import '../bloc/getToken.dart';

final _formKey = GlobalKey<FormState>();

class update extends StatefulWidget {
  var driver_name,
      driverid,
      status,
      address,
      cccd,
      createAt,
      email,
      phone,
      routeId,
      vehicleId,
      vehicleType,
      license;
  // final Function addTask;
  update({
    super.key,
    required this.driver_name,
    required this.driverid,
    required this.status,
    required this.address,
    required this.cccd,
    required this.createAt,
    required this.email,
    required this.phone,
    required this.routeId,
    required this.vehicleId,
    required this.vehicleType,
    required this.license,
  });
  @override
  _resgister createState() => _resgister(
      driver_name: driver_name,
      driverid: driverid,
      status: status,
      address: address,
      cccd: cccd,
      createAt: createAt,
      email: email,
      phone: phone,
      routeId: routeId,
      vehicleId: vehicleId,
      vehicleType: vehicleType,
      license: license);
}

class _resgister extends State<update> {
  var driver_name,
      driverid,
      status,
      address,
      cccd,
      createAt,
      email,
      phone,
      routeId,
      vehicleId,
      vehicleType,
      license;
  _resgister({
    required this.driver_name,
    required this.driverid,
    required this.status,
    required this.address,
    required this.cccd,
    required this.createAt,
    required this.email,
    required this.phone,
    required this.routeId,
    required this.vehicleId,
    required this.vehicleType,
    required this.license,
  }) {
    controllername.text = driver_name;
    controlleradd.text = address;
    controllerCitizenCard.text = cccd;
    controlleremail.text = email;
    controllerlisence.text = license;
    controllerphonenum.text = phone;
    controllertuyen.text = routeId;
    controllerxe.text = vehicleType;
  }
  TextEditingController controllername = TextEditingController();
  // TextEditingController controllerid = TextEditingController();
  TextEditingController controllertuyen = TextEditingController();
  TextEditingController controllerxe = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerlisence = TextEditingController();
  TextEditingController controllerphonenum = TextEditingController();
  TextEditingController controlleradd = TextEditingController();
  // TextEditingController controllerdate = TextEditingController();
  // TextEditingController controllersex = TextEditingController();
  TextEditingController controllerCitizenCard = TextEditingController();

  String? validateName(String? label) {
    final isNameValid = controllername.text;
    if (isNameValid.isEmpty) {
      return 'Please enter a valid name';
    }
    return null;
  }

  // String? validateDate(String? label) {
  //   final isDateValid = controllerdate.text;
  //   if (isDateValid.isEmpty) {
  //     return 'Please enter a valid date';
  //   }
  //   return null;
  // }
  Future<void> submitData() async {
    // Create JSON data
    if (controlleradd.text.isEmpty ||
        controllerCitizenCard.text.isEmpty ||
        controllerlisence.text.isEmpty ||
        controllername.text.isEmpty ||
        controllerphonenum.text.isEmpty ||
        controlleremail.text.isEmpty) {
      print('Error: Fields cannot be empty');
      return; // Stop execution if any field is empty
    }

    Map<String, dynamic> postData = {
      "address": controlleradd.text,
      "cccd": controllerCitizenCard.text,
      "license": controllerlisence.text,
      "name": controllername.text,
      "phone_number": controllerphonenum.text,
      "email": controlleremail.text,
    };

    try {
      // Send POST request
      final response = await http.put(
        Uri.parse('http://localhost:8083/api/drivers/$driverid'),
        body: json.encode(postData),
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
      );

      // Check for successful response
      if (response.statusCode == 200) {
        ShowSuccess('Cập nhật thành công');
        print('Data submitted successfully!');
        print(response.body);

        // Process success response from the second API (if applicable)
      } else {
        ShowError('Cập nhật thất bại');
        print('Error submitting data: ${response.statusCode}');
        print(response.body);
        // Handle error response (e.g., display error message)
      }
    } on http.ClientException catch (e) {
      ShowError('Cập nhật thất bại');

      print('Error sending request: $e');
      // Handle connection errors
    } catch (e) {
      print('Error: $e');
      ShowError('Cập nhật thất bại');

      // Handle other errors
    }
  }

  void _handleOnclick(BuildContext context) {
    final name = controllername.text;
    // final tuyen = controllertuyen.text;
    final add = controlleradd.text;
    final lisence = controllerlisence.text;
    final phone = controllerphonenum.text;
    final email = controlleremail.text;
    // final typeCar = controllerxe.text;
    // final date = controllerdate.text;
    // final sex = controllersex.text;
    final card = controllerCitizenCard.text;

    if (name.isEmpty ||
        add.isEmpty ||
        lisence.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        card.isEmpty) {
      return;
    }

    // widget.addTask(
    //     name, tuyen, lisence, email, add, phone, typeCar, date, sex, card);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff143234),
        title: const Text(
          "CHỈNH SỬA THÔNG TIN ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 500,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // Điều chỉnh để làm cho góc cong nếu cần
                    image: const DecorationImage(
                      image: AssetImage('assetss/anh2.jpg'),
                      fit: BoxFit.cover, // Đảm bảo ảnh hiển thị đúng tỷ lệ
                    ),
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: validateName,
                  controller: controllername,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Họ và tên',
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  // validator: validateAdd,
                  controller: controlleradd,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Địa chỉ',
                    prefixIcon: Icon(Icons.home_filled),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  // validator: validateCard,
                  controller: controllerCitizenCard,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Căn cước công dân',
                    prefixIcon: Icon(Icons.card_giftcard),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  // validator: validatePhone,
                  keyboardType: TextInputType.number,
                  controller: controllerphonenum,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  // validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: controlleremail,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  // validator: validateLisence,
                  controller: controllerlisence,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Bằng lái xe hạng',
                    prefixIcon: Icon(Icons.drive_eta),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              //   DropdownMenuApp(
              //     onChanged: (p0) {
              //       setState(() {
              //         controllerxe.text = p0;
              //       });
              //     },
              //   ),
              //   const Padding(padding: EdgeInsets.only(bottom: 10)),
              //   TuyenxeMenuApp(
              //     onChanged: (p0) {
              //       setState(() {
              //         controllertuyen.text = p0;
              //       });
              //     },
              //   ),
              //   const Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        padding: const EdgeInsets.all(10),
        child: ElevatedButton.icon(
          onPressed: () async {
            await submitData();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const firstpage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff143234),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.5),
          ),
          icon: const Icon(Icons.save),
          label: const Text("Update"),
        ),
      ),
    );
  }

  void ShowSuccess(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void ShowError(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
