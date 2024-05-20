import 'package:flutter/material.dart';
import 'package:newapp/model/vehicle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/city_list.dart';
import '../../widgets/CustomDropdownMenu.dart';
import '../../bloc/getToken.dart';
import '../../bloc/getToken.dart';

final _formKey = GlobalKey<FormState>();

class Xetai extends StatefulWidget {
  const Xetai({Key? key}) : super(key: key);

  @override
  _ResgisterState createState() => _ResgisterState();
}

class _ResgisterState extends State<Xetai> {
  late TextEditingController idVehicle;
  late TextEditingController fuelType;
  late String vehicleType;
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
  late TextEditingController maxLoad;
  late TextEditingController cargoList;
  late TextEditingController cargoType;
  late TextEditingController currentLoad;
  late List<String> routes;


  // @override
  // void initState() {
  //   super.initState();
  //   idVehicle = TextEditingController();
  //   fuelType = TextEditingController();
  //   route = TextEditingController();
  //   numberOfSeats = TextEditingController();
  //   destination = TextEditingController();
  //   departure = TextEditingController();
  //   capacity = TextEditingController();
  //   driverList = TextEditingController();
  //   emptySeat = TextEditingController();
  //   nextMaintenanceDate = TextEditingController();
  //   numberOfPassengers = TextEditingController();
  //   passengerList = TextEditingController();
  //   previousMaintenanceDate = TextEditingController();
  //   status = TextEditingController();
  //   timeEnd = TextEditingController();
  //   timeStart = TextEditingController();
  //   maxLoad = TextEditingController();
  //   currentLoad = TextEditingController();
  //   cargoList = TextEditingController();
  //   cargoType = TextEditingController();
  //   vehicleType = "container";

  //   routes=[];

  //   const url = 'http://localhost:8762/api/route';
  //   http.get(Uri.parse(url),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   }).then((response) {
  //     if (response.statusCode == 200) {
  //       var decodedResponse = json.decode(response.body);
  //       List<dynamic> data = decodedResponse['data'];
  //       List<String> gotRoutes = [];
  //       for (var route in data) {
  //         String elm = route["idRoute"];
  //         gotRoutes.add(elm); 
  //       }
  //       setState(() {
  //         routes = gotRoutes;
  //       });
  //       print(routes);
  //     }
  //   }).catchError((error) => print(error));
  String? selectedRoute; // Variable to hold the selected route

  @override
  void initState() {
    super.initState();
    idVehicle = TextEditingController();
    fuelType = TextEditingController();
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
    maxLoad = TextEditingController();
    currentLoad = TextEditingController();
    cargoList = TextEditingController();
    cargoType = TextEditingController();
    vehicleType = "container";

    routes = [];

    // Fetch routes from API
    fetchRoutes();
  }

  // Method to fetch routes from the API
  Future<void> fetchRoutes() async {
    const url = 'http://localhost:8762/api/route';
    try {
      final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    });
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
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var trip;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff143234),
        title: const Text(
          "XE CONTAINER",
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
                      image: AssetImage('assets/anh2.jpg'),
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
                            'ID xe',
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
                                // prefixIcon: Icon(Icons.car_repair_outlined),
                                // border: OutlineInputBorder(
                                //   InputBorder.none,
                                //   borderSide: BorderSide(
                                //       color: Color(0xffCED0D2), width: 0),
                                //   borderRadius: BorderRadius.all(
                                //     Radius.circular(10),
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                          //const Text(
                         //     'Kích thước',
                        //    style: TextStyle(
                        //      fontWeight: FontWeight.bold,
                       //     ),
                       //     textAlign: TextAlign.left,
                      //    ),
                        //  Container(
                      //      width: double.infinity,
                      //      height: 40,
                      //      margin: const EdgeInsets.only(bottom: 0),
                        //    decoration: const BoxDecoration(
                        //      color: Colors.white,
                          //    borderRadius: BorderRadius.all(
                            //    Radius.circular(0),
                      //        ),
                        //    ),
                            // child:
                  //          child: TextField(
                    //          controller: capacity,
                      //        style: const TextStyle(
                      //          fontWeight: FontWeight.bold,
                        //      ),
                          //    textAlign: TextAlign.left,
                       //       decoration: const InputDecoration(
                                // prefixIcon: Icon(Icons.car_crash),
                         //       border: InputBorder.none,
                        //      ),
                       //     ),
                     //     ),
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
                            // child:
                            child: TextField(
                              controller: fuelType,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                // prefixIcon: Icon(Icons.car_crash),
                                border: InputBorder.none,
                              ),
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
                            child: TextField(
                              controller: numberOfSeats,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                // prefixIcon: Icon(Icons.car_crash),
                                border: InputBorder.none,
                              ),
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
             submitData()
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
    "vehicleType": vehicleType,
    "idVehicle": idVehicle.text,
    "maxLoad": maxLoad.text,
    "fuelType": fuelType.text,
    "route": route.text,
    "destination": destination.text,
    "departure": departure.text,
    "cargoType": cargoType.text,
  };
  
  try {
    // Gửi yêu cầu POST
    final response = await http.post(
      Uri.parse('http://localhost:8762/api/container'), // Thay 'địa-chỉ-api-của-bạn' bằng URL thực tế của API của bạn
      body: json.encode(postData),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    },
    );

    // Kiểm tra phản hồi thành công
    if (response.statusCode == 200) {
      print('Dữ liệu gửi thành công!');
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
      print('Lỗi khi gửi dữ liệu: ${response.statusCode}');
      print(response.body);
      // Xử lý phản hồi lỗi (ví dụ: hiển thị thông báo lỗi)
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Đăng ký phương tiện thất bại!'),
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
    print('Lỗi khi gửi yêu cầu: $e');
    // Xử lý lỗi kết nối
  } catch (e) {
    print('Lỗi: $e');
    // Xử lý các lỗi khác
  }
}
}
