import 'package:flutter/material.dart';
import 'custom_dropdownlist.dart';

class TimePicker extends StatefulWidget {
  final String? initialval;
  final void Function(String?)? onchanged;
  final bool? driver;
  const TimePicker({
    super.key,
    this.initialval,
    required this.onchanged,
    this.driver,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late List<String> times;
  List<String> generateTimeSlots() {
    List<String> timeSlots = [];
    for (int hour = 0; hour < 24; hour++) {
      for (int minute = 0; minute < 60; minute += 15) {
        String hourString = hour.toString().padLeft(2, '0');
        String minuteString = minute.toString().padLeft(2, '0');
        timeSlots.add('$hourString:$minuteString');
      }
    }
    return timeSlots;
  }

  @override
  void initState() {
    times = generateTimeSlots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      items: times,
      onChanged: widget.onchanged,
      initialValue: widget.initialval,
      icon: const Icon(Icons.timer),
    );
  }
}
