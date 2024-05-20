import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderSelector extends StatefulWidget {
  final Function onChanged;
  const GenderSelector({super.key, required this.onChanged});

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Radio<Gender>(
                value: Gender.male,
                groupValue: _selectedGender,
                onChanged: (Gender? value) {
                  setState(
                    () {
                      _selectedGender = value!;
                      widget.onChanged(_selectedGender);
                    },
                  );
                },
                activeColor: const Color(0xff143234),
              ),
              const Text(
                "Nam",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio<Gender>(
                value: Gender.female,
                groupValue: _selectedGender,
                onChanged: (Gender? value) {
                  setState(
                    () {
                      _selectedGender = value!;
                      // widget.onChanged(_selectedGender);
                      widget.onChanged(_selectedGender);
                    },
                  );
                },
                activeColor: const Color(0xff143234),
              ),
              const Text(
                'Nu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
