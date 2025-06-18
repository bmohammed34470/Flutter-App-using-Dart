import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double result;

  ResultDisplay({required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Result: ${result.toStringAsFixed(2)}',
      style: TextStyle(fontSize: 24),
    );
  }
}
