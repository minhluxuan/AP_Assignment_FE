import 'package:flutter/material.dart';
import '../../../model/trips/template.dart';

class BusSeatSelection extends StatefulWidget {
  final int seatCount;
  final List<String> availableSeats;
  final Function(String) onChanged;

  const BusSeatSelection(
      {super.key,
      required this.seatCount,
      required this.availableSeats,
      required this.onChanged});

  @override
  _BusSeatSelectionState createState() => _BusSeatSelectionState();
}

class _BusSeatSelectionState extends State<BusSeatSelection> {
  late int rowCount;
  late List<String> selectedSeats; // Thay đổi kiểu dữ liệu thành String

  @override
  void initState() {
    super.initState();
    rowCount = (widget.seatCount / 4).ceil();
    selectedSeats = [];
    print(widget.availableSeats);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn Ghế'),
      ),
      body: Center(
        child: SizedBox(
          width: 230,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Chọn ghế của bạn:', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text("Tài xế"),
                              ),
                            ),
                            const Row(children: [
                              Icon(Icons.arrow_back_rounded),
                              Text("Cửa")
                            ])
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: -10,
                        children: List.generate(widget.seatCount, (index) {
                          bool isUnavailable = !widget.availableSeats
                              .contains((index + 1).toString());
                          bool isSelected =
                              selectedSeats.contains((index + 1).toString());
                          bool isPairedIndex =
                              (index + 1) % 4 == 2 || (index + 1) % 4 == 3;
                          return GestureDetector(
                            onTap: () {
                              if (!isUnavailable) {
                                setState(() {
                                  if (selectedSeats.isNotEmpty) {
                                    selectedSeats.clear();
                                  }
                                  selectedSeats.add((index + 1).toString());
                                });
                              }
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: isPairedIndex ? 20 : 0),
                              child: Center(
                                child: Icon(Icons.event_seat,
                                    color: isUnavailable
                                        ? Colors.red
                                        : isSelected
                                            ? Colors.blue
                                            : null,
                                    size: 50),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(mainColor),
                  ),
                  onPressed: () {
                    print('Ghế đã chọn: $selectedSeats');
                    widget.onChanged(selectedSeats.first);
                  },
                  child: const Text(
                    'Chọn',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
