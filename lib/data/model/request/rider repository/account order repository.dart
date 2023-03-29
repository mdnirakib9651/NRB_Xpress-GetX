
import 'package:get/get.dart';
import 'package:merchant/helper/remote/api_client.dart';
import 'package:merchant/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountOrderRepo{
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AccountOrderRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> accountOrderList(String orderType, int page, String? fromDate, String? toDate) async{
    return await apiClient.postData(AppConstants.ordersAccounts, {"order_type": orderType, "page": page, "from_date": fromDate, "to_date": toDate});
  }

  Future<Response> assignOrderDetails(int orderId) async{
    return await apiClient.postData(AppConstants.ordersDetails, {"id": orderId});
  }


}