import 'package:flutter/material.dart';
import 'package:newapp/view/vehicles/hanhkhach.dart';
import 'package:newapp/view/vehicles/list_driver.dart';
import '../../model/template.dart';
import '../../model/vehicle.dart';
import 'vehicle_infor.dart';
//import 'passenger_list_page.dart'; 
//import 'package:newapp/view/vehicles/list_driver.dart'; 

class Infor extends StatefulWidget {
  final Vehicle vehicle;
  const Infor({Key? key, required this.vehicle});

  @override
  State<Infor> createState() => _InforState();
}

class _InforState extends State<Infor> {
  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => InforOfAVehicle(
          vehicle: widget.vehicle,
        ),
      ),
    );
  }

  void navigateToPassengerList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassengerListPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: GestureDetector(
          onTap: navigateToPassengerList, // Điều hướng khi nhấn vào tiêu đề
          child: const Text(
            "Thông tin cơ bản",
            style: TextStyle(
              fontSize: mainTitleSize,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 30),
          onPressed: retur,
        ),
      ),
      body: Column(
        children: [
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
                      CusomTextfield(
                          name: widget.vehicle.idVehicle, text: "Biển số xe"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.vehicleType, text: "Loại xe"),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Danh sách tài xế",
                        style: TextStyle(fontSize: mainTextSize),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      NewWidget(label: "Danh sách tài xế"), // Thêm NewWidget vào đây
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.capacity.toString(), text: "Dung tích"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.maxLoad.toString(), text: "Trọng tải"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.fuelType,
                          text: "Loại nhiên liệu"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.route, text: "Tuyến đường"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.status, text: "Tình trạng xe"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.timeStart.toString(),
                          text: "Thời gian bắt đầu"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.timeEnd.toString(),
                          text: "Thời gian kết thúc"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.destination, text: "Nơi đến"),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                          name: widget.vehicle.departure, text: "Nơi đi"),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CusomTextfield extends StatelessWidget {
  final String name;
  final String text;
  const CusomTextfield({Key? key, required this.name, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: mainTextSize),
        ),
        TextField(
          readOnly: true,
          controller: TextEditingController(text: name),
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

class NewWidget extends StatelessWidget {
  final String label;

  const NewWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xff143234),
        borderRadius: BorderRadius.circular(500),
      ),
      padding: const EdgeInsets.only(left: 5),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if (label == "Danh sách tài xế") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DriverListPage(),
              ),
            );
          }
        },
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
