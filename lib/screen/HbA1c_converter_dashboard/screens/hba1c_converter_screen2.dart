import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hba1c_converter/helpers/appcolors.dart';
import 'package:hba1c_converter/helpers/screen_config.dart';
import 'package:hba1c_converter/helpers/size_extensions.dart';
import 'package:hba1c_converter/helpers/sizedbox.dart';
import 'package:hba1c_converter/screen/HbA1c_converter_dashboard/controller/hba1c_converter_controller.dart';
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              padding: EdgeInsets.all(20),
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
                  sizedBoxWithHeight(10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage('Assets/Images/backgroud.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: TextFormField(
                      controller: provider.hba1ccontroller,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            borderSide:
                                BorderSide(color: AppColors.black, width: 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
