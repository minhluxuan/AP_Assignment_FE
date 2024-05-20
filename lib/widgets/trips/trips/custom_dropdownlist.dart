import 'package:flutter/material.dart';
import '../../../model/trips/template.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final Icon? icon;
  final bool? isVehicleInfor;

  const CustomDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.initialValue,
    this.icon,
    this.isVehicleInfor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = (widget.initialValue ?? widget.items.first);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: widget.isVehicleInfor == null
            ? Border.all(
                color: mainColor,
                width: 1.0,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (widget.icon != null) widget.icon!,
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selected,
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selected = newValue!;
                });
                widget.onChanged!(newValue);
              },
              underline: const SizedBox(),
              focusColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
