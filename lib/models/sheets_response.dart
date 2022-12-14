import 'dart:convert';

/// success : true
/// data : [{"id":1,"name":"Sheet 2","end_time":"10:30:00"},{"id":2,"name":"Sheet 2","end_time":"10:30:00"},{"id":3,"name":"test","end_time":"05:53:00"},{"id":4,"name":"Test","end_time":"05:59:00"}]
/// message : "Sheets retrieved successfully."

SheetsResponse sheetsResponseFromJson(String str) =>
    SheetsResponse.fromJson(json.decode(str));
String sheetsResponseToJson(SheetsResponse data) => json.encode(data.toJson());

class SheetsResponse {
  SheetsResponse({
    bool? success,
    List<Sheets>? data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  SheetsResponse.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Sheets.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _success;
  List<Sheets>? _data;
  String? _message;
  SheetsResponse copyWith({
    bool? success,
    List<Sheets>? data,
    String? message,
  }) =>
      SheetsResponse(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  List<Sheets>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }
}

/// id : 1
/// name : "Sheet 2"
/// end_time : "10:30:00"

Sheets dataFromJson(String str) => Sheets.fromJson(json.decode(str));
String dataToJson(Sheets data) => json.encode(data.toJson());

class Sheets {
  Sheets({
    num? id,
    String? name,
    String? endTime,
  }) {
    _id = id;
    _name = name;
    _endTime = endTime;
  }

  Sheets.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _endTime = json['end_time'];
  }
  num? _id;
  String? _name;
  String? _endTime;
  Sheets copyWith({
    num? id,
    String? name,
    String? endTime,
  }) =>
      Sheets(
        id: id ?? _id,
        name: name ?? _name,
        endTime: endTime ?? _endTime,
      );
  num? get id => _id;
  String? get name => _name;
  String? get endTime => _endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['end_time'] = _endTime;
    return map;
  }
}
