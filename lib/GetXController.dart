import 'package:get/get.dart';

class SessionController extends GetxController {
  final userSession = 'ttt'.obs;
  final userInfo = {}.obs;

  setUserSession(Session) {
    userSession(Session);
  }

  setUserInfo(Info) {
    userInfo(Info);
  }
}
