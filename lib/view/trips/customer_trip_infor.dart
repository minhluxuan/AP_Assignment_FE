import 'package:flutter/material.dart';
import '../../bloc/trips/load_object.dart';
import '../../model/trips/template.dart';
import '../../model/trips/trip.dart';
import '../../bloc/trips/create_customer.dart';
import '../../widgets/trips/trips/custom_detail_list.dart';

class TripInforPage extends StatefulWidget {
  final Trip? trip;
  final String? seat;
  final Function()? back;
  final bool? seeTrips;
  const TripInforPage(
      {super.key, this.trip, this.seat, this.back, this.seeTrips});

  @override
  State<TripInforPage> createState() => _TripInforPageState();
}

class _TripInforPageState extends State<TripInforPage> {
  void click() {
    print("OKay");
  }

  void retur() {
    widget.back!();
  }

  void del() async {
    deletePassenger(widget.trip!.vehicle!.id, passId);
  }

  void deletetrip() {
    int index = cus.cusTrips!.indexOf(widget.trip!);
    cus.cusTrips?.removeAt(index);
    cus.seats?.removeAt(index);
    deletePassenger(widget.trip!.vehicle!.id, passId);
    retur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: widget.seeTrips == true
              ? const Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Colors.white,
                )
              : const Icon(Icons.home, size: 30, color: Colors.white),
          hoverColor: const Color.fromARGB(255, 130, 129, 129),
          onPressed: retur,
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Thông tin chuyến đi",
              style: TextStyle(fontSize: mainTitleSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: CustomDetailList(
              danhSach: [
                {"Xe": widget.trip?.vehicle?.name ?? ''},
                {"Loại xe": widget.trip?.vehicle?.kind ?? ''},
                {"Lộ trình": widget.trip?.sta2des ?? ''},
                {"Ngày đi": widget.trip!.date},
                {"Thời gian đi": widget.trip!.time},
                {"Dự đoán thời gian đến": widget.trip!.timeend},
                {
                  "Dự đoán chi phí":
                      "${widget.trip!.cost!.toStringAsFixed(0)}.000 VNĐ"
                },
                {
                  "Số ghế": (widget.seat.toString() == "-1"
                      ? "Tự chọn chỗ"
                      : widget.seat.toString())
                },
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Thông tin tài xế: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: deletetrip,
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'Bỏ vé',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
