import 'package:flutter/material.dart';
import 'package:newapp/model/template.dart';
import 'package:newapp/model/vehicle.dart';
import 'package:newapp/view/vehicles/chonhanghoa.dart';
import 'package:newapp/view/vehicles/vehicle_infor.dart';

// Import trang danh sách khách hàng
import 'customer_list_page.dart';

class InforGoods extends StatefulWidget {
  final Vehicle vehicle;
  const InforGoods({Key? key, required this.vehicle});

  @override
  State<InforGoods> createState() => _InforGoodsState();
}

class _InforGoodsState extends State<InforGoods> {
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

  void navigateToCustomerList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThongtinhanghoaPage()),
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
              GestureDetector(
                onTap: navigateToCustomerList, // Chuyển hướng khi nhấn vào tiêu đề
                child: const Text(
                  "Hàng hóa",
                  style: TextStyle(
                    fontSize: mainTitleSize,
                    decoration: TextDecoration.none,
                  ),
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
                      CusomTextfield(
                        name: widget.vehicle.cargoType.length.toString(),
                        text: "Loại hàng hóa",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CusomTextfield(
                        name: widget.vehicle.currentLoad.toString(),
                        text: "Trọng tải hiện có",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Danh sách hàng hóa",
                        style: TextStyle(fontSize: mainTextSize),
                      ),
                      NewWidget(label: "Danh sách hàng hóa"), // Thêm nút chuyển hướng
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
          if (label == "Danh sách hàng hóa") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThongtinhanghoaPage(),
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
