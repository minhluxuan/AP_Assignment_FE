import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

const List<String> list = <String>[];

class DropdownMenuApp1 extends StatelessWidget {
  const DropdownMenuApp1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: DropdownMenuExample(),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("ID xe"),
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
            // Add a column to include the label
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                hint: const Text('Chọn xe'),
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                isExpanded: true,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                // Adjust the arrow position here
                underline: Container(), // Remove the underline
              ),
            ],
          ),
        ),
      ],
    );
  }
}
