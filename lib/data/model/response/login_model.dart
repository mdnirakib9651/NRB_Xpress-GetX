class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.version,
    required this.id,
    required this.token,
  });
  late final bool status;
  late final String message;
  late final String version;
  late final int id;
  late final String token;

  LoginResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    version = json['version'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['version'] = version;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}