import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapp/widgets/dropdown.dart';
import 'package:newapp/widgets/sex.dart';
import 'package:newapp/widgets/tuyenxe.dart';
import '../../widgets/vehicles/sex.dart';
import '../../widgets/vehicles/tuyenxe.dart';
import '../../widgets/vehicles/dropdown.dart';
import '../../bloc/getToken.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

final _formKey = GlobalKey<FormState>();

class register extends StatefulWidget {
  final Function addTask;
  const register({
    super.key,
    required this.addTask,
  });
  @override
  _resgister createState() => _resgister();
}

class _resgister extends State<register> {
  TextEditingController controllername = TextEditingController();
  // TextEditingController controllerid = TextEditingController();
  TextEditingController controllertuyen = TextEditingController();
  TextEditingController controllerxe = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerlisence = TextEditingController();
  TextEditingController controllerphonenum = TextEditingController();
  TextEditingController controlleradd = TextEditingController();
  TextEditingController controllerdate = TextEditingController();
  TextEditingController controllersex = TextEditingController();
  TextEditingController controllerCitizenCard = TextEditingController();

  String? validateName(String? label) {
    final isNameValid = controllername.text;
    if (isNameValid.isEmpty) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validateDate(String? label) {
    final isDateValid = controllerdate.text;
    if (isDateValid.isEmpty) {
      return 'Please enter a valid date';
    }
    return null;
  }

  String? validatePhone(String? label) {
    final isPhoneValid = controllerphonenum.text;
    if (isPhoneValid.isEmpty) {
      return 'Please enter a valid phone';
    }
    return null;
  }

  String? validateAdd(String? label) {
    final isAddValid = controlleradd.text;
    if (isAddValid.isEmpty) {
      return 'Please enter a valid address';
    }
    return null;
  }

  String? validateEmail(String? label) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(label ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateCard(String? label) {
    final isCardValid = controllerCitizenCard.text;
    if (isCardValid.isEmpty) {
      return 'Please enter a valid citizen identity card';
    }
    return null;
  }

  String? validateLisence(String? label) {
    final isLisenceValid = controllerlisence.text;
    if (isLisenceValid.isEmpty) {
      return 'Please enter a valid lisence';
    }
    return null;
  }

  void _handleOnclick(BuildContext context) {
    final name = controllername.text;
    final tuyen = controllertuyen.text;
    final add = controlleradd.text;
    final lisence = controllerlisence.text;
    final phone = controllerphonenum.text;
    final email = controlleremail.text;
    final typeCar = controllerxe.text;
    final date = controllerdate.text;
    final sex = controllersex.text;
    final card = controllerCitizenCard.text;

    if (name.isEmpty ||
        // tuyen.isEmpty ||
        sex.isEmpty ||
        add.isEmpty ||
        lisence.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        typeCar.isEmpty ||
        card.isEmpty ||
        date.isEmpty) {
      return;
    }

    widget.addTask(
        name, tuyen, lisence, email, add, phone, typeCar, date, sex, card);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff143234),
        title: const Text(
          "XE KHÁCH",
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: Text(
                  "WELCOME ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: validateDate,
                        // controller: controllertuyen,
                        keyboardType: TextInputType.number,
                        controller: controllerdate,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Năm sinh',
                          prefixIcon: Icon(Icons.calendar_today),
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
                  ),
                  Expanded(
                    child: GenderSelector(
                      onChanged: (Gender selectedGender) {
                        setState(() {
                          // Update controllersex.text based on the selected gender
                          switch (selectedGender) {
                            case Gender.male:
                              controllersex.text = "Nam";
                              break;
                            case Gender.female:
                              controllersex.text = "Nữ";
                              break;
                            default:
                              // Handle unexpected gender value (optional)
                              controllersex.text = ""; // Or set a default text
                              break;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: validateAdd,
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
                  // validator: validateCitizenCard,
                  controller: controllerCitizenCard,
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
                  validator: validatePhone,
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
                  validator: validateEmail,
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
                  validator: validateLisence,
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
              DropdownMenuApp(
                onChanged: (p0) {
                  setState(() {
                    controllerxe.text = p0;
                  });
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TuyenxeMenuApp(
                onChanged: (p0) {
                  setState(() {
                    controllertuyen.text = p0;
                  });
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        padding: const EdgeInsets.all(10),
        child: ElevatedButton.icon(
          onPressed: () => {
            submitData(),
            _formKey.currentState!.validate(),
            (_handleOnclick(context))
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
          label: const Text("Save"),
        ),
      ),
    );
  }

  // void submitData() async {
  //   var url = 'http://localhost:8762/api/drivers';

  //   Data data = Data(
  //     // id: "1",
  //     name: "Driver Name",
  //     // address: "Driver Address",
  //     phoneNumber: "Driver Phone Number",
  //     license: "Driver License",
  //     cccd: "Driver CCCD",
  //     // routeId: "Driver Route ID",
  //     // status: "Driver Status",
  //     // vehicleId: "Driver Vehicle ID",
  //     // vehicleType: "Driver Vehicle Type",
  //     email: "Driver Email",
  //     // createdAt: DateTime.now().toString(),
  //   );

  //   Drivers drivers = Drivers(
  //     status: "Success",
  //     message: "Data Retrieved Successfully",
  //     data: [data],
  //   );

  //   var response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(drivers.toJson()),
  //   );

  //   if (response.statusCode == 500) {
  //     print('Data sent successfully');
  //   } else {
  //     print('Failed to send data');
  //   }
  // }
  Future<void> submitData() async {
    // Tạo dữ liệu JSON
    Map<String, dynamic> postData = {
      "address": controlleradd.text,
      "cccd": controllerCitizenCard.text,
      "license": controllerlisence.text,
      "name": controllername.text,
      "phone_number": controllerphonenum.text,
      "email": controlleremail.text,
    };

    // Gửi yêu cầu POST đến API
    final response = await http.post(
      Uri.parse('localhost:8762/api/drivers'),
      body: json.encode(postData),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
    );
    if (response.statusCode == 200) {
      // Xử lý phản hồi ở đây nếu cần
    } else {
      // Xử lý lỗi nếu có
    }
  }
}
  
//   Future<void> submitData() async {
//     try {
//       final driver = Driver(
//         id: controllerdate.text,
//         name: controllername.text,
//         tuyen: controllertuyen.text,
//         add: controlleradd.text,
//         phonenumber: controllerphonenum.text,
//         email: controlleremail.text,
//         date: controllerdate.text,
//         lisence: controllerlisence.text,
//         typeCar: controllerxe.text,
//         sex: controllersex.text,
//         cccd: controllerCitizenCard.text,
//       );

//       const url = 'localhost:8762/api/drivers';
//       final headers = <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       };
//       final body = jsonEncode(driver.toJson());

//       final response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: body,
//       );

//       if (response.statusCode == 500) {
//         // Xử lý thành công khi nhận được phản hồi từ API
//         print('Data submitted successfully');
//       } else {
//         // Xử lý lỗi khi gặp lỗi phản hồi từ API
//         print('Failed to submit data. Error code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Xử lý lỗi nếu có lỗi xảy ra trong quá trình gửi dữ liệu
//       print('Error: $e');
//     }
//   }
// }
