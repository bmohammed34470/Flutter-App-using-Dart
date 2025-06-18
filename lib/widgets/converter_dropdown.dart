import 'package:flutter/material.dart';

class ConverterDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  ConverterDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: <String>['Miles', 'Kilometers', 'Kilograms', 'Pounds']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
