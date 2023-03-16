import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  String? region;
  String? accountType;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  var regionItem = "".obs;
  var accountTypeItem = "".obs;
  var nameItem = "".obs;
  var emailItem = "".obs;
  var phoneItem = "".obs;
  var accountItem = "".obs;

}