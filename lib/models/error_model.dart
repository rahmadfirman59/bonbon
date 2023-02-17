// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    this.statusCode,
    this.timestamp,
    this.message,
  });

  int? statusCode;
  DateTime? timestamp;
  String? message;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        statusCode: json["status_code"],
        timestamp: DateTime.parse(json["timestamp"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "timestamp": timestamp!.toIso8601String(),
        "message": message,
      };
}
