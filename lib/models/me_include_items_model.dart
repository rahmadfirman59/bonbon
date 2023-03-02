// To parse this JSON data, do
//
//     final meIncludeItemModels = meIncludeItemModelsFromJson(jsonString);

import 'dart:convert';

MeIncludeItemModels meIncludeItemModelsFromJson(String str) =>
    MeIncludeItemModels.fromJson(json.decode(str));

String meIncludeItemModelsToJson(MeIncludeItemModels data) =>
    json.encode(data.toJson());

class MeIncludeItemModels {
  MeIncludeItemModels({
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
    this.fees,
    this.myGross,
    this.myNet,
    this.outlet,
    this.sumTax,
    this.sumCharge,
    this.sumDiscount,
    this.table,
    this.members,
    this.orders,
  });

  String? id;
  String? number;
  int? pax;
  String? type;
  String? note;
  int? grossTotal;
  dynamic rounding;
  int? discount;
  String? charge;
  String? tax;
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
  List<Fee>? fees;
  int? myGross;
  int? myNet;
  Outlet? outlet;
  dynamic sumTax;
  dynamic sumCharge;
  dynamic sumDiscount;
  Table? table;
  List<Member>? members;
  List<dynamic>? orders;

  factory MeIncludeItemModels.fromJson(Map<String, dynamic> json) =>
      MeIncludeItemModels(
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
        fees: json["fees"] == null
            ? []
            : List<Fee>.from(json["fees"]!.map((x) => Fee.fromJson(x))),
        myGross: json["my_gross"],
        myNet: json["my_net"],
        outlet: json["outlet"] == null ? null : Outlet.fromJson(json["outlet"]),
        sumTax: json["sum_tax"],
        sumCharge: json["sum_charge"],
        sumDiscount: json["sum_discount"],
        table: json["table"] == null ? null : Table.fromJson(json["table"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
        orders: json["orders"] == null
            ? []
            : List<dynamic>.from(json["orders"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
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
        "fees": fees == null
            ? []
            : List<dynamic>.from(fees!.map((x) => x.toJson())),
        "my_gross": myGross,
        "my_net": myNet,
        "outlet": outlet?.toJson(),
        "sum_tax": sumTax,
        "sum_charge": sumCharge,
        "sum_discount": sumDiscount,
        "table": table?.toJson(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "orders":
            orders == null ? [] : List<dynamic>.from(orders!.map((x) => x)),
      };
}

class Fee {
  Fee({
    this.id,
    this.type,
    this.name,
    this.amount,
    this.amountType,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? type;
  String? name;
  int? amount;
  String? amountType;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        amount: json["amount"],
        amountType: json["amount_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "amount": amount,
        "amount_type": amountType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Member {
  Member({
    this.id,
    this.name,
    this.phone,
    this.startedAt,
    this.endedAt,
    this.isLeader,
    this.status,
  });

  String? id;
  String? name;
  String? phone;
  DateTime? startedAt;
  dynamic endedAt;
  bool? isLeader;
  String? status;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        startedAt: json["started_at"] == null
            ? null
            : DateTime.parse(json["started_at"]),
        endedAt: json["ended_at"],
        isLeader: json["is_leader"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "started_at": startedAt?.toIso8601String(),
        "ended_at": endedAt,
        "is_leader": isLeader,
        "status": status,
      };
}

class Outlet {
  Outlet({
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
  });

  String? id;
  String? name;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
