import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:merchant/helper/remote/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_constants.dart';

class AuthRepo{
  ApiClient apiClient;
  SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  /// --------------->>>>> LogIn Controller <<<<<-----------------
  /// 1.
  Future<Response> logIn({required String email, required String password, required double latitude, required double longitude, required String address})async{
    return await apiClient.postData(AppConstants.logIn, {"email": email, "password": password, "device_name": "android", "latitude": latitude, "longitude": longitude, "address": address});
  }
  /// 2.
  Future<void> setLogIn(bool isLogIn) async{
    try{
      await sharedPreferences.setBool(AppConstants.isLogIn, isLogIn);
      print("Set Is LogIn: ${sharedPreferences.getBool(AppConstants.isLogIn)}");
    } catch(e){
      print("Set Is Login: $e");
      rethrow;
    }
  }
  /// 3.
  Future<void> setMerchant(bool isLogin) async{
    try {
      await sharedPreferences.setBool(AppConstants.isMerchant, isLogin);
    } catch (e) {
      rethrow;
    }
  }
  /// 4.
  Future<void> saveUserToken(String token) async{
    apiClient.updateHeader(token);
    try{
       await sharedPreferences.setString(AppConstants.token, token);
      debugPrint("token Save : $token");
    } catch (e){
      rethrow;
    }
  }
  String? getToken(){
    return   sharedPreferences.getString(AppConstants.token);
  }
  ///5 .
  Future<Response> logOut({required double latitude, required double longitude, required String address}) async{
    return await apiClient.postData(AppConstants.logOut, {"latitude": latitude, "longitude": longitude, "address": address});
  }
  /// 6.
  bool getIsLogin()  {
    return sharedPreferences.getBool(AppConstants.isLogIn) ?? false;
  }

  /// --------------->>>>> DashBoardData Controller <<<<<-----------------
  /// 1.
  Future<Response> dashBoard()async{
    return await apiClient.postData(AppConstants.dashBoard, {});
  }
  
  /// ----------------->>>>> Rider Details <<<<<<------------------
  /// 1.
  Future<Response> riderDetails() async{
    return await apiClient.postData(AppConstants.riderDetails, {"order_type": "pending"});
  }

  /// ----------------->>>>> Log Out <<<<<<------------------


  /// ----------------->>>>> Change Password <<<<<<------------------
  Future<Response> changePass({required String oldPass, required String newPass, required String confirmPass}) async{
    return await apiClient.postData(AppConstants.changePassword, {"old_password": oldPass, "password": newPass, "password_confirmation": confirmPass});
  }
}