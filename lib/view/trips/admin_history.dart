import 'package:flutter/material.dart';
import '../../model/trips/income.dart';
import '../../model/trips/trip.dart';
import '../../model/template.dart';
import '../../model/trips/json/fetch.dart';
import '../../widgets/trips/trips/date_list.dart';
import 'admin_trips.dart';

class TripHistoryPage extends StatefulWidget {
  final Trip trip;
  const TripHistoryPage({super.key, required this.trip});

  @override
  State<TripHistoryPage> createState() => _TripHistoryPageState();
}

class _TripHistoryPageState extends State<TripHistoryPage> {
  late List<Map<String, List<List<String>>>> danhSach;
  late Future<List<Income>> fu_incomes;
  List<Income> incomes = [];
  void retur() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePageAdmin()),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchIncomes();
  }

  void fetchIncomes() {
    fu_incomes = layDanhSachIncome(
        'http://localhost:8082/api/vehicle/history/Income/${widget.trip.vehicle!.id}');
    fu_incomes.then((incomeList) {
      setState(() {
        incomes =
            incomeList; // Cập nhật danh sách incomes sau khi nhận dữ liệu từ API
        danhSach = chuyenDoiDuLieu(
          widget.trip.historyRouteList!,
          widget.trip.timeStartList!,
          widget.trip.timeEndList!,
          incomes, // Sử dụng danh sách incomes sau khi fetch từ API
        );
      });
    }).catchError((error) {
      print('Đã xảy ra lỗi khi fetch dữ liệu: $error');
    });
  }

  List<Map<String, List<List<String>>>> chuyenDoiDuLieu(
    List<String> historyRouteList,
    List<String> timeStartList,
    List<String> timeEndList,
    List<Income> incomeList,
  ) {
    List<Map<String, List<List<String>>>> danhSach = [];
    for (int i = 0; i < historyRouteList.length; i++) {
      String route = historyRouteList[i];
      String timeStart = timeStartList[i];
      String timeEnd = timeEndList[i];
      Income ico = incomeList[i];
      int len = historyRouteList.length;

      DateTime start = DateTime.parse(timeStart);
      DateTime end = DateTime.parse(timeEnd);
      String startDate = "${start.day}/${start.month}/${start.year}";

      Map<String, List<List<String>>> ngayThongTin = {
        startDate: [
          [
            "${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} - ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}",
            route,
            //"Chi phí: ${widget.trip.toTalCost == null ? 0 : widget.trip.toTalCost! / len}, Doanh thu: ${widget.trip.toTalRevenue == null ? 0 : widget.trip.toTalRevenue! / len}, Lợi nhuận: ${widget.trip.toTalProfit == null ? 0 : widget.trip.toTalProfit! / len}"
            "    Chi phí: ${ico.cost!.toStringAsFixed(2)}\n    Doanh thu: ${ico.revenue!.toStringAsFixed(2)}\n    Lợi nhuận: ${ico.profit!.toStringAsFixed(2)}"
          ]
        ]
      };

      // Kiểm tra xem ngày đã tồn tại trong danh sách chưa
      bool daTonTai = false;
      for (int j = 0; j < danhSach.length; j++) {
        if (danhSach[j].containsKey(startDate)) {
          danhSach[j][startDate]?.add(
            [
              "${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} - ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}",
              route,
              "Chi phí: ${widget.trip.toTalCost == null ? 0 : widget.trip.toTalCost! / len}, Doanh thu: ${widget.trip.toTalRevenue == null ? 0 : widget.trip.toTalRevenue! / len}, Lợi nhuận: ${widget.trip.toTalProfit == null ? 0 : widget.trip.toTalProfit! / len}"
            ],
          );
          daTonTai = true;
          break;
        }
      }

      // Nếu ngày chưa tồn tại, thêm vào danh sách
      if (!daTonTai) {
        danhSach.add(ngayThongTin);
      }
    }

    return danhSach;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Lịch sử",
              style: TextStyle(fontSize: mainTitleSize),
            ),
          ),
          FutureBuilder<List<Income>>(
            future: fu_incomes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Nếu đang chờ dữ liệu từ API, hiển thị hiệu ứng loading
                return const Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(child: CircularProgressIndicator())
                  ],
                );
              } else if (snapshot.hasError) {
                // Nếu có lỗi xảy ra khi fetch dữ liệu, hiển thị thông báo lỗi
                return const Center(child: Text('Không có dữ liệu'));
              } else {
                // Nếu dữ liệu đã được fetch thành công, cập nhật danh sách incomes và hiển thị trang
                incomes = snapshot.data!;
                danhSach = chuyenDoiDuLieu(
                  widget.trip.historyRouteList!,
                  widget.trip.timeStartList!,
                  widget.trip.timeEndList!,
                  incomes,
                );
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: DateList(danhSach: danhSach),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
