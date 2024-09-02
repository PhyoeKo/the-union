/// data : [{"id":1,"name":"Patient 1","code":"942642","volunteer":"Linn Htet","created_at":"31/08/2024","updated_at":"31/08/2024"},{"id":1,"name":"Patient 1","code":"942642","volunteer":"Linn Htet","created_at":"31/08/2024","updated_at":"31/08/2024"}]

class PatientResponse {
  List<PatientData>? data;

  PatientResponse({
      this.data});

  PatientResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(PatientData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Patient 1"
/// code : "942642"
/// volunteer : "Linn Htet"
/// created_at : "31/08/2024"
/// updated_at : "31/08/2024"

class PatientData {
  int? id;
  String? name;
  String? code;
  String? volunteer;
  String? createdAt;
  String? updatedAt;

  PatientData({
      this.id, 
      this.name, 
      this.code, 
      this.volunteer, 
      this.createdAt, 
      this.updatedAt});

  PatientData.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    volunteer = json["volunteer"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["code"] = code;
    map["volunteer"] = volunteer;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    return map;
  }

}