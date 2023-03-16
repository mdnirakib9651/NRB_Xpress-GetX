import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/register_controller.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/lato_styles.dart';
import '../logIn/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  RegisterController registerController = RegisterController();
  void _submit(){
    if(registerKey.currentState!.validate()){
      return;
    }
    registerKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorResources.colorPrimary,
        elevation: 0.0,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Text(
          "REGISTER",
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Region:",
                        style: latoMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            color: Colors.grey[700]),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "Local",
                            groupValue: registerController.region,
                            activeColor: ColorResources.colorPrimary,
                            onChanged: (String? variable) {
                              setState(() {
                                registerController.region = variable!;
                              });
                            },
                          ),
                          Text(
                            "Local",
                            style: latoRegular.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "International",
                            groupValue: registerController.region,
                            activeColor: ColorResources.colorPrimary,
                            onChanged: (String? variable) {
                              setState(() {
                                registerController.region = variable!;
                              });
                            },
                          ),
                          Text(
                            "International",
                            style: latoRegular.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Account Type:",
                          style: latoMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraLarge,
                              color: Colors.grey[700]),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: "Retail",
                                groupValue: registerController.accountType,
                                activeColor: ColorResources.colorPrimary,
                                onChanged: (String? variable) {
                                  setState(() {
                                    registerController.accountType = variable!;
                                  });
                                },
                              ),
                              Text(
                                "Retail",
                                style: latoRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Corporate",
                                groupValue: registerController.accountType,
                                activeColor: ColorResources.colorPrimary,
                                onChanged: (String? variable) {
                                  setState(() {
                                    registerController.accountType = variable!;
                                  });
                                },
                              ),
                              Text(
                                "Corporate",
                                style: latoRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Government",
                                groupValue: registerController.accountType,
                                activeColor: ColorResources.colorPrimary,
                                onChanged: (String? variable) {
                                  setState(() {
                                    registerController.accountType = variable!;
                                  });
                                },
                              ),
                              Text(
                                "Government",
                                style: latoRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Form(
                    key: registerKey,
                      child: Column(
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
                                Icons.person,
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
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Please enter full name";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  controller: registerController.nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
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
                      const SizedBox(
                        height: 5,
                      ),
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
                                  keyboardType: TextInputType.emailAddress,
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
                      const SizedBox(
                        height: 5,
                      ),
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
                                Icons.phone,
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
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Please enter your phone number";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  controller: registerController.phoneController,
                                  keyboardType: TextInputType.phone,

                                  decoration: const InputDecoration(
                                    hintText: "Phone",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                                  controller: registerController.confirmController,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return 'please enter confirm password';
                                    }
                                    else if(registerController.passController == registerController.confirmController){
                                      return "Password doesn't match";
                                    } else if(value.length<8){
                                      return 'Password must be 8 character';
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    hintText: "Confirm Password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){

                            },
                            child: Center(
                              child: Text("Privacy and Policy",
                                style: latoRegular.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              _submit();
                              String name = registerController.nameController.text ?? "";
                              String email = registerController.emailController.text ?? "";
                              String phone = registerController.phoneController.text ?? "";
                              String region = registerController.region ?? "";
                              String account = registerController.accountType ?? "";
                              registerController.nameItem(name);
                              registerController.emailItem(email);
                              registerController.phoneItem(phone);
                              registerController.regionItem(region);
                              registerController.accountItem(account);
                              Get.toNamed("/NavigationBarDemo");
                            },
                            child: Container(
                              height: 45,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: ColorResources.colorPrimary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "REGISTER NOW!",
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
                          Text(
                            "Already Registered?",
                            style: latoRegular.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInHere(isMerchant: true,)));
                              },
                              child: Text(
                                "Login Here",
                                style: latoRegular.copyWith(
                                    fontSize: 18,
                                    color: ColorResources.colorPrimary,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
