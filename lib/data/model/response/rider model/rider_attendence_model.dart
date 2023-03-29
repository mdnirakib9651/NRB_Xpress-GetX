class RiderAttendenceModel {
  RiderAttendenceModel({
    required this.data,
    required this.meta,
    required this.message,
    required this.status,
  });
  late final List<RiderAttendenceData> data;
  late final Meta meta;
  late final String message;
  late final bool status;

  RiderAttendenceModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>RiderAttendenceData.fromJson(e)).toList();
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

class RiderAttendenceData {
  RiderAttendenceData({
    required this.id,
    required this.date,
    required this.checkinAddress,
    required this.checkinTime,
    required this.checkoutTime,
    this.checkoutAddress,
  });
  late final int id;
  late final String date;
  late final String checkinAddress;
  late final String checkinTime;
  late final String checkoutTime;
  late final String? checkoutAddress;

  RiderAttendenceData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    date = json['date'];
    checkinAddress = json['checkin_address'];
    checkinTime = json['checkin_time'];
    checkoutTime = json['checkout_time'];
    checkoutAddress = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date'] = date;
    _data['checkin_address'] = checkinAddress;
    _data['checkin_time'] = checkinTime;
    _data['checkout_time'] = checkoutTime;
    _data['checkout_address'] = checkoutAddress;
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
  late final int from;
  late final int lastPage;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

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