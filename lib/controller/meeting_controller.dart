import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:meeting_app/controller/home_controller.dart';
import 'package:meeting_app/core/firebase/auth_method.dart';

class MeetingController extends GetxController {
  final int appId = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get('ZEGO_APP_Sign');
  HomeController controller = Get.find();
  AuthMethod authMethod = AuthMethod();

  void helper() {
    Get.snackbar("Room ID is", "${controller.randomConferenceId}",
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
        mainButton: TextButton(
            onPressed: () {
              Clipboard.setData(
                  new ClipboardData(text: "${controller.randomConferenceId}"));
            },
            child: Icon(Icons.copy)));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      helper();
    });
  }
}
