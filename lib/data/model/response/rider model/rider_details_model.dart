class RiderDetailsModel {
  RiderDetailsModel({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final bool status;
  late final RiderDetailsData data;

  RiderDetailsModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = RiderDetailsData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class RiderDetailsData {
  RiderDetailsData({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.avatar,
  });
  late final String firstName;
  late final String lastName;
  late final String mobile;
  late final String email;
  late final String avatar;

  RiderDetailsData.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['avatar'] = avatar;
    return _data;
  }
}