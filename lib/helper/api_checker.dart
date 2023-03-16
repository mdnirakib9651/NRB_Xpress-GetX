import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      // Get.find<AuthController>().clearSharedData();
    }else {
      // showCustomToast(response.statusText!);
    }
  }
}
