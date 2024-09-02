/// token : "27|Xf2cNCVwEgz6gw3DmMwlevGaSnpoGmHCD5doV9Ucec469f44"
/// name : "admin"

class LoginResponse {
  String? token;
  String? name;

  LoginResponse({
      this.token, 
      this.name});

  LoginResponse.fromJson(dynamic json) {
    token = json["token"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = token;
    map["name"] = name;
    return map;
  }

}