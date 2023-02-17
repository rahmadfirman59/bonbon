// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'dart:convert';

TableModel tableModelFromJson(String str) =>
    TableModel.fromJson(json.decode(str));

String tableModelToJson(TableModel data) => json.encode(data.toJson());

class TableModel {
  TableModel({
    this.outlet,
    this.group,
    this.id,
    this.name,
    this.pax,
    this.createdAt,
    this.updatedAt,
  });

  Outlet? outlet;
  Group? group;
  String? id;
  String? name;
  int? pax;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        outlet: Outlet.fromJson(json["outlet"]),
        group: Group.fromJson(json["group"]),
        id: json["id"],
        name: json["name"],
        pax: json["pax"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "outlet": outlet?.toJson(),
        "group": group?.toJson(),
        "id": id,
        "name": name,
        "pax": pax,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Group {
  Group({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Outlet {
  Outlet({
    this.address,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.description,
    this.receiptTagLine,
    this.receiptShowPhone,
    this.receiptShowEmail,
    this.receiptDisplayAddress,
    this.bookingEnable,
    this.bookingJoinTable,
    this.bookingOverPax,
    this.bookingBlockStart,
    this.bookingBlockEnd,
    this.bookingTimeGap,
    this.deactivateAt,
    this.activateBonbon,
    this.contactlessPayment,
    this.cashPayment,
    this.paymentStrategy,
    this.allowTakeAway,
    this.allowDelivery,
    this.autoAcceptSession,
    this.reservationFeature,
    this.withdrawalSystem,
    this.outletOffset,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.companyId,
  });

  dynamic address;
  String? id;
  String? name;
  String? email;
  String? phone;
  String? description;
  String? receiptTagLine;
  bool? receiptShowPhone;
  bool? receiptShowEmail;
  String? receiptDisplayAddress;
  bool? bookingEnable;
  bool? bookingJoinTable;
  bool? bookingOverPax;
  dynamic bookingBlockStart;
  dynamic bookingBlockEnd;
  int? bookingTimeGap;
  dynamic deactivateAt;
  bool? activateBonbon;
  bool? contactlessPayment;
  bool? cashPayment;
  String? paymentStrategy;
  bool? allowTakeAway;
  bool? allowDelivery;
  bool? autoAcceptSession;
  String? reservationFeature;
  String? withdrawalSystem;
  int? outletOffset;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentId;
  String? companyId;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        address: json["address"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        description: json["description"],
        receiptTagLine: json["receipt_tag_line"],
        receiptShowPhone: json["receipt_show_phone"],
        receiptShowEmail: json["receipt_show_email"],
        receiptDisplayAddress: json["receipt_display_address"],
        bookingEnable: json["booking_enable"],
        bookingJoinTable: json["booking_join_table"],
        bookingOverPax: json["booking_over_pax"],
        bookingBlockStart: json["booking_block_start"],
        bookingBlockEnd: json["booking_block_end"],
        bookingTimeGap: json["booking_time_gap"],
        deactivateAt: json["deactivate_at"],
        activateBonbon: json["activate_bonbon"],
        contactlessPayment: json["contactless_payment"],
        cashPayment: json["cash_payment"],
        paymentStrategy: json["payment_strategy"],
        allowTakeAway: json["allow_take_away"],
        allowDelivery: json["allow_delivery"],
        autoAcceptSession: json["auto_accept_session"],
        reservationFeature: json["reservation_feature"],
        withdrawalSystem: json["withdrawal_system"],
        outletOffset: json["outlet_offset"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "description": description,
        "receipt_tag_line": receiptTagLine,
        "receipt_show_phone": receiptShowPhone,
        "receipt_show_email": receiptShowEmail,
        "receipt_display_address": receiptDisplayAddress,
        "booking_enable": bookingEnable,
        "booking_join_table": bookingJoinTable,
        "booking_over_pax": bookingOverPax,
        "booking_block_start": bookingBlockStart,
        "booking_block_end": bookingBlockEnd,
        "booking_time_gap": bookingTimeGap,
        "deactivate_at": deactivateAt,
        "activate_bonbon": activateBonbon,
        "contactless_payment": contactlessPayment,
        "cash_payment": cashPayment,
        "payment_strategy": paymentStrategy,
        "allow_take_away": allowTakeAway,
        "allow_delivery": allowDelivery,
        "auto_accept_session": autoAcceptSession,
        "reservation_feature": reservationFeature,
        "withdrawal_system": withdrawalSystem,
        "outlet_offset": outletOffset,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "company_id": companyId,
      };
}
