import 'dart:convert';
import 'package:merchant/helper/remote/api_client.dart';
import '../../../../utils/app_constants.dart';
import '../../response/rider model/check_box_state.dart';

class CheckRepo{
  ApiClient apiClient;

  CheckRepo({required this.apiClient});

  List<CheckModel> getCheckList(){
    List<String>? checks = apiClient.sharedPreferences.getStringList(AppConstants.check);
    List<CheckModel> checkList = [];
    checks!.forEach((element) => checkList.add(CheckModel.fromJson(jsonDecode(element))));
    return checkList;
  }

  void addToCheeckList(List<CheckModel> checkBoxList){
    List<String> check = [];
    checkBoxList.forEach((element) => check.add(jsonEncode(element)));
    apiClient.sharedPreferences.setStringList(AppConstants.check, check);
  }

}