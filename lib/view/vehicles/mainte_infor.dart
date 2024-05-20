import 'package:flutter/material.dart';
import '../../model/template.dart';
import '../../model/vehicle.dart';
import '../vehicles/update_infor.dart';

List<String> seatList = List.generate(32, (index) => (index + 1).toString());

class MainteUpdate extends StatefulWidget {
  final Vehicle vehicle;
  const MainteUpdate({Key? key, required this.vehicle});

  @override
  State<MainteUpdate> createState() => _MainteUpdateState();
}

class _MainteUpdateState extends State<MainteUpdate> {
  TextEditingController previousMaintenanceDate = TextEditingController();
  TextEditingController nextMaintenanceDate = TextEditingController();

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const UpdateInfor(toPage: "MAINTE")),
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
              const Text(
                "Lịch bảo dưỡng",
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
                      CusTextField(
                          name: previousMaintenanceDate, text: "Ngày bảo dưỡng gần nhất"),
                      const SizedBox(height: 15),
                      CusTextField(
                          name: nextMaintenanceDate, text: "Ngày bảo dưỡng tiếp theo"),
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
