import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:meeting_app/core/firebase/auth_method.dart';

class MeetingController extends GetxController {
  final int appId = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get('ZEGO_APP_Sign');
  AuthMethod authMethod = AuthMethod();
}
