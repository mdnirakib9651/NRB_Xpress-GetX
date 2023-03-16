import 'package:get/get.dart';

import '../response/billing_model.dart';

class BillingRepository{
  Future<Response> getBillingListData() async{
    try{
      List<BillingModel> billingList = [
        BillingModel(1, "14342324233", "0", "80", "0", "Rakibul Hasan","01947483749", "Cash on Pickup"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "4", "65", "7", "Nazmul Islam", "01947483749", "Cash on Pickup"),
        BillingModel(1, "453454544", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "4", "65", "7", "Nazmul Islam", "01947483749", "Cash on Pickup"),
        BillingModel(1, "14342324233", "0", "80", "0", "Rakibul Hasan", "01947483749", "Cash on Pickup"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "4", "65", "7", "Nazmul Islam", "01947483749", "Cash on Pickup"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "342343434", "0", "34", "2", "Robin Hasan", "01947483749", "Cash on Delivary"),
        BillingModel(1, "14342324233", "0", "80", "0", "Rakibul Hasan", "01947483749", "Cash on Pickup"),
      ];
      return Response(body: billingList, statusCode: 200);
    } catch(e){
      return const Response(statusCode: 500, statusText: "Data Not Found");
    }
  }
}