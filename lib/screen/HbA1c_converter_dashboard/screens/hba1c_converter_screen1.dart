import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba1c_converter/helpers/appcolors.dart';
import 'package:hba1c_converter/helpers/screen_config.dart';
import 'package:hba1c_converter/helpers/size_extensions.dart';
import 'package:hba1c_converter/helpers/sizedbox.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/screens/hba1c_converter_screen2.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/widgets/buttons.dart';

class HbA1cConverterScreen1 extends StatefulWidget {
  const HbA1cConverterScreen1({super.key});

  @override
  State<HbA1cConverterScreen1> createState() => _HbA1cConverterScreen1State();
}

class _HbA1cConverterScreen1State extends State<HbA1cConverterScreen1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
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
      body: Padding(
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
                    "Convert Your HbA1c to Average Blood Glucose",
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      color: AppColors.headingcolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBoxWithHeight(10),
                  Text(
                    "One number, more clarity. Use this tool to see what your lab result really means in daily terms.",
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  sizedBoxWithHeight(10),
                  Image.asset(
                    height: 60,
                    width: 60,
                    "assets/images/glucometer.png",
                    fit: BoxFit.cover,
                  ),
                  sizedBoxWithHeight(10),
                  Buttons(
                      subject: "Enter My HbA1c Value",
                      ontap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HbA1cConverterScreen2(),
                            ));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
