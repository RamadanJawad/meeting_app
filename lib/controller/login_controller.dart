import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meeting_app/core/firebase/auth_method.dart';
import 'package:meeting_app/view/layout/home_screen.dart';

class LoginController extends GetxController {
  AuthMethod authMethod = AuthMethod();
  final saveData = GetStorage();

  goToHome() {
    Get.dialog(Center(
      child: CupertinoActivityIndicator(),
    ),);
    saveData.write("isLogged", true);
    Get.off(() => HomeScreen(), transition: Transition.fadeIn);
  }
}
