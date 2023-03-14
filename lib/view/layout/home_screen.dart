import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeting_app/controller/home_controller.dart';
import 'package:meeting_app/core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
            ),
            Image.asset(
              'images/logo.png',
              width: 150.w,
            ),
            // Text(
            //     'Your Username:  ${controller.authMethod.user.displayName.toString()}'),
            // const Text('Please test with two or more devices'),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              style: GoogleFonts.ubuntu(fontSize: 16.sp),
              controller: controller.conferenceIdController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Join a Meeting by Input an room id',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorApp.buttonColor,
                  ),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(10).r,
                  ),
                ),
                floatingLabelStyle: const TextStyle(color: Colors.white),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorApp.buttonColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              child: Text(
                'Join a Meeting',
                style: GoogleFonts.ubuntu(fontSize: 16.sp),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r),
                  minimumSize: Size(double.infinity, 50.h),
                  backgroundColor: ColorApp.buttonColor),
              onPressed: () => controller.jumpToMeeting(
                id: controller.conferenceIdController.text,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ElevatedButton(
              child: Text('New Meeting',
                  style: GoogleFonts.ubuntu(fontSize: 16.sp)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r),
                  minimumSize: Size(double.infinity, 50.h),
                  backgroundColor: Colors.white,
                  foregroundColor: ColorApp.buttonColor),
              onPressed: () => controller.jumpToMeeting(
                id: controller.randomConferenceId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
