import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeting_app/controller/launch_controller.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LaunchController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                height: 90.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Meeting App",
                style: GoogleFonts.ubuntu(fontSize: 25.sp),
              )
            ],
          ),
          const Spacer(),
          const CupertinoActivityIndicator()
        ],
      ),
    );
  }
}
