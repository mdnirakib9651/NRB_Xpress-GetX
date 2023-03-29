import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/auth_controller.dart';
import 'package:merchant/utils/lato_styles.dart';
import 'package:merchant/view/screen/pages/merchant/merchant%20deshboard/merchant_deshboard.dart';
import 'package:merchant/view/screen/pages/rider/rider%20deshboard/rider_deshboard.dart';

import '../../../../../utils/color_resources.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  bool isPassVasiable = true;
  bool isNewPassVasiable = true;
  bool isConPassVasiable = true;
  GlobalKey<FormState> changeKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorResources.colorPrimaryRider,
          elevation: 0.0,
          title: Text(
            "Change Password",
            style: latoRegular.copyWith(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height - 110,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Form(
                      key: changeKey,
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
                                    Icons.lock,
                                    size: 25,
                                    color: ColorResources.colorPrimaryRider,
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
                                      controller: oldPasswordController,
                                      obscureText: isPassVasiable ? true : false,
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
                                        hintText: "Old Password",
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            onPressed: (){
                                              setState(() {
                                                isPassVasiable = !isPassVasiable;
                                              });
                                            },
                                            icon: Icon(isPassVasiable ? Icons.visibility_off : Icons.visibility, color: ColorResources.colorPrimaryRider,)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
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
                                    color: ColorResources.colorPrimaryRider,
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
                                      controller: newPasswordController,
                                      obscureText: isNewPassVasiable ? true : false,
                                      validator: (value) {
                                        if(value!.isEmpty || value.isEmpty){
                                          return "Password can't be empty";
                                        } else if(value.length < 8){
                                          return "Password must be 8 characters";
                                        }
                                        else if(value!=newPasswordController.text){
                                          return "Password should be matched";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "New Password",
                                        border: InputBorder.none,suffixIcon: IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          onPressed: (){
                                            setState(() {
                                              isNewPassVasiable = !isNewPassVasiable;
                                            });
                                          },
                                          icon: Icon(isNewPassVasiable ? Icons.visibility_off : Icons.visibility, color: ColorResources.colorPrimaryRider,)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
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
                                    color: ColorResources.colorPrimaryRider,
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
                                      controller: confirmPasswordController,
                                      obscureText: isConPassVasiable ? true : false,
                                      validator: (value) {
                                        if(value!.isEmpty || value.isEmpty){
                                          return "Password can't be empty";
                                        } else if(value.length < 8){
                                          return "Password must be 8 characters";
                                        }
                                        else if(value!=newPasswordController.text){
                                          return "Password should be matched";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            onPressed: (){
                                              setState(() {
                                                isConPassVasiable = !isConPassVasiable;
                                              });
                                            },
                                            icon: Icon(isConPassVasiable ? Icons.visibility_off : Icons.visibility, color: ColorResources.colorPrimaryRider,)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  AuthController auth = Get.find<AuthController>();
                                  String oldPass = oldPasswordController.text.trim();
                                  String newPass = newPasswordController.text.trim();
                                  String confirmPass = confirmPasswordController.text.trim();
                                  auth.getChangePass(oldPass, newPass, confirmPass).then((response){
                                    if(response.isSuccess){
                                      EasyLoading.showSuccess(response.message);
                                      Get.to(()=> const RiderDeshboard());
                                    } else{
                                      EasyLoading.showError(response.message);
                                    }
                                  });
                                  if(changeKey.currentState!.validate()){
                                    return;
                                  } else{
                                    changeKey.currentState!.save();
                                  }
                                },
                                child: Container(
                                  height: 45,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: ColorResources.colorPrimaryRider,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                        "Change Password",
                                        style: latoBold.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
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
                )
            )
        )
    );
  }
}
