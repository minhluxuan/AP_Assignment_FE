import 'package:flutter/material.dart';
import '../../model/template.dart';
import '../../model/vehicle.dart';
import '../vehicles/update_infor.dart';
import '../../widgets/trips/custom_dropdownlist.dart';

List<String> seatList = List.generate(32, (index) => (index + 1).toString());

class VehicleInfor extends StatefulWidget {
  final Vehicle vehicle;
  const VehicleInfor({Key? key, required this.vehicle});

  @override
  State<VehicleInfor> createState() => _VehicleInforState();
}

class _VehicleInforState extends State<VehicleInfor> {
  TextEditingController name = TextEditingController();
  TextEditingController Iddriver = TextEditingController();
  //TextEditingController weight = TextEditingController();
  TextEditingController previousMaintenanceDate = TextEditingController();
  TextEditingController timeEnd = TextEditingController();
  TextEditingController timeStart = TextEditingController();
  TextEditingController Route = TextEditingController();
  TextEditingController departure = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController status = TextEditingController();
 // late String vehicleState;
  //late String seats;

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const UpdateInfor(toPage: "INFOR_UPDATE")),
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
              Text(
                widget.vehicle.name == 'Car'
                    ? "Xe khách"
                    : widget.vehicle.name == 'Truck'
                        ? "Xe container"
                        // ? "Xe khách"
                        : "Xe container",
                style: const TextStyle(
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
                      CusTextField(name: Iddriver, text: "ID tài xế"),
                      const SizedBox(height: 10),
                      const Text(
                        "Tình trạng xe",
                        style: TextStyle(fontSize: mainTextSize),
                      ),
                      CustomDropdown(
                        items: const ["Đang bảo trì", "Sẵn sàng"],
                        onChanged: (val) {
                          setState(() {
                          status.text = val!;
                          });
                        },
                        isVehicleInfor: true, labelText: '',
                      ),
                      const SizedBox(height: 10),
                   //   widget.vehicle.name == "Car" //||
                            //  widget.vehicle.name == "Car"
                       //   ? Column(
                        //      crossAxisAlignment: CrossAxisAlignment.start,
                        //      children: [
                           //     const Text(
                              //    "Chỗ trống",
                              //    style: TextStyle(fontSize: mainTextSize),
                            //    ),
                           //     CustomDropdown(
                             //     items: seatList,
                               //   onChanged: (val) {
                                 //   setState(() {
                                //      seats = val!;
                               //     });
                       //           },
                         //         isVehicleInfor: true,
                           //     )
                             // ],
                         //   ),
                        //  : CusTextField(name: weight, text: "Trọng tải"),
                  //    const SizedBox(height: 10),
                 //     CusTextField(
                   //       name: field4,
                     //     text: widget.vehicle.name == "Car" //||
                                  //widget.vehicle.name == "Car"
                       //       ? "Số khách hiện có"
                         //     : "Loại hàng hóa"),
                //      const SizedBox(height: 10),
                      CusTextField(name: previousMaintenanceDate, text: "Ngày bảo dưỡng gần nhất"),
                      const SizedBox(height: 10),
                      CusTextField(name: timeStart, text: "Thời gian bắt đầu"),
                      const SizedBox(height: 10),
                      CusTextField(
                          name: timeEnd, text: "Thời gian kết thúc"),
                          const SizedBox(height: 10),
                          CusTextField(name: Route, text: "Tuyến đường"),
                      const SizedBox(height: 10),
                      CusTextField(name: destination, text: "Nơi đến"),
                      const SizedBox(height: 10),
                      CusTextField(name: departure, text: "Nơi đi"),
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
              onPressed: () {},
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
