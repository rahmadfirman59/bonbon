// To parse this JSON data, do
//
//     final meModel = meModelFromJson(jsonString);

import 'dart:convert';

MeModel meModelFromJson(String str) => MeModel.fromJson(json.decode(str));

String meModelToJson(MeModel data) => json.encode(data.toJson());

class MeModel {
  MeModel({
    this.address,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.lastLoginAt,
    this.createdAt,
    this.updatedAt,
    this.credit,
    this.birthdate,
    this.gender,
    this.media,
    this.session,
  });

  dynamic address;
  String? id;
  String? name;
  dynamic email;
  String? phone;
  DateTime? lastLoginAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic credit;
  dynamic birthdate;
  dynamic gender;
  dynamic media;
  String? session;

  factory MeModel.fromJson(Map<String, dynamic> json) => MeModel(
        address: json["address"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        lastLoginAt: DateTime.parse(json["last_login_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        credit: json["credit"],
        birthdate: json["birthdate"],
        gender: json["gender"],
        media: json["media"],
        session: json["session"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "last_login_at": lastLoginAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "credit": credit,
        "birthdate": birthdate,
        "gender": gender,
        "media": media,
        "session": session,
      };
}
