class LoginRequest {
  LoginRequest({
    this.code,
    this.password,
  });

  LoginRequest.fromJson(dynamic json) {
    code = json['code'];
    password = json['password'];
  }

  String? code;
  String? password;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['password'] = password;
    return map;
  }
}
