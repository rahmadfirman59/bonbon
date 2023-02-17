// To parse this JSON data, do
//
//     final checkTableSessionModel = checkTableSessionModelFromJson(jsonString);

import 'dart:convert';

List<CheckTableSessionModel> checkTableSessionModelFromJson(String str) =>
    List<CheckTableSessionModel>.from(
        json.decode(str).map((x) => CheckTableSessionModel.fromJson(x)));

String checkTableSessionModelToJson(List<CheckTableSessionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckTableSessionModel {
  CheckTableSessionModel({
    this.members,
    this.orders,
    this.leader,
    this.id,
    this.number,
    this.pax,
    this.type,
    this.note,
    this.grossTotal,
    this.rounding,
    this.discount,
    this.charge,
    this.tax,
    this.refund,
    this.netTotal,
    this.paymentAmount,
    this.paymentChange,
    this.paymentMethod,
    this.paymentNote,
    this.status,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
    this.allowRequestBill,
  });

  List<Member>? members;
  List<dynamic>? orders;
  Leader? leader;
  String? id;
  String? number;
  int? pax;
  String? type;
  String? note;
  int? grossTotal;
  dynamic rounding;
  int? discount;
  int? charge;
  int? tax;
  dynamic refund;
  int? netTotal;
  dynamic paymentAmount;
  dynamic paymentChange;
  dynamic paymentMethod;
  dynamic paymentNote;
  String? status;
  dynamic completedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? allowRequestBill;

  factory CheckTableSessionModel.fromJson(Map<String, dynamic> json) =>
      CheckTableSessionModel(
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
        orders: json["orders"] == null
            ? []
            : List<dynamic>.from(json["orders"]!.map((x) => x)),
        leader: json["leader"] == null ? null : Leader.fromJson(json["leader"]),
        id: json["id"],
        number: json["number"],
        pax: json["pax"],
        type: json["type"],
        note: json["note"],
        grossTotal: json["gross_total"],
        rounding: json["rounding"],
        discount: json["discount"],
        charge: json["charge"],
        tax: json["tax"],
        refund: json["refund"],
        netTotal: json["net_total"],
        paymentAmount: json["payment_amount"],
        paymentChange: json["payment_change"],
        paymentMethod: json["payment_method"],
        paymentNote: json["payment_note"],
        status: json["status"],
        completedAt: json["completed_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        allowRequestBill: json["allow_request_bill"],
      );

  Map<String, dynamic> toJson() => {
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "orders":
            orders == null ? [] : List<dynamic>.from(orders!.map((x) => x)),
        "leader": leader?.toJson(),
        "id": id,
        "number": number,
        "pax": pax,
        "type": type,
        "note": note,
        "gross_total": grossTotal,
        "rounding": rounding,
        "discount": discount,
        "charge": charge,
        "tax": tax,
        "refund": refund,
        "net_total": netTotal,
        "payment_amount": paymentAmount,
        "payment_change": paymentChange,
        "payment_method": paymentMethod,
        "payment_note": paymentNote,
        "status": status,
        "completed_at": completedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "allow_request_bill": allowRequestBill,
      };
}

class Leader {
  Leader({
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
  });

  dynamic address;
  String? id;
  String? name;
  dynamic email;
  dynamic phone;
  dynamic lastLoginAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic credit;
  dynamic birthdate;
  dynamic gender;

  factory Leader.fromJson(Map<String, dynamic> json) => Leader(
        address: json["address"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        lastLoginAt: json["last_login_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        credit: json["credit"],
        birthdate: json["birthdate"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "last_login_at": lastLoginAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "credit": credit,
        "birthdate": birthdate,
        "gender": gender,
      };
}

class Member {
  Member({
    this.user,
    this.id,
    this.startedAt,
    this.endedAt,
    this.isLeader,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Leader? user;
  String? id;
  DateTime? startedAt;
  dynamic endedAt;
  bool? isLeader;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: json["user"] == null ? null : Leader.fromJson(json["user"]),
        id: json["id"],
        startedAt: json["started_at"] == null
            ? null
            : DateTime.parse(json["started_at"]),
        endedAt: json["ended_at"],
        isLeader: json["is_leader"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "id": id,
        "started_at": startedAt?.toIso8601String(),
        "ended_at": endedAt,
        "is_leader": isLeader,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
