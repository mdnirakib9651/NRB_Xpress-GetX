import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/auth_controller.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/images.dart';
import 'package:merchant/utils/lato_styles.dart';
import 'package:merchant/view/screen/pages/rider/rider%20deshboard/rider_deshboard.dart';

import '../../merchant/home screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _route();
  }

  void _route() {
    Timer(const Duration(seconds: 1), () async {
      AuthController authController=Get.find<AuthController>();
      // authController.setIsMerchant(false);

      print("Is Login ------------------->>>>> : ${authController.getIsLogin()}");
      if(authController.getIsLogin()){
        Get.to(()=>const RiderDeshboard());
      }else{
        Get.to(()=>const HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration:const BoxDecoration(
          color: ColorResources.colorPrimary
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(Images.nrbLogo),),
          const SizedBox(height: 20,),
          Text("NRB Express", style: latoBold.copyWith(fontSize: 22, color: ColorResources.white),)
        ],
      ),
    );
  }
}
