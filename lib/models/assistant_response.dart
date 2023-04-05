
class AssistantResponse {
  bool? success;
  List<AssistantResponseData>? data;
  String? message;

  AssistantResponse({this.success, this.data, this.message});

  AssistantResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => AssistantResponseData.fromJson(e)).toList();
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["message"] = message;
    return _data;
  }
}

class AssistantResponseData {
  int? id;
  String? name;
  dynamic email;
  String? mobileNumber;
  int? creditPoints;
  String? type;
  int? parentId;
  int? totalClients;
  List<Clients>? clients;

  AssistantResponseData({this.id, this.name, this.email, this.mobileNumber, this.creditPoints, this.type, this.parentId, this.totalClients, this.clients});

  AssistantResponseData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    mobileNumber = json["mobile_number"];
    creditPoints = json["credit_points"];
    type = json["type"];
    parentId = json["parent_id"];
    totalClients = json["total_clients"];
    clients = json["clients"] == null ? null : (json["clients"] as List).map((e) => Clients.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["mobile_number"] = mobileNumber;
    _data["credit_points"] = creditPoints;
    _data["type"] = type;
    _data["parent_id"] = parentId;
    _data["total_clients"] = totalClients;
    if(clients != null) {
      _data["clients"] = clients?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Clients {
  int? id;
  String? name;
  String? mobileNumber;
  String? pairRate;
  String? inOutRate;
  String? commission;
  String? patti;
  String? referenceCommission;
  String? dailyIncentive;
  String? referenceId;
  String? createdAt;

  Clients({this.id, this.name, this.mobileNumber, this.pairRate, this.inOutRate, this.commission, this.patti, this.referenceCommission, this.dailyIncentive, this.referenceId, this.createdAt});

  Clients.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    mobileNumber = json["mobile_number"];
    pairRate = json["pair_rate"];
    inOutRate = json["in_out_rate"];
    commission = json["commission"];
    patti = json["patti"];
    referenceCommission = json["reference_commission"];
    dailyIncentive = json["daily_incentive"];
    referenceId = json["reference_id"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["mobile_number"] = mobileNumber;
    _data["pair_rate"] = pairRate;
    _data["in_out_rate"] = inOutRate;
    _data["commission"] = commission;
    _data["patti"] = patti;
    _data["reference_commission"] = referenceCommission;
    _data["daily_incentive"] = dailyIncentive;
    _data["reference_id"] = referenceId;
    _data["created_at"] = createdAt;
    return _data;
  }
}