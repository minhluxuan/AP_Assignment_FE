// import 'package:flutter/material.dart';

// const List<String> list = <String>['Xe tải', 'Xe khách', 'Xe container'];

// void main() => runApp(const DropdownMenuApp());

// class DropdownMenuApp extends StatelessWidget {
//   const DropdownMenuApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(
//         minWidth: 2000000,
//         maxHeight: 100,
//       ),
//       child: const DropdownMenuExample(),
//     );
//   }
// }

// class DropdownMenuExample extends StatefulWidget {
//   const DropdownMenuExample({super.key});

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       initialSelection: list.first,
//       label: const Text("Loại xe"),
//       width: 250,
//       onSelected: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

const List<String> list = <String>['Xe tải', 'Xe khách', 'Xe container'];

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownMenuExample(onChanged: onChanged),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key, required this.onChanged});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();

  final Function(String) onChanged;
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Loại xe"),
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
                hint: const Text(
                  'Chọn loại xe',
                  style: TextStyle(
                    color: Color.fromARGB(115, 7, 7, 7),
                  ),
                ),
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.onChanged(newValue);
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
