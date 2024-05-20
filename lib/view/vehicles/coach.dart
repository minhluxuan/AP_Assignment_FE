import 'package:flutter/material.dart';
import 'package:newapp/model/vehicle.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../widgets/CustomDropdownMenu.dart';
import '../../model/city_list.dart';
import '../../model/response.dart';

final _formKey = GlobalKey<FormState>();

Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('token');
    return stringValue;
  }

class Coach extends StatefulWidget {
  const Coach({Key? key}) : super(key: key);

  @override
  _ResgisterState createState() => _ResgisterState();
}

class _ResgisterState extends State<Coach> {
  late TextEditingController idVehicle;
  late TextEditingController fuelType;
  late TextEditingController vehicleType;
  late TextEditingController route;
  late TextEditingController numberOfSeats;
  late TextEditingController destination;
  late TextEditingController departure;
  late TextEditingController capacity;
  late TextEditingController driverList;
  late TextEditingController emptySeat;
  late TextEditingController nextMaintenanceDate;
  late TextEditingController numberOfPassengers;
  late TextEditingController passengerList;
  late TextEditingController previousMaintenanceDate;
  late TextEditingController status;
  late TextEditingController timeEnd;
  late TextEditingController timeStart;
  late List<String> routes;
  late String token;

  @override
  Future<void> initState() async {
    super.initState();
    idVehicle = TextEditingController();
    fuelType = TextEditingController();
    vehicleType = TextEditingController();
    vehicleType.text = "coach";
    route = TextEditingController();
    numberOfSeats = TextEditingController();
    destination = TextEditingController();
    departure = TextEditingController();
    capacity = TextEditingController();
    driverList = TextEditingController();
    emptySeat = TextEditingController();
    nextMaintenanceDate = TextEditingController();
    numberOfPassengers = TextEditingController();
    passengerList = TextEditingController();
    previousMaintenanceDate = TextEditingController();
    status = TextEditingController();
    timeEnd = TextEditingController();
    timeStart = TextEditingController();
    routes=[];
    
    token = (await getToken())!;

    const url = 'http://localhost:8762/api/route';
    http.get(Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    }).then((response) {
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        List<dynamic> data = decodedResponse['data'];
        List<String> gotRoutes = [];
        for (var route in data) {
          String elm = route["idRoute"];
          gotRoutes.add(elm); 
        }
        setState(() {
          routes = gotRoutes;
        });
        print(routes);
      }
    }).catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    var trip;
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
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            children: [
              Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // Điều chỉnh để làm cho góc cong nếu cần
                    image: const DecorationImage(
                      image: AssetImage('assetss/anh2.jpg'),
                      fit: BoxFit.cover, // Đảm bảo ảnh hiển thị đúng tỷ lệ
                    ),
                  )),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              Container(
                width: double.infinity,
                height: null,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: const Color(0xffDFDFDF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Biển số xe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            // child:
                            child: TextField(
                              controller: idVehicle,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Text(
                            'Loại nhiên liệu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            child: CustomDropdown(
                              items: ["Xăng", "Dầu"],
                              onChanged: (value) {
                                setState(() {
                                  // fuel = value!;
                                  // fuelType.text = value!;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'Số chỗ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            // child:
                            child: CustomDropdown(
                              items: ["4", "5", "7", "16", "24", "32", "36", "42", "59"],
                              onChanged: (value) {
                                setState(() {
                                  numberOfSeats.text = value!;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'Tuyến đường',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
                              ),
                            ),
                            // child:
                            child: CustomDropdown(
                              items: routes,
                              onChanged: (value) {
                                List<String> routeSubParts = value.toString().split('-');
                                setState(() {
                                  route.text = value!;
                                  departure.text = dictionary[routeSubParts[0].contains('(') ? routeSubParts[0].substring(0, routeSubParts[0].indexOf('(')) : routeSubParts[0]] ?? "";
                                  destination.text = dictionary[routeSubParts[1].contains('(') ? routeSubParts[1].substring(0, routeSubParts[1].indexOf('(')) : routeSubParts[1]] ?? "";
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        padding: const EdgeInsets.all(10),
        child: ElevatedButton.icon(
          onPressed: () => {
            submitData(),
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
    Future<void> submitData() async {
      Map<String, dynamic> postData = {
        "vehicleType": vehicleType.text,
        "idVehicle": idVehicle.text,
        // "capacity": capacity.text,
        "fuelType": fuelType.text,
        "numberOfSeats": numberOfSeats.text,
        "route": route.text,
        "destination": destination.text,
        "departure": departure.text,
      };
      try {
      // Send POST request
      final response = await http.post(
        Uri.parse('http://localhost:8762/api/coach'),
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

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Đăng ký phương tiện thành công!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Xác nhận'),
                ),
              ],
            );
          },
        );
      } else {
        print('Error submitting data: ${response.statusCode}');
        print(response.body);
        // Handle error response (e.g., display error message)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(response.body),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Xác nhận'),
                ),
              ],
            );
          },
        );
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

