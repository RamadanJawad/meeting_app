import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeting_app/controller/login_controller.dart';
import 'package:meeting_app/core/constant/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Text(
            "Start or join a meeting",
            style: GoogleFonts.ubuntu(fontSize: 20.sp),
          ),
          SizedBox(
            height: 50.h,
          ),
          Image.asset("images/onboarding.jpg"),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () async {
                bool res = await controller.authMethod.signIn();
                if (res) {
                  controller.goToHome();
                } else {
                  Get.snackbar("", "You are not logged in yet",
                      margin: const EdgeInsets.all(10));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r),
                  minimumSize: const Size(double.infinity, 50)),
              child: Text(
                "Google Sign in",
                style: GoogleFonts.ubuntu(fontSize: 17.sp),
              ),
            ),
          )
        ],
      )),
    );
  }
}