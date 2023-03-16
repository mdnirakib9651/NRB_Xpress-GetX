import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:merchant/data/model/request/rider%20repository/padding_repository.dart';
import 'package:merchant/data/model/response/rider%20model/padding_model.dart';

class PaddingController extends GetxController implements GetxService{
  PaddingRepository paddingRepository = PaddingRepository();

  List<PaddingModel> _paddingList = [];
  List<PaddingModel> get paddingList => _paddingList;

  Future<Response> getPaddingListControll() async{
    Response response = await paddingRepository.getPaddingListRepo();
    if(response.statusCode == 200){
      _paddingList = [];
      _paddingList.addAll(response.body);
    }else{
      debugPrint("Data Not Found");
    }
    update();
    return response;
  }
}