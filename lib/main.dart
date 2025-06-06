import 'package:flutter/material.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/controller/hba1c_converter_controller.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/screens/hba1c_converter_screen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Hba1cConverterController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HbA1cConverterScreen1());
  }
}
