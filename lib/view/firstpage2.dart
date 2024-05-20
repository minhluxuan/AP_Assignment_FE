import 'dart:js_util';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../view/thirdpage.dart';
import 'package:uuid/uuid.dart';
import "package:meta/dart2js.dart";
// import 'cardBody.dart';
import 'secondpage2.dart';
import '../model/driver2.dart';
import '../bloc/getToken.dart';
import '../view/trips/admin_home.dart';

enum SearchOption {
  Name,
  ID,
  Tuyen,
}

// ignore: camel_case_types
class firstpage extends StatefulWidget {
  const firstpage({
    super.key,
  });

  @override
  State<firstpage> createState() => _MyAppState();
}

class _MyAppState extends State<firstpage> {
  final List<Driver> driver = [];
  late Future<Drivers> futureDrivers;
  @override
  void initState() {
    super.initState();
    futureDrivers = fetchDrivers();
  }

  
  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminMenu()),
    );
  }


  Future<Drivers> fetchDrivers() async {
    final response = await http.get(Uri.parse("http://localhost:8083/api/drivers"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await getToken()}'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Drivers drivers = Drivers.fromJson(json);
      return drivers;
    } else {
      throw Exception('Failed to load drivers');
    }
  }

  final random = Random();
  // final randomNumber = random.nextInt(101);
  void _handleAddtask(var name, var tuyen, var lisence, var email, var add,
      var phonenum, var typeCar, var date, var sex, var cccd) {
    final newItem = Driver(
      id: (1000000 + random.nextInt(9999999)).toString(),
      name: name,
      tuyen: tuyen,
      lisence: lisence,
      add: add,
      phonenumber: phonenum,
      email: email,
      typeCar: typeCar,
      date: date,
      sex: sex,
      cccd: cccd,
    );
    setState(() {
      driver.add(newItem);
    });
  }

  void _handelDeleteTap(var id) {
    setState(() {
      driver.removeWhere((items) => items.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.filter_list_alt),
          //   color: Colors.white,
          //   onPressed: () {},
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.search),
          //   color: Colors.white,
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
            color: Colors.white,
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xff143234),
        title: const Text(
          "DANH SÁCH TÀI XẾ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: () {
            retur();
          },
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomRight,
        margin: const EdgeInsets.all(20),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff143234),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => register(addTask: _handleAddtask)));
          },
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: FutureBuilder<Drivers>(
            future: futureDrivers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DriverList(drivers: snapshot.data!.data!);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class DriverList extends StatefulWidget {
  final List<Data> drivers;

  const DriverList({super.key, required this.drivers});

  @override
  _DriverListState createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  List<Data> _displayedDrivers = [];
  SearchOption _searchOption = SearchOption.Name;
  @override
  void initState() {
    super.initState();
    _displayedDrivers.addAll(widget.drivers);
  }

  void _search(String query) {
    setState(() {
      _displayedDrivers = widget.drivers.where((driver) {
        if (_searchOption == SearchOption.Name) {
          return driver.name!.toLowerCase().contains(query.toLowerCase());
        }
        if (_searchOption == SearchOption.ID) {
          return driver.id!.toLowerCase().contains(query.toLowerCase());
        } else {
          return driver.routeId!.toLowerCase().contains(query.toLowerCase());
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _displayedDrivers.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? _searchBar()
            : CardBodyy(
                driver_name: _displayedDrivers[index - 1].name ?? '',
                driverid: _displayedDrivers[index - 1].id ?? '',
                status: _displayedDrivers[index - 1].status ?? '',
                address: _displayedDrivers[index - 1].address ?? '',
                cccd: _displayedDrivers[index - 1].cccd ?? '',
                createAt: _displayedDrivers[index - 1].createdAt ?? '',
                email: _displayedDrivers[index - 1].email ?? '',
                phone: _displayedDrivers[index - 1].phoneNumber ?? '',
                routeId: _displayedDrivers[index - 1].routeId ?? '',
                vehicleId: _displayedDrivers[index - 1].vehicleId ?? '',
                vehicleType: _displayedDrivers[index - 1].vehicleType ?? '',
                license: _displayedDrivers[index - 1].license ?? '',
                yearOfBirth: _displayedDrivers[index - 1].yearOfBirth ?? '',
                gender: _displayedDrivers[index - 1].gender ?? '',
                handelDelete: deleteDriver,
              );
      },
    );
  }

  Future<void> deleteDriver(String id) async {
    final url = Uri.parse('http://localhost:8083/api/drivers/$id');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        // Xóa thành công
        print('Driver with ID $id has been deleted successfully.');
      } else {
        // Xử lý lỗi nếu cần
        print(
            'Failed to delete driver with ID $id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Error deleting driver: $e');
    }
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(hintText: 'Tìm kiếm tài xế..'),
              onChanged: _search,
            ),
          ),
          const SizedBox(
              width: 8), // Khoảng cách giữa TextField và DropdownButton
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.black,
              ),
              DropdownButton<SearchOption>(
                value: _searchOption,
                onChanged: (option) {
                  setState(() {
                    _searchOption = option!;
                  });
                },
                items: const [
                  DropdownMenuItem<SearchOption>(
                    value: SearchOption.Name,
                    child: Text('Tên'),
                  ),
                  DropdownMenuItem<SearchOption>(
                    value: SearchOption.ID,
                    child: Text('ID'),
                  ),
                  DropdownMenuItem<SearchOption>(
                    value: SearchOption.Tuyen,
                    child: Text('Tuyến'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardBodyy extends StatelessWidget {
  const CardBodyy({
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
    required this.gender,
    required this.yearOfBirth,
    required this.handelDelete,
  });
  final String driver_name,
      driverid,
      status,
      address,
      cccd,
      createAt,
      email,
      phone,
      routeId,
      vehicleId,
      license,
      gender,
      yearOfBirth,
      vehicleType;
  final Function handelDelete;
  // final List<Driver> driver1 = [];
  setSateDriver(var num) {
    if (num != '') {
      return const Text(
        'Hoạt động',
        style: TextStyle(
          fontSize: 16,
          color: Colors.green,
        ),
      );
    } else {
      return const Text(
        'Chưa có tuyến',
        style: TextStyle(
          fontSize: 16,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xffDFDFDF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => profile(
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
                    license: license,
                    gender: gender,
                    yearOfBirth: yearOfBirth,
                    vehicleType: vehicleType)),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 243, 241, 241),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // side: BorderSide.none, // Optional: Remove border if not needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    driver_name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      // Thêm các mục menu vào đây
                      PopupMenuItem(
                        child: const Row(
                          children: [
                            Icon(Icons.delete_outline,
                                color: Color(0xff4B4B4B), size: 30),
                            SizedBox(
                                width: 10), // Khoảng cách giữa Icon và Text
                            Text('Delete'),
                          ],
                        ),
                        onTap: () async {
                          // Xử lý khi người dùng chọn Delete
                          await handelDelete(driverid);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const firstpage()),
                          );
                        },
                      ),
                      // Thêm các mục menu khác ở đây nếu cần
                    ],
                  ),
                ],
              ),
              Text(
                'ID: $driverid ',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              setSateDriver(status),
              Text(
                'Tuyến: $routeId',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
