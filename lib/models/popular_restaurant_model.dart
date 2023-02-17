// To parse this JSON data, do
//
//     final popularRestaurantModel = popularRestaurantModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, constant_identifier_names, unnecessary_null_comparison, prefer_conditional_assignment, unnecessary_new

import 'dart:convert';

PopularRestaurantModel popularRestaurantModelFromJson(String str) =>
    PopularRestaurantModel.fromJson(json.decode(str));

String popularRestaurantModelToJson(PopularRestaurantModel data) =>
    json.encode(data.toJson());

class PopularRestaurantModel {
  PopularRestaurantModel({
    this.pagination,
    this.data,
  });

  Pagination? pagination;
  List<Datum>? data;

  factory PopularRestaurantModel.fromJson(Map<String, dynamic> json) =>
      PopularRestaurantModel(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination!.toJson(),
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.address,
    this.images,
    this.cuisines,
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

  Address? address;
  List<Image>? images;
  List<Cuisine>? cuisines;
  String? id;
  String? name;
  String? email;
  String? phone;
  String? description;
  String? receiptTagLine;
  bool? receiptShowPhone;
  bool? receiptShowEmail;
  ReceiptDisplayAddress? receiptDisplayAddress;
  bool? bookingEnable;
  bool? bookingJoinTable;
  bool? bookingOverPax;
  String? bookingBlockStart;
  String? bookingBlockEnd;
  int? bookingTimeGap;
  dynamic deactivateAt;
  bool? activateBonbon;
  bool? contactlessPayment;
  bool? cashPayment;
  PaymentStrategy? paymentStrategy;
  bool? allowTakeAway;
  bool? allowDelivery;
  bool? autoAcceptSession;
  ReservationFeature? reservationFeature;
  WithdrawalSystem? withdrawalSystem;
  int? outletOffset;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? companyId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        cuisines: json["cuisines"] == null
            ? null
            : List<Cuisine>.from(
                json["cuisines"].map((x) => Cuisine.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        description: json["description"] == null ? null : json["description"],
        receiptTagLine:
            json["receipt_tag_line"] == null ? null : json["receipt_tag_line"],
        receiptShowPhone: json["receipt_show_phone"] == null
            ? null
            : json["receipt_show_phone"],
        receiptShowEmail: json["receipt_show_email"] == null
            ? null
            : json["receipt_show_email"],
        receiptDisplayAddress: json["receipt_display_address"] == null
            ? null
            : receiptDisplayAddressValues.map[json["receipt_display_address"]],
        bookingEnable:
            json["booking_enable"] == null ? null : json["booking_enable"],
        bookingJoinTable: json["booking_join_table"] == null
            ? null
            : json["booking_join_table"],
        bookingOverPax:
            json["booking_over_pax"] == null ? null : json["booking_over_pax"],
        bookingBlockStart: json["booking_block_start"] == null
            ? null
            : json["booking_block_start"],
        bookingBlockEnd: json["booking_block_end"] == null
            ? null
            : json["booking_block_end"],
        bookingTimeGap:
            json["booking_time_gap"] == null ? null : json["booking_time_gap"],
        deactivateAt: json["deactivate_at"],
        activateBonbon:
            json["activate_bonbon"] == null ? null : json["activate_bonbon"],
        contactlessPayment: json["contactless_payment"] == null
            ? null
            : json["contactless_payment"],
        cashPayment: json["cash_payment"] == null ? null : json["cash_payment"],
        paymentStrategy: json["payment_strategy"] == null
            ? null
            : paymentStrategyValues.map[json["payment_strategy"]],
        allowTakeAway:
            json["allow_take_away"] == null ? null : json["allow_take_away"],
        allowDelivery:
            json["allow_delivery"] == null ? null : json["allow_delivery"],
        autoAcceptSession: json["auto_accept_session"] == null
            ? null
            : json["auto_accept_session"],
        reservationFeature: json["reservation_feature"] == null
            ? null
            : reservationFeatureValues.map[json["reservation_feature"]],
        withdrawalSystem: json["withdrawal_system"] == null
            ? null
            : withdrawalSystemValues.map[json["withdrawal_system"]],
        outletOffset:
            json["outlet_offset"] == null ? null : json["outlet_offset"],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address!.toJson(),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "cuisines": cuisines == null
            ? null
            : List<dynamic>.from(cuisines!.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "description": description == null ? null : description,
        "receipt_tag_line": receiptTagLine == null ? null : receiptTagLine,
        "receipt_show_phone":
            receiptShowPhone == null ? null : receiptShowPhone,
        "receipt_show_email":
            receiptShowEmail == null ? null : receiptShowEmail,
        "receipt_display_address": receiptDisplayAddress == null
            ? null
            : receiptDisplayAddressValues.reverse[receiptDisplayAddress],
        "booking_enable": bookingEnable == null ? null : bookingEnable,
        "booking_join_table":
            bookingJoinTable == null ? null : bookingJoinTable,
        "booking_over_pax": bookingOverPax == null ? null : bookingOverPax,
        "booking_block_start":
            bookingBlockStart == null ? null : bookingBlockStart,
        "booking_block_end": bookingBlockEnd == null ? null : bookingBlockEnd,
        "booking_time_gap": bookingTimeGap == null ? null : bookingTimeGap,
        "deactivate_at": deactivateAt,
        "activate_bonbon": activateBonbon == null ? null : activateBonbon,
        "contactless_payment":
            contactlessPayment == null ? null : contactlessPayment,
        "cash_payment": cashPayment == null ? null : cashPayment,
        "payment_strategy": paymentStrategy == null
            ? null
            : paymentStrategyValues.reverse[paymentStrategy],
        "allow_take_away": allowTakeAway == null ? null : allowTakeAway,
        "allow_delivery": allowDelivery == null ? null : allowDelivery,
        "auto_accept_session":
            autoAcceptSession == null ? null : autoAcceptSession,
        "reservation_feature": reservationFeature == null
            ? null
            : reservationFeatureValues.reverse[reservationFeature],
        "withdrawal_system": withdrawalSystem == null
            ? null
            : withdrawalSystemValues.reverse[withdrawalSystem],
        "outlet_offset": outletOffset == null ? null : outletOffset,
        "status": status == null ? null : statusValues.reverse[status],
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "parent_id": parentId == null ? null : parentId,
        "company_id": companyId == null ? null : companyId,
      };
}

class Address {
  Address({
    this.areaCode,
    this.line1,
    this.line2,
    this.full,
    this.postcode,
    this.latitude,
    this.longitude,
    this.outletOffset,
  });

  String? areaCode;
  String? line1;
  String? line2;
  String? full;
  String? postcode;
  String? latitude;
  String? longitude;
  int? outletOffset;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        areaCode: json["area_code"] == null ? null : json["area_code"],
        line1: json["line1"] == null ? null : json["line1"],
        line2: json["line2"] == null ? null : json["line2"],
        full: json["full"] == null ? null : json["full"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        outletOffset:
            json["outlet_offset"] == null ? null : json["outlet_offset"],
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode == null ? null : areaCode,
        "line1": line1 == null ? null : line1,
        "line2": line2 == null ? null : line2,
        "full": full == null ? null : full,
        "postcode": postcode == null ? null : postcode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "outlet_offset": outletOffset == null ? null : outletOffset,
      };
}

class Cuisine {
  Cuisine({
    this.id,
    this.name,
    this.slug,
    this.parentId,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  dynamic parentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "parent_id": parentId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Image {
  Image({
    this.id,
    this.original,
    this.thumb,
    this.type,
  });

  String? id;
  String? original;
  String? thumb;
  Type? type;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] == null ? null : json["id"],
        original: json["original"] == null ? null : json["original"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "original": original == null ? null : original,
        "thumb": thumb == null ? null : thumb,
        "type": type == null ? null : typeValues.reverse[type],
      };
}

enum Type { LOGO, AVATAR, BACKGROUND }

final typeValues = EnumValues(
    {"avatar": Type.AVATAR, "background": Type.BACKGROUND, "logo": Type.LOGO});

enum PaymentStrategy { PAY_FIRTS, PAY_LATER }

final paymentStrategyValues = EnumValues({
  "pay_firts": PaymentStrategy.PAY_FIRTS,
  "pay_later": PaymentStrategy.PAY_LATER
});

enum ReceiptDisplayAddress { FULL, SHORT }

final receiptDisplayAddressValues = EnumValues(
    {"full": ReceiptDisplayAddress.FULL, "short": ReceiptDisplayAddress.SHORT});

enum ReservationFeature { DISABLED, AUTO_ACCEPT, MANUAL_ACCEPT }

final reservationFeatureValues = EnumValues({
  "auto_accept": ReservationFeature.AUTO_ACCEPT,
  "disabled": ReservationFeature.DISABLED,
  "manual_accept": ReservationFeature.MANUAL_ACCEPT
});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

enum WithdrawalSystem { MANUAL, WEEKLY }

final withdrawalSystemValues = EnumValues(
    {"manual": WithdrawalSystem.MANUAL, "weekly": WithdrawalSystem.WEEKLY});

class Pagination {
  Pagination({
    this.totalCount,
    this.pageCount,
    this.page,
    this.perPage,
  });

  int? totalCount;
  int? pageCount;
  int? page;
  int? perPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json["total_count"] == null ? null : json["total_count"],
        pageCount: json["page_count"] == null ? null : json["page_count"],
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount == null ? null : totalCount,
        "page_count": pageCount == null ? null : pageCount,
        "page": page == null ? null : page,
        "per_page": perPage == null ? null : perPage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
