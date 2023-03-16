import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/request/billing_repository.dart';
import '../model/response/billing_model.dart';

class BillingController extends GetxController implements GetxService{
  BillingRepository billingRepository = BillingRepository();

  List<BillingModel> _billingList = [];
  List<BillingModel> get billingList => _billingList;

  Future<Response> getBillingList() async{
    Response response = await billingRepository.getBillingListData();
    if(response.statusCode == 200){
      _billingList = [];
      _billingList.addAll(response.body);
    } else{
      debugPrint("Data Not Found");
    }
    update();
    return response;
  }

}