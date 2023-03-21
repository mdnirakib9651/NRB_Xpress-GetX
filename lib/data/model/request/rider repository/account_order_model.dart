class AccountOrderResponse {
  AccountOrderResponse({
    required this.data,
    required this.meta,
    required this.message,
    required this.status,
  });
  late final List<AccountOrderData> data;
  late final Meta meta;
  late final String message;
  late final bool status;

  AccountOrderResponse.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>AccountOrderData.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['meta'] = meta.toJson();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}


class AccountOrderData {
  AccountOrderData({
    required this.id,
    required this.sku,
    required this.sender,
    required this.senderAddress,
    required this.paymentMethod,
    required this.shipmentItemType,
    required this.recieverName,
    required this.recieverPhone,
    required this.receiverAddress,
    required this.amount,
    required this.date,
    required this.status,
  });
  late final int id;
  late final String sku;
  late final String sender;
  late final String senderAddress;
  late final String paymentMethod;
  late final String shipmentItemType;
  late final String recieverName;
  late final String recieverPhone;
  late final String receiverAddress;
  late final int amount;
  late final String date;
  late final String status;

  AccountOrderData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sku = json['sku'];
    sender = json['sender'];
    senderAddress = json['sender_address'];
    paymentMethod = json['payment_method'];
    shipmentItemType = json['shipment_item_type'];
    recieverName = json['reciever_name'];
    recieverPhone = json['reciever_phone'];
    receiverAddress = json['receiver_address'];
    amount = json['amount'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sku'] = sku;
    _data['sender'] = sender;
    _data['sender_address'] = senderAddress;
    _data['payment_method'] = paymentMethod;
    _data['shipment_item_type'] = shipmentItemType;
    _data['reciever_name'] = recieverName;
    _data['reciever_phone'] = recieverPhone;
    _data['receiver_address'] = receiverAddress;
    _data['amount'] = amount;
    _data['date'] = date;
    _data['status'] = status;
    return _data;
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final int? from;
  late final int? lastPage;
  late final String? path;
  late final int? perPage;
  late final int? to;
  late final int? total;

  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}