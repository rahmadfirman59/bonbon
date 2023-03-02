// To parse this JSON data, do
//
//     final createSessionModel = createSessionModelFromJson(jsonString);

import 'dart:convert';

CreateSessionModel createSessionModelFromJson(String str) =>
    CreateSessionModel.fromJson(json.decode(str));

String createSessionModelToJson(CreateSessionModel data) =>
    json.encode(data.toJson());

class CreateSessionModel {
  CreateSessionModel({
    this.pax,
    this.type,
    this.note,
    this.status,
    this.id,
    this.number,
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
    this.completedAt,
    this.allowRequestBill,
    this.createdAt,
    this.updatedAt,
  });

  int? pax;
  String? type;
  String? note;
  String? status;
  String? id;
  String? number;
  int? grossTotal;
  dynamic rounding;
  int? discount;
  int? charge;
  int? tax;
  dynamic refund;
  dynamic netTotal;
  dynamic paymentAmount;
  dynamic paymentChange;
  dynamic paymentMethod;
  dynamic paymentNote;
  dynamic completedAt;
  bool? allowRequestBill;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CreateSessionModel.fromJson(Map<String, dynamic> json) =>
      CreateSessionModel(
        pax: json["pax"],
        type: json["type"],
        note: json["note"],
        status: json["status"],
        id: json["id"],
        number: json["number"],
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
        completedAt: json["completed_at"],
        allowRequestBill: json["allow_request_bill"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "pax": pax,
        "type": type,
        "note": note,
        "status": status,
        "id": id,
        "number": number,
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
        "completed_at": completedAt,
        "allow_request_bill": allowRequestBill,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
