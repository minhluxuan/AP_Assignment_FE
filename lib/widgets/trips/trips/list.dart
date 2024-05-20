import 'package:flutter/material.dart';
import '../../../model/trips/trip.dart';
//import '../../model/vehicle.dart';

class CustomList extends StatefulWidget {
  final List<Trip> items;
  final bool isadmin;
  final bool isprofit;
  final Function(Trip)? onPressed;
  final Function(Trip)? details;
  final Function(Trip)? history;

  const CustomList(
      {super.key,
      required this.items,
      this.onPressed,
      required this.isadmin,
      this.details,
      this.history,
      required this.isprofit});

  @override
  // ignore: library_private_types_in_public_api
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  Trip? selectedTrip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: widget.isprofit
          ? ListView.builder(
              itemCount: widget.items.length,
              itemExtent: null,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.monetization_on_outlined),
                      title: Text(
                          '${widget.items[index].vehicle!.name} ${widget.items[index].sta2des}'),
                      subtitle: Text(
                        "Doanh thu: ${widget.items[index].toTalRevenue.toString() == 'null' ? "0" : widget.items[index].toTalRevenue.toString()}, Chi phí: ${widget.items[index].toTalCost.toString() == 'null' ? "0" : widget.items[index].toTalCost.toString()}, Lợi nhuận: ${widget.items[index].toTalProfit.toString() == 'null' ? "0" : widget.items[index].toTalProfit.toString()}",
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.map),
                      title: Text(!widget.isadmin
                          ? widget.items[index].sta2des
                          : widget.items[index].vehicle!.name),
                      subtitle: Text(
                        widget.isadmin
                            ? widget.items[index].sta2des
                            : 'Ngày: ${widget.items[index].date}, Giờ: ${widget.items[index].time}',
                      ),
                      onTap: () {
                        setState(() {
                          selectedTrip = widget.items[index];
                        });
                        widget.isadmin
                            ? showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                        "${widget.items[index].vehicle!.name}\n${widget.items[index].sta2des}"),
                                    actions: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              widget.details!(
                                                  widget.items[index]);
                                            },
                                            child: const Text('Chi tiết'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              widget.history!(
                                                  widget.items[index]);
                                            },
                                            child: const Text('Lịch sử'),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Đóng'),
                                      )
                                    ],
                                  );
                                },
                              )
                            : widget.onPressed!(widget.items[index]);
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
    );
  }
}
