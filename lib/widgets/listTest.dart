import 'package:flutter/material.dart';
import '../bloc/loadIdVehicle.dart';
import '../model/fetchIdVehicle2.dart';
// import '../model/route.dart';
import '../model/containerr.dart';

import 'package:flutter/foundation.dart';

import '../model/route2.dart';

const List<String> list = <String>[];

class ListCoach extends StatelessWidget {
  ListCoach({super.key, required this.onChanged, required this.vehicletype});

  final Function(String) onChanged;
  var vehicletype;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownMenuExample(
        onChanged: onChanged,
        vehicletype: vehicletype,
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  final Function(String) onChanged;
  final String vehicletype;

  const DropdownMenuExample(
      {super.key, required this.onChanged, required this.vehicletype});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue;
  List<String> list1 = <String>[];
  List<String> list2 = <String>[];
  @override
  void initState() {
    super.initState();
    loadDropdownData();
    loadDropdownData1();
  }

  Future<void> loadDropdownData() async {
    List<String> data = await load2();
    setState(() {
      list2 = data;
    });
  }

  Future<void> loadDropdownData1() async {
    List<String> data = await load1();
    setState(() {
      list1 = data;
    });
  }
  List<String> getDropdownList() {
    if (widget.vehicletype == 'Coach') {
      // Sử dụng widget.vehicletype thay vì vehicletype
      return list1;
    } else {
      return list2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Id xe"),
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color.fromARGB(255, 109, 109, 110),
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                hint: const Text('Chọn xe'),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.onChanged(newValue);
                  });
                },
                items: getDropdownList()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                underline: Container(), // Remove the underline
              ),
            ],
          ),
        ),
      ],
    );
  }
}
