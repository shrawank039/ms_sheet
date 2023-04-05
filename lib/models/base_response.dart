
class BaseResponse {
  bool? success;
  String? message;

  BaseResponse({this.success, this.message});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    return _data;
  }
}