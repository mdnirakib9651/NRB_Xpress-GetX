import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:merchant/view/screen/pages/merchant/merchant%20deshboard/merchant_deshboard.dart';
import 'helper/di_init.dart' as di;
import 'view/screen/pages/merchant/deshboard screen/dashboard_marchent.dart';
import 'view/screen/pages/merchant/home screen/home_screen.dart';
import 'view/screen/pages/merchant/registration/register.dart';
import 'view/screen/pages/rider/splash screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splashScreen",
      getPages: [
        GetPage(name: "/splashScreen", page: () => const SplashScreen()),
        GetPage(name: "/NavigationBarDemo", page: () => const MerchantDeshBoard()),
        GetPage(name: "/HomeScreen", page: () => const HomeScreen()),
        GetPage(name: "/Register", page: () => const Register()),
        GetPage(name: "/DashBoard", page: () => const DashBoardMarchantScreen()),
      ],
      builder: EasyLoading.init(),
    );
  }
}

