import 'package:flutter/material.dart';
import '../../bloc/trips/create_customer.dart';
import '../../bloc/trips/load_object.dart';
import '../../widgets/trips/trips/custom_floating_button.dart';
import '../../widgets/trips/trips/custom_detail_list.dart';
import '../../widgets/trips/trips/bus_seat.dart';
import '../../widgets/trips/trips/car_seat.dart';
import 'customer_trip_infor.dart';
import 'customer_match_trip.dart';
import 'customer_home.dart';
import '../../model/trips/template.dart';
import '../../model/trips/trip.dart';

class ComformPage extends StatefulWidget {
  final Trip? trip;
  const ComformPage({super.key, this.trip});

  @override
  State<ComformPage> createState() => _ComformPageState();
}

class _ComformPageState extends State<ComformPage> {
  String selecteSeat = "-1";

  void click() {
    postData(passId, widget.trip!.des, widget.trip!.sta, name, selecteSeat,
        widget.trip!.cost!.toInt(), widget.trip!.vehicle!.id);
    setState(() {
      cus.cusTrips?.add(widget.trip!);
      cus.seats?.add(int.parse(selecteSeat));
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TripInforPage(
          trip: widget.trip,
          seat: selecteSeat,
          back: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          seeTrips: false,
        ),
      ),
    );
  }

  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MatchTripPage()),
    );
  }

  void selectSeat() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget.trip!.numofseat! < 14
            ? CarSeatSelection(
                seatCount: widget.trip!.numofseat!,
                onChanged: (p0) {
                  setState(() {
                    selecteSeat = p0;
                  });
                },
                availableSeats: widget.trip!.seat,
              )
            : BusSeatSelection(
                seatCount: widget.trip!.numofseat!,
                onChanged: (p0) {
                  setState(() {
                    selecteSeat = p0;
                  });
                },
                availableSeats: widget.trip!.seat,
              ),
      ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                "Xác nhận thông tin",
                style: TextStyle(fontSize: mainTitleSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: CustomDetailList(
                danhSach: [
                  {"Xe": widget.trip!.vehicle!.name},
                  {"Loại xe": widget.trip!.vehicle!.kind},
                  {"Lộ trình": widget.trip!.sta2des},
                  {"Ngày đi": widget.trip!.date},
                  {"Thời gian đi": widget.trip!.time},
                  {"Dự đoán thời gian đến": widget.trip!.timeend},
                  {
                    "Dự đoán chi phí":
                        "${widget.trip!.cost!.toStringAsFixed(0)}.000 VNĐ"
                  },
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Text("Thông tin tài xế: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(backgroundColor: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person),
                            Text(
                              widget.trip!.driver!.name,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(width: 5)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                widget.trip!.vehicle!.name != 'Truck'
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25, right: 25),
                                child: Text(
                                  "Chọn chỗ:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: mainTextSize),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: TextButton(
                                  onPressed: selectSeat,
                                  style: TextButton.styleFrom(
                                      backgroundColor: mainColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      selecteSeat == '-1'
                                          ? "Tự do"
                                          : selecteSeat,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CustomWideFloatingActionButton(
        onPressed: click,
        label: "Xác nhận",
      ),
    );
  }
}
