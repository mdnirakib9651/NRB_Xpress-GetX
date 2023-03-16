import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/auth_controller.dart';
import 'package:merchant/data/controller/register_controller.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/lato_styles.dart';
import '../../rider/rider deshboard/rider_deshboard.dart';
import '../registration/register.dart';

class LogInHere extends StatefulWidget {
  bool isMerchant;
  LogInHere({Key? key,required this.isMerchant}) : super(key: key);

  @override
  State<LogInHere> createState() => _LogInHereState();
}

class _LogInHereState extends State<LogInHere> {

  bool isPasswordValidator = true;
  RegisterController registerController = RegisterController();
  AuthController authController = Get.find<AuthController>();
  GlobalKey<FormState> logInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorResources.colorPrimary,
          elevation: 0.0,
          title: Text(
            "LogIn",
            style: latoRegular.copyWith(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Form(
                      key: logInKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: ColorResources.hintTextColor))),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  child: const Icon(
                                    Icons.email,
                                    size: 25,
                                    color: ColorResources.colorPrimary,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 2,
                                  color: ColorResources.hintTextColor,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: registerController.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return 'Enter your email';
                                        }
                                        else if(!value.contains('@') || !value.contains('.')){
                                          return 'Invalid Email';
                                        }else{
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: latoRegular.copyWith(
                                            fontSize: 16, color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: ColorResources.hintTextColor))),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  child: const Icon(
                                    Icons.lock,
                                    size: 25,
                                    color: ColorResources.colorPrimary,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 2,
                                  color: ColorResources.hintTextColor,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: registerController.passController,
                                      obscureText: isPasswordValidator ? true : false,
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return 'please enter password';
                                        }else if(value.length<8){
                                          return 'Password must be 8 character';
                                        }else{
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            onPressed: (){
                                              setState(() {
                                                isPasswordValidator = !isPasswordValidator;
                                              });
                                            },
                                            icon: Icon(isPasswordValidator ? Icons.visibility_off : Icons.visibility, color: ColorResources.colorPrimary,)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Privacy and Policy",
                                    style: latoRegular.copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  String email = registerController.emailController.text ?? "";
                                  registerController.emailItem(email);
                                  String pass = registerController.passController.text.trim();
                                  authController.logIn(email, pass).then((response){
                                    if(response.isSuccess){
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const RiderDeshboard()), (route) => true);
                                      EasyLoading.showSuccess(response.message);
                                    } else{
                                      EasyLoading.showError(response.message);
                                    }
                                    if(logInKey.currentState!.validate()){
                                      return;
                                    } else{
                                      logInKey.currentState!.save();
                                    }
                                  });
                                  // Get.toNamed("/NavigationBarDemo");
                                },
                                child: Container(
                                  height: 45,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: ColorResources.colorPrimary,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                        "LogIn",
                                        style: latoBold.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                            overflow: TextOverflow.fade),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "New User?",
                                    style: latoRegular.copyWith(
                                        fontSize: 16,
                                        color: Colors.black,),
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        Get.to(const Register());
                                      }, child: Text("Sign Up Here", style: latoRegular.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            )
        )
    );
  }
}
