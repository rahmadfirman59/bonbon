// To parse this JSON data, do
//
//     final checkTableModel = checkTableModelFromJson(jsonString);

import 'dart:convert';

CheckTableModel checkTableModelFromJson(String str) =>
    CheckTableModel.fromJson(json.decode(str));

String checkTableModelToJson(CheckTableModel data) =>
    json.encode(data.toJson());

class CheckTableModel {
  CheckTableModel({
    this.type,
    this.id,
    this.outletActive,
  });

  String? type;
  String? id;
  bool? outletActive;

  factory CheckTableModel.fromJson(Map<String, dynamic> json) =>
      CheckTableModel(
        type: json["type"],
        id: json["id"],
        outletActive: json["outlet_active"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "outlet_active": outletActive,
      };
}
