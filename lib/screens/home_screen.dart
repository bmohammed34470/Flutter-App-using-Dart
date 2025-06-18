import 'package:flutter/material.dart';
import '../models/converter.dart';
import '../widgets/converter_dropdown.dart';
import '../widgets/result_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fromUnit = 'Miles';
  String toUnit = 'Kilometers';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  // Convert the input based on selected units
  void convert() {
    double input = double.tryParse(inputController.text) ?? 0;
    if (fromUnit == 'Miles' && toUnit == 'Kilometers') {
      result = Converter.milesToKilometers(input);
    } else if (fromUnit == 'Kilometers' && toUnit == 'Miles') {
      result = Converter.kilometersToMiles(input);
    } else if (fromUnit == 'Kilograms' && toUnit == 'Pounds') {
      result = Converter.kilogramsToPounds(input);
    } else if (fromUnit == 'Pounds' && toUnit == 'Kilograms') {
      result = Converter.poundsToKilograms(input);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input for value to convert
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                labelText: 'Enter value to convert',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Dropdowns for units
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConverterDropdown(
                  value: fromUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      fromUnit = newValue!;
                    });
                  },
                ),
                Icon(Icons.arrow_forward),
                ConverterDropdown(
                  value: toUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      toUnit = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Convert Button
            ElevatedButton(
              onPressed: convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            // Display result
            ResultDisplay(result: result),
          ],
        ),
      ),
    );
  }
}
