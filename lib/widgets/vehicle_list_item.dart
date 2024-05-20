import 'package:flutter/material.dart';
import '../../model/vehicle.dart';
import '../../model/template.dart';

class ListItem extends StatefulWidget {
  final Vehicle vehicle;
  final Function(Vehicle) toInfor;
  const ListItem({super.key, required this.vehicle, required this.toInfor});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  void click() {
    widget.toInfor(widget.vehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: click,
        child: Ink(
          height: 80,
          width: MediaQuery.of(context).size.width / 3 * 2,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  widget.vehicle.name == 'Car'
                      ? Icons.directions_car
                      : widget.vehicle.name == 'Bus'
                          ? Icons.directions_bus
                          : Icons.local_shipping,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.vehicle.name,
                      style: const TextStyle(
                        fontSize: mainTextSize,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      "BKS: ${widget.vehicle.license}",
                      style: const TextStyle(
                        fontSize: mainTextSize,
                        color: Colors.white70,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
