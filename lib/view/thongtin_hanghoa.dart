import 'package:flutter/material.dart';
import 'package:newapp/view/vehicles/firstpage.dart';
import 'package:newapp/widgets/trips/custom_dropdownlist.dart';
import '../../model/template.dart';
//import 'firstpage.dart';
import 'package:newapp/view/vehicles/firstpage.dart';
// sửa xe thành chọn 1 danh sách các xe
class GoodsDetailPage extends StatefulWidget {
  const GoodsDetailPage({Key? key}) : super(key: key);

  @override
  State<GoodsDetailPage> createState() => _HangHoaState();
}

class _HangHoaState extends State<GoodsDetailPage> {
  TextEditingController nameCargo = TextEditingController();
  TextEditingController IDCargo = TextEditingController();
  TextEditingController mass = TextEditingController();
  TextEditingController sendingPlace = TextEditingController();
  TextEditingController receivingPlace = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController sender = TextEditingController();
  TextEditingController receiver = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController costCargo = TextEditingController();
  TextEditingController IdVehicle = TextEditingController();
  //late String vehicleType;

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
                "Thông Tin Hàng Hóa",
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
                      CusTextField(name: IDCargo, text: "ID hàng"),
                      const SizedBox(height: 15),
                      CusTextField(name: nameCargo, text: "Tên hàng hóa"),
                      const SizedBox(height: 15),
                      CusTextField(name: mass, text: "Khối lượng"),
                      const SizedBox(height: 15),
                      CusTextField(name: receiver, text: "Người nhận"),
                      const SizedBox(height: 15),
                      CusTextField(name: sender, text: "Người gửi"),
                      const SizedBox(height: 15),
                      CusTextField(name: phoneNumber, text: "Số điện thoại"),
                      const SizedBox(height: 15),
                      CusTextField(name: sendingPlace, text: "Nơi gửi"),
                      const SizedBox(height: 15),
                      CusTextField(name: receivingPlace, text: "Nơi nhận"),
                      const SizedBox(height: 15),
                      CusTextField(name: IdVehicle, text: "Xe"),
                      const SizedBox(height: 15),
                     // const Text(
                     //   "Xe",
                    //    style: TextStyle(fontSize: mainTextSize),
                   //   ),
                   //   CustomDropdown(
                    //    items: const ["Xe khách", "Xe container"],
                    //    onChanged: (val) {
                    //       if (val != null) {
                     //     setState(() {
                    //         kind = val;
                     //     });
                   //        }
                   //      },
                    //    isVehicleInfor: true,
                   //   ),
                      const SizedBox(height: 15),
                      CusTextField(name: costCargo, text: "Giá hàng"),
                      const SizedBox(height: 15),
                      CusTextField(name: size, text: "Thể tích"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        //  Container(
          //  width: 100,
        //   decoration: BoxDecoration(
             // borderRadius: BorderRadius.circular(10.0),
           //  color: mainColor,
         //   ),
          //  child: TextButton(
             // onPressed: () {},
              //child: const Text(
                //"Lưu",
             ///   style: TextStyle(color: Colors.white, fontSize: mainTextSize),
           //   ),
         //   ),
         // ),
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
