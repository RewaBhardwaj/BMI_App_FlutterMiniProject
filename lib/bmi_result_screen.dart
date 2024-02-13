import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi, });
final double bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'BMI Result',
          style: titleTextStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(
          '${bmi.toStringAsFixed(2)}',
          style: titleTextStyle.copyWith(fontSize: 50),
        ),
      ),
    );
  }
}