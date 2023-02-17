// To parse this JSON data, do
//
//     final nearbyRestaurantModel = nearbyRestaurantModelFromJson(jsonString);

import 'dart:convert';

NearbyRestaurantModel nearbyRestaurantModelFromJson(String str) =>
    NearbyRestaurantModel.fromJson(json.decode(str));

String nearbyRestaurantModelToJson(NearbyRestaurantModel data) =>
    json.encode(data.toJson());

class NearbyRestaurantModel {
  NearbyRestaurantModel({
    this.pagination,
    this.data,
  });

  Pagination? pagination;
  List<Datum>? data;

  factory NearbyRestaurantModel.fromJson(Map<String, dynamic> json) =>
      NearbyRestaurantModel(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.distance,
    this.address,
  });

  String? id;
  String? name;
  dynamic phone;
  dynamic email;
  double? distance;
  Address? address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        distance: json["distance"]?.toDouble(),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "distance": distance,
        "address": address?.toJson(),
      };
}

class Address {
  Address({
    this.id,
    this.type,
    this.label,
    this.contactName,
    this.contactPhone,
    this.line1,
    this.line2,
    this.postcode,
    this.latitude,
    this.longitude,
    this.addressDefault,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.areaCode,
    this.outletOffset,
  });

  String? id;
  String? type;
  dynamic label;
  dynamic contactName;
  dynamic contactPhone;
  String? line1;
  String? line2;
  String? postcode;
  String? latitude;
  String? longitude;
  bool? addressDefault;
  dynamic note;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? areaCode;
  int? outletOffset;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        type: json["type"],
        label: json["label"],
        contactName: json["contact_name"],
        contactPhone: json["contact_phone"],
        line1: json["line_1"],
        line2: json["line_2"],
        postcode: json["postcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        addressDefault: json["default"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        areaCode: json["area_code"],
        outletOffset: json["outlet_offset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "label": label,
        "contact_name": contactName,
        "contact_phone": contactPhone,
        "line_1": line1,
        "line_2": line2,
        "postcode": postcode,
        "latitude": latitude,
        "longitude": longitude,
        "default": addressDefault,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "area_code": areaCode,
        "outlet_offset": outletOffset,
      };
}

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
        totalCount: json["total_count"],
        pageCount: json["page_count"],
        page: json["page"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "page_count": pageCount,
        "page": page,
        "per_page": perPage,
      };
}
