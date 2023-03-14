import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meeting_app/controller/meeting_controller.dart';
import 'package:meeting_app/core/constant/color.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class MeetingScreen extends StatelessWidget {
  final String id;
  final String userId;
  MeetingScreen({super.key, required this.id, required this.userId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MeetingController());
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
          appID: controller.appId,
          appSign: controller.appSign,
          userID: userId,
          userName: controller.authMethod.user.displayName.toString(),
          conferenceID: id,
          config: ZegoUIKitPrebuiltVideoConferenceConfig(audioVideoViewConfig:
              ZegoPrebuiltAudioVideoViewConfig(foregroundBuilder:
                  (BuildContext context, Size size, ZegoUIKitUser? user,
                      Map extraInfo) {
            return user != null
                ? Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.authMethod.user.photoURL.toString(),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox();
          }), avatarBuilder: (context, size, user, extraInfo) {
            return user != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                        controller.authMethod.user.photoURL.toString()),
                    maxRadius: 120.r,
                  )
                : Container();
          }, onLeaveConfirmation: (BuildContext context) async {
            return await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20).r),
                  backgroundColor: ColorApp.secondaryBackgroundColor,
                  title: const Text("Leave the conference",
                      style: TextStyle(color: Colors.white70)),
                  content: const Text("Are you sure to leave the conference?",
                      style: TextStyle(color: Colors.white70)),
                  actions: [
                    ElevatedButton(
                      child: Text("Cancel",
                          style:
                              GoogleFonts.ubuntu(color: ColorApp.buttonColor)),
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white),
                    ),
                    ElevatedButton(
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.ubuntu(color: Colors.white70),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: ColorApp.buttonColor),
                    ),
                  ],
                );
              },
            );
          })),
    );
  }
}
