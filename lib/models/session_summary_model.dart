// To parse this JSON data, do
//
//     final sessionSummaryModel = sessionSummaryModelFromJson(jsonString);

import 'dart:convert';

SessionSummaryModel sessionSummaryModelFromJson(String str) =>
    SessionSummaryModel.fromJson(json.decode(str));

String sessionSummaryModelToJson(SessionSummaryModel data) =>
    json.encode(data.toJson());

class SessionSummaryModel {
  SessionSummaryModel({
    this.outlet,
    this.table,
    this.members,
    this.orders,
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

  Outlet? outlet;
  Table? table;
  List<Member>? members;
  List<dynamic>? orders;
  String? id;
  String? number;
  int? pax;
  String? type;
  String? note;
  int? grossTotal;
  dynamic rounding;
  int? discount;
  int? charge;
  dynamic tax;
  dynamic refund;
  dynamic netTotal;
  dynamic paymentAmount;
  dynamic paymentChange;
  dynamic paymentMethod;
  dynamic paymentNote;
  String? status;
  dynamic completedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? allowRequestBill;

  factory SessionSummaryModel.fromJson(Map<String, dynamic> json) =>
      SessionSummaryModel(
        outlet: json["outlet"] == null ? null : Outlet.fromJson(json["outlet"]),
        table: json["table"] == null ? null : Table.fromJson(json["table"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
        orders: json["orders"] == null
            ? []
            : List<dynamic>.from(json["orders"]!.map((x) => x)),
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
        "outlet": outlet?.toJson(),
        "table": table?.toJson(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "orders":
            orders == null ? [] : List<dynamic>.from(orders!.map((x) => x)),
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

  User? user;
  String? id;
  DateTime? startedAt;
  dynamic endedAt;
  bool? isLeader;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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

class User {
  User({
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
  String? phone;
  DateTime? lastLoginAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic credit;
  dynamic birthdate;
  dynamic gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        address: json["address"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        lastLoginAt: json["last_login_at"] == null
            ? null
            : DateTime.parse(json["last_login_at"]),
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
        "last_login_at": lastLoginAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "credit": credit,
        "birthdate": birthdate,
        "gender": gender,
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
  dynamic email;
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class Table {
  Table({
    this.id,
    this.name,
    this.pax,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  int? pax;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        id: json["id"],
        name: json["name"],
        pax: json["pax"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pax": pax,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
