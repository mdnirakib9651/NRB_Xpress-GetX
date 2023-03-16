import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/register_controller.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/lato_styles.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  RegisterController registerController = RegisterController();

  TextEditingController nameController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController bkashController = TextEditingController();

  String? divisionChoose;
  String? areaChoose;
  String? countryChoose;

  List divisionItem = [
    "Dhaka",
    "Chittagong",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh",
  ];
  List areaItem = [
    "Feni Sadar",
    "Fulgazi",
    "Posuram",
    "Sagolaiya"
  ];

  List countryItem = [
    "Bangladesh",
    "Soudhi"
    "Indean",
    "Pakistan",
    "Australia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backgroundColor,
      appBar: AppBar(
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
        backgroundColor: ColorResources.colorPrimary,
        elevation: 0.0,
        title: Text(
          "EDIT PROFILE",
          style: latoRegular.copyWith(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("GENERAL INFORMATION", style: latoRegular.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                ),
                Container(
                  height: 435,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Row(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Row(
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
                      ),
                      Form(
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  hintStyle: latoRegular.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                                  filled: true,
                                  fillColor: ColorResources.textFieldColor,
                                  border: InputBorder.none
                                ),
                              ),
                              const SizedBox(height: 5,),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Gmail",
                                    hintStyle: latoRegular.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                                    filled: true,
                                    fillColor: ColorResources.textFieldColor,
                                    border: InputBorder.none
                                ),
                              ),
                              const SizedBox(height: 5,),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintText: "Phone",
                                    hintStyle: latoRegular.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                                    filled: true,
                                    fillColor: ColorResources.textFieldColor,
                                    border: InputBorder.none
                                ),
                              ),
                              const SizedBox(height: 5,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "Website",
                                    hintStyle: latoRegular.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                                    filled: true,
                                    fillColor: ColorResources.textFieldColor,
                                    border: InputBorder.none
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3,),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 13, left: 8),
                  child: Text("BILLING INFORMATION", style: latoRegular.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: latoRegular.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none
                  ),
                ),
                const SizedBox(height: 3,),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: ColorResources.backgroundColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButton(
                          hint: const Text(
                            "Select District",
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                              fontSize: Dimensions.fontSizeDefault,
                              color: Colors.black),
                          value: divisionChoose,
                          onChanged: (value) {
                            setState(() {
                              divisionChoose = value as String?;
                            });
                          },
                          items: divisionItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: ColorResources.backgroundColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButton(
                          hint: const Text(
                            "Select Area",
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                              fontSize: Dimensions.fontSizeDefault,
                              color: Colors.black),
                          value: areaChoose,
                          onChanged: (value) {
                            setState(() {
                              areaChoose = value as String?;
                            });
                          },
                          items: areaItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Post Code",
                            hintStyle: latoRegular.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: ColorResources.backgroundColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButton(
                          hint: const Text(
                            "Select Country",
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                              fontSize: Dimensions.fontSizeDefault,
                              color: Colors.black),
                          value: areaChoose,
                          onChanged: (value) {
                            setState(() {
                              areaChoose = value as String?;
                            });
                          },
                          items: areaItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 9,),
                  ],
                ),
                const SizedBox(height: 3,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Gmail",
                      hintStyle: latoRegular.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none
                  ),
                ),
                const SizedBox(height: 3,),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 13, left: 8),
                  child: Text("PAYMENT INFORMATION", style: latoRegular.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,),
                          child: Row(
                            children: [
                              Text(
                                "Payment Method:",
                                style: latoMedium.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey[700]),
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Bank",
                                    groupValue: registerController.region,
                                    activeColor: ColorResources.colorPrimary,
                                    onChanged: (String? variable) {
                                      setState(() {
                                        registerController.region = variable!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Bank",
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
                                    value: "Bkash",
                                    groupValue: registerController.region,
                                    activeColor: ColorResources.colorPrimary,
                                    onChanged: (String? variable) {
                                      setState(() {
                                        registerController.region = variable!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Bkash",
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
                                    value: "Cash",
                                    groupValue: registerController.region,
                                    activeColor: ColorResources.colorPrimary,
                                    onChanged: (String? variable) {
                                      setState(() {
                                        registerController.region = variable!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Cash",
                                    style: latoRegular.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15,)
                            ],
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: latoRegular.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: ColorResources.textFieldColor,
                            border: InputBorder.none
                        ),
                      ),
                      const SizedBox(height: 3,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Bank acc No.",
                                  hintStyle: latoRegular.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
                                  filled: true,
                                  fillColor: ColorResources.textFieldColor,
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Bkash number",
                                  hintStyle: latoRegular.copyWith(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
                                  filled: true,
                                  fillColor: ColorResources.textFieldColor,
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorResources.colorPrimary,
                              ),
                              child: Center(child: Text("UPDATE INFORMATION", style: latoRegular.copyWith(color: Colors.white),),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
