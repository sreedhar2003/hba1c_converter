import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba1c_converter/helpers/appcolors.dart';
import 'package:hba1c_converter/helpers/size_extensions.dart';
import 'package:hba1c_converter/helpers/sizedbox.dart';

class GlucoseRangeBar extends StatelessWidget {
  final double glucoseValue;

  const GlucoseRangeBar({super.key, required this.glucoseValue});

  @override
  Widget build(BuildContext context) {
    const double minValue = 70;
    const double maxValue = 180;

    double normalized =
        ((glucoseValue - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);
    double barWidth = MediaQuery.of(context).size.width - 40;

    List<Color> gradientColors;
    List<double> stops;

    if (glucoseValue <= 99) {
      gradientColors = [AppColors.green, AppColors.green];
      stops = [0.0, 1.0];
    } else if (glucoseValue <= 125) {
      gradientColors = [AppColors.green, AppColors.yellow];
      stops = [0.0, 1.0];
    } else {
      gradientColors = [AppColors.green, AppColors.yellow, AppColors.red];
      stops = [0.0, 0.6, 1.0];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: barWidth,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.percentagebg,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: barWidth * normalized,
              height: 16,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  stops: stops,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.6 * normalized,
              child: Container(
                width: 1,
                height: 20,
                color: AppColors.black,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.8 * normalized,
              child: Container(
                width: 1,
                height: 20,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        sizedBoxWithHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Normal (70-99)",
                style: GoogleFonts.roboto(
                  color: AppColors.green,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Prediabetes (100-125)",
                style: GoogleFonts.roboto(
                  color: AppColors.yellow,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Diabetes (126+)",
                style: GoogleFonts.roboto(
                  color: AppColors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
