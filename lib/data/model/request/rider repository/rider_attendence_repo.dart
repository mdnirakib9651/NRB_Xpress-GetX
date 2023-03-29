import 'package:get/get.dart';
import 'package:merchant/helper/remote/api_client.dart';
import 'package:merchant/utils/app_constants.dart';

class RiderAttendenceRepo{
  ApiClient apiClient;
  RiderAttendenceRepo({required this.apiClient});

  Future<Response> riderAttendenceList(String? fromDate, String? toDate) async{
    return await apiClient.postData(AppConstants.riderAttendence, {"from_date": fromDate, "to_date": toDate});
  }

}