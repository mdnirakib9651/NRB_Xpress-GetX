import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:merchant/data/model/response/login_model.dart';
import 'package:merchant/data/model/response/logout_model.dart';
import 'package:merchant/data/model/response/rider%20model/dashboard_model.dart';
import 'package:merchant/data/model/response/rider%20model/rider_details_model.dart';
import 'package:merchant/view/screen/pages/merchant/menu%20screen/logout.dart';
import '../model/request/auth repository/auth_repository.dart';
import '../model/response/base/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});


  /// ------------->>>>> Login Screen <<<<<-----------------
  Future<ResponseModel> logIn(String email, String password) async{
    Response apiResponse = await authRepo.logIn(email: email, password: password);
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.body);
      String token = loginResponse.token;
      // int? userId = loginResponse.id;
      authRepo.saveUserToken(token);
      await authRepo.setLogIn(true);
      await authRepo.setMerchant(false);
      responseModel = ResponseModel(true, 'Successful');
    }
    else{
      responseModel = ResponseModel(false, 'Invalid email or password');
    }
    update();
    return responseModel;
  }

  /// ------------->>>>> Login Screen <<<<<-----------------
  Future<ResponseModel> logOut() async{
    Response apiResponse = await authRepo.logOut();
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      LogOutModel logOutModel = LogOutModel.fromJson(apiResponse.body);
      authRepo.saveUserToken("");
      await authRepo.setLogIn(false);
      await authRepo.setMerchant(false);
      responseModel = ResponseModel(true, logOutModel.message);
    } else{
      responseModel = ResponseModel(false, "Failed!");
    }
    return responseModel;
  }

  // Future<ResponseModel> logOut() async {
  //   showLoading('processing...');
  //   update();
  //   Response response = await authRepo.logOut();
  //   ResponseModel responseModel;
  //   if (response.statusCode == 200) {
  //     responseModel = ResponseModel(true, response.body["message"].toString());
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText.toString());
  //   }
  //   hideLoading();
  //   update();
  //   return responseModel;
  // }
  /// ---------------->>>>>>> DashBoard Data <<<<<<<----------------
  DashBoardData? _dashBoardData;
  DashBoardData? get dashboardData => _dashBoardData;
  Future<ResponseModel> getdashBoardData() async{
    Response apiResponse = await authRepo.dashBoard();
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      _dashBoardData = DashboardResponse.fromJson(apiResponse.body).data;

      responseModel = ResponseModel(true, "Success");
    } else{
      responseModel = ResponseModel(false, "Failed!");
    }
    update();
    return responseModel;
  }

  /// ----------------->>>>>>>> Rider Details <<<<<<<<-------------------
  RiderDetailsData? _riderDetailsData = null;
  RiderDetailsData? get riderDetailsData => _riderDetailsData;
  
  Future<ResponseModel> getRiderDetails() async{
    // EasyLoading.show(status: 'processing...');
    Response response = await authRepo.riderDetails();
    ResponseModel responseModel;
    if(response.statusCode == 200){
      _riderDetailsData = RiderDetailsModel.fromJson(response.body).data;
      debugPrint("Rider Details: $_riderDetailsData");
      responseModel = ResponseModel(true, response.body[0].toString()); /// ----->>>> conpution
    } else{
      responseModel = ResponseModel(false, response.body["email"][0].toString()); /// ----->>>> conpution
    }
    EasyLoading.dismiss();
    update();
    return responseModel;
  }

  /// ----------------->>>>>>>> Rider Details <<<<<<<<-------------------
  Future<ResponseModel> getChangePass (String oldPassword, String newPassword, String confirmPassword) async{
    Response apiResponse = await authRepo.changePass(oldPass: oldPassword, newPass: newPassword, confirmPass: confirmPassword);
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      responseModel = ResponseModel(true, "Successful");
    }
    else{
      responseModel = ResponseModel(false, "Failed!");
    }
    return responseModel;
  }
}
