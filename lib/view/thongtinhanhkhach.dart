import 'package:flutter/material.dart';
import 'package:newapp/view/vehicles/firstpage.dart';
import 'package:newapp/widgets/trips/custom_dropdownlist.dart';
import '../../model/template.dart';
//import 'firstpage.dart';
//import 'package:newapp/widgets/trips/firstpage.dart';
import 'package:newapp/view/vehicles/firstpage.dart';
// sửa xe thành chọn 1 danh sách các xe
class ThongtinhanhkhachPage extends StatefulWidget {
  const ThongtinhanhkhachPage({Key? key}) : super(key: key);

  @override
  State<ThongtinhanhkhachPage> createState() => _hanhkhachState();
}

class _hanhkhachState extends State<ThongtinhanhkhachPage> {
  TextEditingController name = TextEditingController();
  TextEditingController IDPassenger = TextEditingController();
  TextEditingController costPassenger = TextEditingController();
  TextEditingController departure = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController seatingPosition = TextEditingController();
//  TextEditingController sender = TextEditingController();
 // TextEditingController receiver = TextEditingController();
 // TextEditingController tel = TextEditingController();
 // TextEditingController vol = TextEditingController();
  TextEditingController IdVehicle = TextEditingController();

  //late String kind;

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const firstpageveh()),
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
                "Thông tin hành khách",
                style: TextStyle(
                  fontSize: mainTitleSize,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded( // Sử dụng Expanded
            child: SingleChildScrollView(
              child: Container(
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
                      CusTextField(name: IDPassenger, text: "ID khách"),
                      const SizedBox(height: 15),
                      CusTextField(name: name, text: "Họ và tên"),
                      const SizedBox(height: 15),
                      CusTextField(name: IdVehicle, text: "Xe"),
                      const SizedBox(height: 15),
                      CusTextField(name: seatingPosition, text: "Vị trí chổ ngồi"),
                      const SizedBox(height: 15),
                      CusTextField(name: departure, text: "Nơi xuất phát"),
                      const SizedBox(height: 15),
                      CusTextField(name: destination, text: "Nơi đến"),
                      const SizedBox(height: 15),
                      CusTextField(name: costPassenger, text: "Giá vé"),
                      const SizedBox(height: 15),
                     
                //      const Text(
                  //      "Xe",
                    //    style: TextStyle(fontSize: mainTextSize),
                   //   ),
                  //    CustomDropdown(
                    //    items: const ["Xe khách", "Xe container"],
                    //    onChanged: (val) {
                      //     if (val != null) {
                        //  setState(() {
                          //   kind = val;
                       //   });
                         //  }
                       //  },
                      //  isVehicleInfor: true,
                     // ),
                      
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

class CusTextField extends StatefulWidget {
  final TextEditingController name;
  final String text;
  const CusTextField({Key? key, required this.name, required this.text}) : super(key: key);

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
