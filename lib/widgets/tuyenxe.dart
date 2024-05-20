// import 'package:flutter/material.dart';
// import '../model/driver.dart';

// const List<String> list = <String>[
//   'Sài Gòn <-> Cao Lãnh',
//   'Sài Gòn <-> Vũng Tàu',
//   'Sài Gòn <-> Đà Lạt',
//   'Sài Gòn <-> Đồng Nai',
//   'Sài Gòn <-> Lâm Đồng',
//   'Sài Gòn <-> Đà Nẵng',
//   'Sài Gòn <-> Cao Lãnh',
//   'Sài Gòn <-> Vũng Tàu',
//   'Sài Gòn <-> Đà Lạt',
//   'Sài Gòn <-> Đồng Nai',
//   'Sài Gòn <-> Lâm Đồng',
//   'Sài Gòn <-> Đà Nẵng',
//   'Sài Gòn <-> Cao Lãnh',
//   'Sài Gòn <-> Vũng Tàu',
//   'Sài Gòn <-> Đà Lạt',
//   'Sài Gòn <-> Đồng Nai',
//   'Sài Gòn <-> Lâm Đồng',
//   'Sài Gòn <-> Đà Nẵng',
// ];

// // void main() => runApp(const TuyenxeMenuApp());

// class TuyenxeMenuApp extends StatelessWidget {
//   const TuyenxeMenuApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       // margin: const EdgeInsets.all(10),
//       width: double.infinity,
//       child: DropdownMenuExample(),
//     );
//   }
// }

// class DropdownMenuExample extends StatefulWidget {
//   const DropdownMenuExample({
//     super.key,
//   });

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       initialSelection: list.first,
//       label: const Text("Tuyến"),
//       width: 300,
//       onSelected: (String? value) {
//         setState(() {
//           dropdownValue = value!;
//           // driver.tuyen = value;
//         });
//       },
//       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Sài Gòn <-> Cao Lãnh',
  'Sài Gòn <-> Vũng Tàu',
  'Sài Gòn <-> Đà Lạt',
  'Sài Gòn <-> Đà Nẵng',
];

class TuyenxeMenuApp extends StatelessWidget {
  const TuyenxeMenuApp({super.key, required this.onChanged});

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
        const Text("Tuyến"),
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
                      'Chọn tuyến xe',
                      style: TextStyle(
                        color: Color.fromARGB(115, 7, 7, 7),
                      ),
                    ),
                    // initialSelection: list.first,
                    isExpanded: true,
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        widget.onChanged(newValue);
                      });
                    },

                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    // Adjust the arrow position here
                    underline: Container(), // Remove the underline
                  ),
                ]))
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import '../model/driver.dart';

// const List<String> list = <String>[
//   'Sài Gòn <-> Cao Lãnh',
//   'Sài Gòn <-> Vũng Tàu',
//   'Sài Gòn <-> Đà Lạt',
//   'Sài Gòn <-> Đồng Nai',
//   'Sài Gòn <-> Lâm Đồng',
//   'Sài Gòn <-> Đà Nẵng',
//   'Sài Gòn <-> Cao Lãnh',
//   'Sài Gòn <-> Vũng Tàu',
//   'Sài Gòn <-> Đà Lạt',
//   'Sài Gòn <-> Đồng Nai',
//   'Sài Gòn <-> Lâm Đồng',
//   'Sài Gòn <-> Đà Nẵng',
//   'Sài Gòn <-> Cao Lãnh',
//   'Sài Gòn <-> Vũng Tàu',
//   'Sài Gòn <-> Đà Lạt',
//   'Sài Gòn <-> Đồng Nai',
//   'Sài Gòn <-> Lâm Đồng',
//   'Sài Gòn <-> Đà Nẵng',
// ];

// // void main() => runApp(const TuyenxeMenuApp());

// class TuyenxeMenuApp extends StatefulWidget {
//   final Function onChanged;
//   const TuyenxeMenuApp({
//     super.key,
//     required this.onChanged,
//   });
//   @override
//   // ignore: library_private_types_in_public_api
//   _dropdownState createState() => _dropdownState();
// }

// class _dropdownState extends State<TuyenxeMenuApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       // margin: const EdgeInsets.all(10),
//       width: double.infinity,
//       child: DropdownMenuExample(),
//     );
//   }
// }

// class DropdownMenuExample extends StatefulWidget {
//   const DropdownMenuExample({
//     super.key,
//   });

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       initialSelection: list.first,
//       label: const Text("Tuyến"),
//       width: 300,
//       onSelected: (value) {
//         setState(() {
//           dropdownValue = value!;
//           // driver.tuyen = value;
//         });
//       },
//       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }
