// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/request/order_repository.dart';
import '../model/response/order_model.dart';

class OrderController extends GetxController implements GetxService{
  OrderRepository orderRepository = OrderRepository();

  List<OrderModel> _orderListController = [];
  List<OrderModel> get orderListController => _orderListController;

  Future<Response> getOrderListData() async{
    Response response = await orderRepository.getOrderListRepo();
    if(response.statusCode == 200){
      _orderListController = [];
      _orderListController.addAll(response.body);
    } else{
      debugPrint("Data Not Found");
    }
    update();
    return response;
  }


  // List<AssignOrderData>? _assignOrderList=<AssignOrderData>[].obs;
  // List<AssignOrderData>? get getAssignOrderList=>_assignOrderList;
  // dateWiseSearch(){
  //   _assignOrderList?.clear();
  //   ever(_paginationFilter, (_) => assignOrderList(status,page, fromDate, toDate));
  //   _changePaginationFilter(1, 10);
  //   update();
  // }

}