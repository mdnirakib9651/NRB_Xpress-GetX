import 'package:get/get.dart';
import 'package:merchant/data/controller/account%20order%20controller/account%20order%20controller.dart';
import 'package:merchant/data/model/request/auth%20repository/auth_repository.dart';
import 'package:merchant/data/model/response/rider%20model/account%20order%20repository/account%20order%20repository.dart';
import 'package:merchant/helper/remote/api_client.dart';
import 'package:merchant/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/controller/account order controller/check_controller.dart';
import '../data/controller/auth_controller.dart';
import '../data/model/request/rider repository/check_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  /// --------------->>>>>>>>>>>> Repository <<<<<<<<<<<<<------------------
  Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => AccountOrderRepo(apiClient: Get.find()));
  Get.lazyPut(() => CheckRepo(apiClient: Get.find()));


  /// ---------------->>>>>>>>>>>> Controller <<<<<<<<<<<<------------------
  // Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => AccountOrderController(accountOrderRepo: Get.find()));
  Get.lazyPut(() => CheckController(checkRepo: Get.find()));
  /// -------->>>>>>> develop <<<<<<<<----------
  // Get.lazyPut(() => SplashController(splashRepo: Get.find()));

}
