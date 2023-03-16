import 'package:get/get.dart';
import 'package:merchant/data/model/response/rider%20model/padding_model.dart';

class PaddingRepository{
  Future<Response> getPaddingListRepo() async{
    try{
      List<PaddingModel> paddingList = [
        PaddingModel(1, "1223243655", "0", "200", "0", "Md.Nazrul Islam Rakib", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Sakibal Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Md.Nazmul Islam", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
        PaddingModel(1, "1223243655", "0", "200", "0", "Rakibul Hasan", "018487347842", "Cash on PickUp"),
      ];
      return Response(body: paddingList, statusCode: 200);
    }catch(e){
      return const Response(statusCode: 500, statusText: "Data Not Found");
    }
  }
}