import 'package:get/get.dart';

import '../response/order_model.dart';

class OrderRepository{
  Future<Response> getOrderListRepo() async{
    try{
      List<OrderModel> getOrderList = [
        OrderModel(1, "1492691171", "Haji Textile", "Cash on pickup", "document", "Rakibul Hasan", "257, Shiekshahed Bazar Road", "01728382733", "Apr 20, 2017", "Apr 20, 2017"),
        OrderModel(1, "348934934", "Haji Textil", "Cash on Delivary", "Parcel", "Abul Hasan", "BDBL, Bhaban(Level 15- East) 12, Kawran", "93438434", "Apr 20, 2019", "Apr 20, 2017"),
        OrderModel(1, "34234344", "Haji Textile", "Cash on Delivery", "parcel", "Abul Hasan", "Block-A Pallabi Dhaka-1216", "01834342323", "Oct 13, 2020", "Apr 20, 2017"),
        OrderModel(1, "34234344", "Haji Textile", "Cash on Delivery", "parcel", "Abul Hasan", "Block-A Pallabi Dhaka-1216", "01834342323", "Oct 13, 2020", "Apr 20, 2017"),
        OrderModel(1, "348934934", "Haji Textil", "Cash on Delivary", "Parcel", "Abul Hasan", "BDBL, Bhaban(Level 15- East) 12, Kawran", "93438434", "Apr 20, 2019", "Apr 20, 2017"),
        OrderModel(1, "1492691171", "Haji Textile", "Cash on pickup", "document", "Rakibul Hasan", "257, Shiekshahed Bazar Road", "01728382733", "Apr 20, 2017", "Apr 20, 2017"),
        OrderModel(1, "34234344", "Haji Textile", "Cash on Delivery", "parcel", "Abul Hasan", "Block-A Pallabi Dhaka-1216", "01834342323", "Oct 13, 2020", "Apr 20, 2017"),
        OrderModel(1, "1492691171", "Haji Textile", "Cash on pickup", "document", "Rakibul Hasan", "257, Shiekshahed Bazar Road", "01728382733", "Apr 20, 2017", "Apr 20, 2017"),
        OrderModel(1, "1492691171", "Haji Textile", "Cash on pickup", "document", "Rakibul Hasan", "257, Shiekshahed Bazar Road", "01728382733", "Apr 20, 2017", "Apr 20, 2017"),
      ];
      return Response(body: getOrderList, statusCode: 200);
    } catch(e){
      return const Response(statusCode: 500, statusText: "Data Not Found");
    }
  }
}