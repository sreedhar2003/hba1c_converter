import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba1c_converter/helpers/appcolors.dart';
import 'package:hba1c_converter/helpers/screen_config.dart';
import 'package:hba1c_converter/helpers/size_extensions.dart';
import 'package:hba1c_converter/helpers/sizedbox.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/controller/hba1c_converter_controller.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/screens/hba1c_converter_screen2.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/widgets/buttons.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/widgets/glucosescreen_buttons.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/widgets/glucoserange_bar.dart';
import 'package:provider/provider.dart';

class HbA1cConverterScreen3 extends StatefulWidget {
  final Map<String, dynamic> conversionResult;
  const HbA1cConverterScreen3({super.key, required this.conversionResult});

  @override
  State<HbA1cConverterScreen3> createState() => _HbA1cConverterScreen3State();
}

class _HbA1cConverterScreen3State extends State<HbA1cConverterScreen3> {
  bool showMmol = false; // Toggle between mg/dL and mmol/L

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Hba1cConverterController>();
    ScreenUtil.getInstance().init(context);

    // Extract values from conversion result
    double eAGmg = widget.conversionResult['eAGmg'];
    double eAGmmol = widget.conversionResult['eAGmmol'];

    double hba1cValue = widget.conversionResult['hba1cValue'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              provider.hba1ccontroller.clear();
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Estimated Average Glucose (eAG)",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: AppColors.headingcolor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        // Display glucose value with unit
                        Text(
                          showMmol
                              ? "${eAGmmol.toStringAsFixed(1)} mmol/L"
                              : "${eAGmg.toStringAsFixed(1)} mg/dL",
                          style: GoogleFonts.roboto(
                            color: AppColors.headingcolor,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          "Based on an HbA1c of ${hba1cValue.toStringAsFixed(1)}%",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        sizedBoxWithHeight(20),

                        // Use the glucose range bar with actual calculated value
                        GlucoseRangeBar(glucoseValue: eAGmg),

                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.containercolor,
                            border: Border.all(
                              color: AppColors.green,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Your HbA1c level corresponds to an average daily glucose of ${showMmol ? "${eAGmmol.toStringAsFixed(1)} mmol/L" : "${eAGmg.toStringAsFixed(1)} mg/dL"}. This is in the prediabetic range. Let's work together to improve it.",
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Buttons(
                            subject: "Track My Glucose Over Time",
                            ontap: () {}),
                        sizedBoxWithHeight(20),
                        GlucosescreenButtons(
                            subject: "See What I Can Do", ontap: () {}),
                        sizedBoxWithHeight(20),
                        GlucosescreenButtons(
                            subject: "Talk To A Doctor", ontap: () {}),
                        sizedBoxWithHeight(20),
                        GlucosescreenButtons(
                            subject: "Recalculate",
                            ontap: () {
                              // Clear the input field and go back to input screen
                              provider.hba1ccontroller.clear();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HbA1cConverterScreen2(),
                                  ));
                            }),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
