import 'package:flutter/material.dart';

class Hba1cConverterController with ChangeNotifier {
  TextEditingController hba1ccontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // HbA1c Converter Logic
  Map<String, dynamic> convertHbA1c(double hba1c) {
    // Calculate eAG using the formula: eAG (mg/dL) = (28.7 × HbA1c) − 46.7
    double eAGmg = (28.7 * hba1c) - 46.7;
    double eAGmmol = eAGmg / 18; // Convert to mmol/L

    return {
      "eAGmg": eAGmg,
      "eAGmmol": eAGmmol,
      "eAGmgFormatted": eAGmg.toStringAsFixed(1),
      "eAGmmolFormatted": eAGmmol.toStringAsFixed(1),
      "hba1cValue": hba1c
    };
  }

  @override
  void dispose() {
    hba1ccontroller.dispose();
    super.dispose();
  }
}
