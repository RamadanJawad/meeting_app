import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meeting_app/core/firebase/auth_method.dart';
import 'package:meeting_app/view/layout/meeting_screen.dart';

class HomeController extends GetxController {
  int index = 0;
  AuthMethod authMethod = AuthMethod();

  final String userId = Random().nextInt(900000 + 100000).toString();
  final String randomConferenceId =
      (Random().nextInt(1000000000) * 10 + Random().nextInt(10))
          .toString()
          .padLeft(10, '0');

  final conferenceIdController = TextEditingController();

  onPageChanged(int page) {
    index = page;
    update();
  }

  jumpToMeeting({required String id}) {
    Get.to(() => MeetingScreen(id: id,userId: userId));
  }
}
