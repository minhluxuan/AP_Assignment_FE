import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/driver2.dart';
import '../widgets/idXE.dart';
import '../widgets/listIdVehicle.dart';
import '../bloc/getToken.dart';

import '../view/firstpage2.dart';
import '../widgets/sex.dart';
import '../widgets/tuyenxe2.dart';
import '../widgets/dropdown2.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:email_validator/email_validator.dart';

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
  TextEditingController controllervehicleid = TextEditingController();
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

  bool isLicenseFilled = false;

  void checkLicenseFilled() {
    setState(() {
      if (controllerlisence.text.isNotEmpty) {
        if (controllerlisence.text[0] == 'B' &&
            controllerlisence.text.length == 2) {
          isLicenseFilled = true;
        } else if (controllerlisence.text == 'C' ||
            controllerlisence.text == 'D' ||
            controllerlisence.text == 'E') {
          isLicenseFilled = true;
        } else {
          isLicenseFilled = false;
        }
      } else {
        isLicenseFilled = false;
      }
    });
  }

  bool isType = false;

  void checkTypeFilled() {
    setState(() {
      isType = controllerxe.text.isNotEmpty;
    });
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
    } else if (isPhoneValid.length != 10) {
      return 'Invalid phonenumber. The card must have exactly 10 characters';
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

  // String? validateEmail(String? label) {
  //   RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
  //   final isEmailValid = emailRegex.hasMatch(label ?? '');
  //   if (!isEmailValid) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address.';
    }

    if (!EmailValidator.validate(email)) {
      return 'Please enter a valid email address/e.g: example@gmail.com';
    }

    return null; // Email is valid
  }

  String? validateCard(String? label) {
    final isCardValid = controllerCitizenCard.text;
    if (isCardValid.isEmpty) {
      return 'Please enter a valid citizen identity card';
    } else if (isCardValid.length != 12) {
      return 'Invalid card number. The card must have exactly 10 characters';
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
          "ĐĂNG KÍ",
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
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
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
                                controllersex.text = "Nu";
                                break;
                              default:
                                // Handle unexpected gender value (optional)
                                controllersex.text =
                                    ""; // Or set a default text
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
                    validator: validateCard,
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

                DropdownMenuApp(
                  onChanged: (p0) {
                    setState(() {
                      controllerxe.text = p0;
                    });
                  },
                ),

                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      checkLicenseFilled();
                    },
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

                // Conditionally render ListCoach widget
                if (isLicenseFilled) ...[
                  ListCoach(
                    vehicletype: controllerxe.text,
                    license: controllerlisence.text,
                    onChanged: (p0) {
                      setState(() {
                        controllervehicleid.text = p0;
                      });
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                ] else
                  const DropdownMenuApp1(),
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
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        padding: const EdgeInsets.all(10),
        child: ElevatedButton.icon(
          onPressed: () async {
            // _formKey.currentState!.validate();
            // await submitData();
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const firstpage()),
            // );
            if (_formKey.currentState!.validate()) {
              // Nếu dữ liệu hợp lệ, gửi dữ liệu và điều hướng
              await submitData();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const firstpage()),
              );
            }
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
  //   var url = 'http://localhost:8080/api/drivers';
  //   Data data = Data(
  //     id: "1",
  //     name: "Driver Name",
  //     address: "Driver Address",
  //     phoneNumber: "Driver Phone Number",
  //     license: "Driver License",
  //     cccd: "Driver CCCD",
  //     routeId: "Driver Route ID",
  //     status: "Driver Status",
  //     vehicleId: "Driver Vehicle ID",
  //     vehicleType: "Driver Vehicle Type",
  //     email: "Driver Email",
  //     createdAt: DateTime.now().toString(),
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
  //   if (response.statusCode != 500) {
  //     print('Data sent successfully');
  //   } else {
  //     print('Failed to send data');
  //   }
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
      "yearOfBirth": controllerdate.text,
      "gender": controllersex.text,
    };

    try {
      // Send POST request
      final response = await http.post(
        Uri.parse('http://localhost:8083/api/drivers'),
        body: json.encode(postData),
        headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
      );

      // Check for successful response
      if (response.statusCode == 200) {
        print('Data submitted successfully!');
        ShowSuccess('Tạo thành công');
        print(response.body);
        final Map<String, dynamic>? responseData = json.decode(response.body);
        if (responseData == null || responseData['data']['id'] == null) {
          print('Error: No ID received from the first API response');
          return; // Stop execution if no ID received
        }

        // final Map<String, dynamic> responseData = json.decode(response.body);
        final String driverId = responseData['data']['id'];
        print(driverId);
        Map<String, dynamic> postData1 = {"routeId": controllertuyen.text};
        // Send PUT request to the second API
        final responsePut = await http.put(
          Uri.parse('http://localhost:8083/api/drivers/$driverId/route'),
          body: json.encode(postData1),
          headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    }
        );
        // Check for successful response from the second API
        if (responsePut.statusCode == 200) {
          print('Data submitted successfully to the second API!');
          print(responsePut.body);
          final Map<String, dynamic>? responseData2 =
              json.decode(response.body);
          if (responseData2 == null || responseData2['data']['id'] == null) {
            print('Error: No ID received from the second API response');
            return; // Stop execution if no ID received
          }
          final String idVehicle = controllervehicleid.text;
          Map<String, dynamic> postData2 = {
            "vehicleId": controllervehicleid.text,
            "vehicleType": controllerxe.text,
          };
          final responsePut2 = await http.put(
            Uri.parse('http://localhost:8083/api/drivers/$driverId/vehicle'),
            body: json.encode(postData2),
            headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
          );
          if (responsePut2.statusCode == 200) {
            print('Data submitted successfully to the THIRD API!');
            print(responsePut2.body);

            final Map<String, dynamic>? responseData3 =
                json.decode(responsePut2.body);
            // if (responseData3 == null ||
            //     responseData3['data']['vehicleId'] == null) {
            //   print('Error: No ID received from the second API response');
            //   return; // Stop execution if no ID received
            // }
            // final String idVehicle = responseData2['data']['vehicleId'];
            Map<String, dynamic> postData3 = {"driverList": driverId};
            final responsePut3 = await http.post(
              Uri.parse(
                  'http://localhost:8081/api/vehicle/addDriver/$idVehicle/$driverId'),
              body: json.encode(postData3),
              headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
            );
            if (responsePut3.statusCode == 200) {
              print('Data submitted successfully to the 4 API!');

              print(responsePut3.body);
            } else {
              print(
                  'Error submitting data to the 3 API: ${responsePut3.statusCode}');
              print(responsePut3.body);
              // Handle error response from the second API (e.g., display error message)
            }
          } else {
            print(
                'Error submitting data to the 3 API: ${responsePut2.statusCode}');
            print(responsePut2.body);
            // Handle error response from the second API (e.g., display error message)
          }
          // Process success response from the second API (if applicable)
        } else {
          print(
              'Error submitting data to the second API: ${responsePut.statusCode}');
          print(responsePut.body);
          // Handle error response from the second API (e.g., display error message)
        }
        // print(response.body);
        // Process success response (if applicable)
      } else {
        ShowError('Tạo thất bại, thử lại');
        print('Error submitting data: ${response.statusCode}');
        print(response.body);
        // Handle error response (e.g., display error message)
      }
    } on http.ClientException catch (e) {
      print('Error sending request: $e');
      ShowError('Tạo thất bại, thử lại');
      // Handle connection errors
    } catch (e) {
      print('Error: $e');
      ShowError('Tạo thất bại, thử lại');
      // Handle other errors
    }
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

//       const url = 'localhost:8080/api/drivers';
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
}
