class DashboardResponse {
  DashboardResponse({
    required this.data,
  });
  late final DashBoardData data;

  DashboardResponse.fromJson(Map<String, dynamic> json){
    data = DashBoardData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class DashBoardData {
  DashBoardData({
  required this.newOrder,
  required this.active,
  required this.hold,
  required this.wentForDelivery,
  required this.delivered,
});
late final int newOrder;
late final int active;
late final int hold;
late final int wentForDelivery;
late final int delivered;

DashBoardData.fromJson(Map<String, dynamic> json){
  newOrder = json['new'];
active = json['active'];
hold = json['hold'];
wentForDelivery = json['went_for_delivery'];
delivered = json['delivered'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['new'] = newOrder;
_data['active'] = active;
_data['hold'] = hold;
_data['went_for_delivery'] = wentForDelivery;
_data['delivered'] = delivered;
return _data;
}
}