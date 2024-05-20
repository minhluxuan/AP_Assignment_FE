import 'package:flutter/material.dart';
import '../../model/template.dart';
import '../../widgets/trips/trips/custom_detail_list.dart';
import 'admin_trips.dart';
import '../../model/trips/trip.dart';

class InforPage extends StatefulWidget {
  final Trip trip;
  const InforPage({super.key, required this.trip});

  @override
  State<InforPage> createState() => _InforPageState();
}

class _InforPageState extends State<InforPage> {
  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePageAdmin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: retur,
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Thông tin thêm",
              style: TextStyle(fontSize: mainTitleSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: CustomDetailList(
              danhSach: [
                {"Xe": widget.trip.vehicle!.name},
                {"Loại xe": widget.trip.vehicle!.kind},
                {"Lộ trình": widget.trip.sta2des},
                {"Ngày đi": widget.trip.date},
                {"Thời gian đi": widget.trip.time},
                {"Dự đoán thời gian đến": widget.trip.time},
                {
                  "Tổng doanh thu xe":
                      widget.trip.toTalRevenue.toString() == 'null'
                          ? "0"
                          : widget.trip.toTalRevenue.toString()
                },
                {
                  "Tổng chi phí xe": widget.trip.toTalCost.toString() == 'null'
                      ? "0"
                      : widget.trip.toTalCost.toString()
                },
                {
                  "Tổng lợi nhuận xe":
                      widget.trip.toTalProfit.toString() == 'null'
                          ? "0"
                          : widget.trip.toTalProfit.toString()
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
