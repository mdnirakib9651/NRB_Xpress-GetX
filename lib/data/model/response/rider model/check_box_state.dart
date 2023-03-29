import 'account_order_model.dart';

class CheckBoxState{
  bool value;
  CheckBoxState({this.value = false});
}

class CheckModel{
  AccountOrderData? accountOrderData;
  dynamic quantity;

  CheckModel(this.accountOrderData, this.quantity);

  CheckModel.fromJson(Map<String, dynamic> json){
    accountOrderData = json['checkBox'] != null ? AccountOrderData.fromJson(json['checkBox']) : null;
    quantity = json['quantity'];
  }
}