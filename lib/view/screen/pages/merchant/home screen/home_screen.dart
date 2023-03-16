import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/home_controller.dart';
import 'package:merchant/data/controller/register_controller.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/images.dart';
import 'package:merchant/utils/lato_styles.dart';
import 'package:merchant/view/components/icontext.dart';
import '../logIn/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey formKey = GlobalKey<FormState>();
  HomeController homeController = HomeController();
  RegisterController registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.backgroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Images.cycle,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconText(
                        icon: Icons.settings,
                        title:
                            "Lightning fast Courier Service Get your parcel delivered anywhere you want"),
                    iconText(
                        icon: Icons.light_mode_outlined,
                        title:
                            "Lightning fast Courier Service Get your parcel delivered anywhere you want"),
                    iconText(
                        icon: Icons.offline_bolt_outlined,
                        title:
                            "Lightning fast Courier Service Get your parcel delivered anywhere you want"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/Register");
                          },
                          child: Container(
                            height: 45,
                            width: 140,
                            decoration: BoxDecoration(
                                color: ColorResources.colorPrimary,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "GET STARTED",
                              style: latoBold.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                  overflow: TextOverflow.fade),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LogInHere(isMerchant: true,));
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "LOGIN",
                              style: latoRegular.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorResources.colorPrimary,
                                  overflow: TextOverflow.fade),
                            )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Track Your Order",
                                style: latoRegular.copyWith(
                                    fontSize: 26,
                                    color: ColorResources.colorPrimary,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Form(
                                key: formKey,
                                child: TextFormField(
                                  controller: homeController.phoneController,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return 'please enter password';
                                    }else if(value.length<8){
                                      return 'Password must be 8 character';
                                    }else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "  Tracking Number",
                                    hintStyle: latoRegular.copyWith(
                                        fontSize: 23, color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1, color: Colors.grey)),
                                      child: Center(
                                          child: Text(
                                        "TRACK NOW",
                                        style: latoRegular.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: ColorResources.colorPrimary,
                                            overflow: TextOverflow.fade),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      String item = homeController.phoneController.text;
                                      homeController.phoneitem(item);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: ColorResources.colorPrimary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "QUICK QUOTE",
                                        style: latoBold.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                            overflow: TextOverflow.fade),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
