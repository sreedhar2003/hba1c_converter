import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba1c_converter/helpers/appcolors.dart';
import 'package:hba1c_converter/helpers/screen_config.dart';
import 'package:hba1c_converter/helpers/size_extensions.dart';
import 'package:hba1c_converter/helpers/sizedbox.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/controller/hba1c_converter_controller.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/screens/hba1c_converter_screen3.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/widgets/buttons.dart';
import 'package:provider/provider.dart';

class HbA1cConverterScreen2 extends StatefulWidget {
  const HbA1cConverterScreen2({super.key});

  @override
  State<HbA1cConverterScreen2> createState() => _HbA1cConverterScreen2State();
}

class _HbA1cConverterScreen2State extends State<HbA1cConverterScreen2> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Hba1cConverterController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.black,
            ),
          ),
          title: Center(
            child: Text(
              "HbA1c Converter",
              style: GoogleFonts.roboto(
                color: AppColors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "HbA1c Converter",
                      style: GoogleFonts.roboto(
                        color: AppColors.titlecolor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  sizedBoxWithHeight(40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.containercolor,
                      border: Border.all(
                        color: AppColors.titlecolor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Enter Your HbA1c",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color: AppColors.headingcolor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          sizedBoxWithHeight(10),
                          Text(
                            "Enter your HbA1c (%)",
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                controller: provider.hba1ccontroller,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "(e.g., 6.0)",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.titlecolor, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          color: AppColors.titlecolor,
                                          width: 1)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          color: AppColors.red, width: 1)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  final parsed = double.tryParse(value);
                                  if (parsed == null) {
                                    return 'Enter a valid number';
                                  }
                                  if (parsed < 3.5 || parsed > 15.0) {
                                    return 'Enter a realistic HbA1c value (3.5-15%)';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Text(
                            "HbA1c is usually shown as a percentage on your blood test. Range: 4-14%",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Buttons(
                              subject: "Convert",
                              ontap: () {
                                if (provider.formKey.currentState!.validate()) {
                                  double hba1cValue = double.parse(
                                      provider.hba1ccontroller.text.trim());

                                  // Calculate the conversion result
                                  Map<String, dynamic> result =
                                      provider.convertHbA1c(hba1cValue);

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HbA1cConverterScreen3(
                                        conversionResult: result,
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
