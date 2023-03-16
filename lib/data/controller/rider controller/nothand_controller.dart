import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:merchant/data/model/request/rider%20repository/nothand_repository.dart';
import 'package:merchant/data/model/response/rider%20model/nothend_model.dart';

class NotHandOverController extends GetxController implements GetxService{
  NotHandRepository notHandRepository = NotHandRepository();

  List<NotHandOverModel> _notHandControllerList = [];
  List<NotHandOverModel> get notHandControllerList => _notHandControllerList;

  Future<Response> getNotHandDataList() async{
    Response response = await notHandRepository.getNotHandRepo();
    if(response.statusCode == 200){
      _notHandControllerList = [];
      _notHandControllerList.addAll(response.body);
    }
    else{
      debugPrint("Data Not Found");
    }
    update();
    return response;
  }
}