import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meeting_app/view/layout/home_screen.dart';
import 'package:meeting_app/view/layout/login_screen.dart';

class LaunchController extends GetxController {
  final storage=GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
      if (storage.read("isLogged") == true) {
        Future.delayed(Duration(seconds: 3), () {
          Get.off(() => HomeScreen(), transition: Transition.leftToRight);
        });
      } else {
        Future.delayed(Duration(seconds: 3), () {
          Get.off(() => LoginScreen(), transition: Transition.leftToRight);
        });
      }
    
  }
}
