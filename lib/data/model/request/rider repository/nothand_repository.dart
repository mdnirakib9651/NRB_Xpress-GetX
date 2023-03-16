import 'package:get/get.dart';
import 'package:merchant/data/model/response/rider%20model/nothend_model.dart';

class NotHandRepository{

  Future<Response> getNotHandRepo() async{
    try{
      List<NotHandOverModel> NotHandList = [
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Md.Nazrul Islam Rakib", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Sakibal Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Md.Nazmul Islam", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        NotHandOverModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
      ];
      return Response(body: NotHandList, statusCode: 200);
    } catch(e){
      return const Response(statusCode: 500, statusText: "Not Data Found");
    }
  }
}