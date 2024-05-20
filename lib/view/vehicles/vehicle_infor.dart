import 'package:flutter/material.dart';
import 'package:newapp/model/vehicle.dart';
import '../../model/template.dart';
import 'update_infor.dart';
import 'infor.dart';
import 'customer_on_vehicle.dart';
import 'goods_on_vehicle.dart';

class InforOfAVehicle extends StatefulWidget {
  final Vehicle vehicle;
  const InforOfAVehicle({super.key, required this.vehicle});

  @override
  State<InforOfAVehicle> createState() => _InforOfAVehicleState();
}

class _InforOfAVehicleState extends State<InforOfAVehicle> {
  void toInfor() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Infor(vehicle: widget.vehicle)),
    );
  }

  void toCustomer() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => InforCustomer(vehicle: widget.vehicle)),
    );
  }

  void toGoods() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => InforGoods(vehicle: widget.vehicle)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, size: 30),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UpdateInfor(toPage: "INFOR"),
                          ),
                        );
                      },
                    ),
                    Text(
                      widget.vehicle.name == 'Bus'
                          ? "Xe container"
                          : widget.vehicle.name == 'Car'
                              ? "Xe khách"
                              : "Xe container",
                      style: const TextStyle(
                        fontSize: mainTitleSize,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AButton(onClick: toInfor, title: "THÔNG TIN CƠ BẢN"),
            const SizedBox(
              height: 10,
            ),
            AButton(onClick: toCustomer, title: "HÀNH KHÁCH"),
            const SizedBox(
              height: 10,
            ),
            AButton(onClick: toGoods, title: "HÀNG HÓA"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            )
          ],
        ),
      ),
    );
  }
}

class AButton extends StatefulWidget {
  final String title;
  final Function() onClick;
  const AButton({super.key, required this.onClick, required this.title});

  @override
  State<AButton> createState() => _AButtonState();
}

class _AButtonState extends State<AButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: mainColor,
        ),
        child: TextButton(
            onPressed: widget.onClick,
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: mainTextSize),
            )));
  }
}
