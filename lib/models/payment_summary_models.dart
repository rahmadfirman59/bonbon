// To parse this JSON data, do
//
//     final paymentSummaryModels = paymentSummaryModelsFromJson(jsonString);

import 'dart:convert';

PaymentSummaryModels paymentSummaryModelsFromJson(String str) =>
    PaymentSummaryModels.fromJson(json.decode(str));

String paymentSummaryModelsToJson(PaymentSummaryModels data) =>
    json.encode(data.toJson());

class PaymentSummaryModels {
  PaymentSummaryModels({
    this.restaurant,
    this.table,
    this.order,
    this.isTakeAway,
  });

  Restaurant? restaurant;
  Table? table;
  Order? order;
  bool? isTakeAway;

  factory PaymentSummaryModels.fromJson(Map<String, dynamic> json) =>
      PaymentSummaryModels(
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromJson(json["restaurant"]),
        table: json["table"] == null ? null : Table.fromJson(json["table"]),
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        isTakeAway: json["isTakeAway"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant": restaurant?.toJson(),
        "table": table?.toJson(),
        "order": order?.toJson(),
        "isTakeAway": isTakeAway,
      };
}

class Order {
  Order({
    this.id,
    this.number,
    this.time,
    this.taxRate,
    this.feeRate,
    this.tax,
    this.fee,
    this.discount,
    this.subTotal,
    this.grandTotal,
    this.discountRate,
    this.payCredit,
    this.payGateway,
    this.paymentMethod,
    this.status,
  });

  String? id;
  String? number;
  DateTime? time;
  String? taxRate;
  String? feeRate;
  double? tax;
  double? fee;
  int? discount;
  int? subTotal;
  double? grandTotal;
  String? discountRate;
  int? payCredit;
  int? payGateway;
  dynamic paymentMethod;
  String? status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        number: json["number"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        taxRate: json["tax_rate"],
        feeRate: json["fee_rate"],
        tax: json["tax"]?.toDouble(),
        fee: json["fee"]?.toDouble(),
        discount: json["discount"],
        subTotal: json["sub_total"],
        grandTotal: json["grand_total"]?.toDouble(),
        discountRate: json["discount_rate"],
        payCredit: json["pay_credit"],
        payGateway: json["pay_gateway"],
        paymentMethod: json["payment_method"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "time": time?.toIso8601String(),
        "tax_rate": taxRate,
        "fee_rate": feeRate,
        "tax": tax,
        "fee": fee,
        "discount": discount,
        "sub_total": subTotal,
        "grand_total": grandTotal,
        "discount_rate": discountRate,
        "pay_credit": payCredit,
        "pay_gateway": payGateway,
        "payment_method": paymentMethod,
        "status": status,
      };
}

class Restaurant {
  Restaurant({
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

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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
