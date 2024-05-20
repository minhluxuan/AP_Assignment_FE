import 'package:flutter/material.dart';
import 'custom_dropdownlist.dart';

class SortBar extends StatefulWidget {
  const SortBar(
      {super.key,
      required this.items,
      this.initialValue,
      required this.onChanged,
      required this.onTap});
  final List<String> items;
  final String? initialValue;
  final void Function(String?) onChanged;
  final void Function() onTap;
  @override
  State<SortBar> createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Ưu tiên:"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomDropdown(
                  items: widget.items,
                  onChanged: widget.onChanged,
                  initialValue: widget.initialValue,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: widget.onTap,
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Icon(Icons.sort_by_alpha, size: 32),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
