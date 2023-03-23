// To parse this JSON data, do
//
//     final orderIncludeItemModel = orderIncludeItemModelFromJson(jsonString);

import 'dart:convert';

OrderIncludeItemModel orderIncludeItemModelFromJson(String str) =>
    OrderIncludeItemModel.fromJson(json.decode(str));

String orderIncludeItemModelToJson(OrderIncludeItemModel data) =>
    json.encode(data.toJson());

class OrderIncludeItemModel {
  OrderIncludeItemModel({
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
    this.total,
    this.table,
    this.members,
    this.orders,
    this.fees,
  });

  String? id;
  String? number;
  int? pax;
  String? type;
  String? note;
  int? grossTotal;
  dynamic rounding;
  int? discount;
  int? charge;
  double? tax;
  dynamic refund;
  double? netTotal;
  dynamic paymentAmount;
  dynamic paymentChange;
  dynamic paymentMethod;
  dynamic paymentNote;
  String? status;
  dynamic completedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? allowRequestBill;
  int? total;
  Table? table;
  List<Member>? members;
  List<Order>? orders;
  List<Fee>? fees;

  factory OrderIncludeItemModel.fromJson(Map<String, dynamic> json) =>
      OrderIncludeItemModel(
        id: json["id"],
        number: json["number"],
        pax: json["pax"],
        type: json["type"],
        note: json["note"],
        grossTotal: json["gross_total"],
        rounding: json["rounding"],
        discount: json["discount"],
        charge: json["charge"],
        tax: json["tax"]?.toDouble(),
        refund: json["refund"],
        netTotal: json["net_total"]?.toDouble(),
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
        total: json["total"],
        table: json["table"] == null ? null : Table.fromJson(json["table"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
        orders: json["orders"] == null
            ? []
            : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
        fees: json["fees"] == null
            ? []
            : List<Fee>.from(json["fees"]!.map((x) => Fee.fromJson(x))),
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
        "total": total,
        "table": table?.toJson(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "orders": orders == null
            ? []
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
        "fees": fees == null
            ? []
            : List<dynamic>.from(fees!.map((x) => x.toJson())),
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

class Order {
  Order({
    this.name,
    this.orderId,
    this.qty,
    this.status,
    this.total,
    this.type,
    this.myTotal,
    this.note,
    this.updatedAt,
    this.modifiers,
    this.members,
  });

  String? name;
  String? orderId;
  int? qty;
  String? status;
  int? total;
  String? type;
  int? myTotal;
  String? note;
  DateTime? updatedAt;
  List<dynamic>? modifiers;
  List<Table>? members;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        name: json["name"],
        orderId: json["order_id"],
        qty: json["qty"],
        status: json["status"],
        total: json["total"],
        type: json["type"],
        myTotal: json["my_total"],
        note: json["note"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        modifiers: json["modifiers"] == null
            ? []
            : List<dynamic>.from(json["modifiers"]!.map((x) => x)),
        members: json["members"] == null
            ? []
            : List<Table>.from(json["members"]!.map((x) => Table.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "order_id": orderId,
        "qty": qty,
        "status": status,
        "total": total,
        "type": type,
        "my_total": myTotal,
        "note": note,
        "updated_at": updatedAt?.toIso8601String(),
        "modifiers": modifiers == null
            ? []
            : List<dynamic>.from(modifiers!.map((x) => x)),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
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
