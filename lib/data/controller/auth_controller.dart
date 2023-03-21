import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:merchant/data/model/response/login_model.dart';
import 'package:merchant/data/model/response/logout_model.dart';
import 'package:merchant/data/model/response/rider%20model/dashboard_model.dart';
import 'package:merchant/data/model/response/rider%20model/rider_details_model.dart';
import '../model/request/auth repository/auth_repository.dart';
import '../model/response/base/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});


  /// ------------->>>>> Login Screen <<<<<-----------------
  Future<ResponseModel> logIn({required String email, required String password, required double latitude, required double longitude, required String address}) async{
    Response apiResponse = await authRepo.logIn(email: email, password: password, latitude: latitude, longitude: longitude, address: address);
    ResponseModel responseModel;
    if(apiResponse.statusCode == 200){
      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.body);
      String token = loginResponse.token;
      // int? userId = loginResponse.id;
      authRepo.saveUserToken(token);
      await authRepo.setLogIn(true);
      await authRepo.setMerchant(false);
      responseModel = ResponseModel(true, 'Login Successful');
    }
    else{
      responseModel = ResponseModel(false, 'Invalid email or password');
    }
    update();
    return responseModel;
  }

  /// ------------->>>>> Logout Screen <<<<<-----------------
  Future<ResponseModel> logOut({required double latitude, required double longitude, required String address}) async{
    Response apiResponse = await authRepo.logOut(latitude: latitude, longitude: longitude, address: address);
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


  /// ------------------>>>> GetLocation <<<-----------------------
  Position? _currentPosition;
  Position? get getCurrentPosition=> _currentPosition;

  String? _currentAddress;
  String? get currentAddress=>_currentAddress;


  Future<Placemark> getPlaceMark(Position position) async{
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    _currentAddress = '${placemarks[0].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}.';
    print("Address: $_currentAddress");
    return placemarks[0];
  }
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    _currentPosition = position;
    print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    await getPlaceMark(position);
    update();
    return position;
  }

}
