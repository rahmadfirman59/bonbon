// To parse this JSON data, do
//
//     final cartItemModels = cartItemModelsFromJson(jsonString);

import 'dart:convert';

CartItemModels cartItemModelsFromJson(String str) =>
    CartItemModels.fromJson(json.decode(str));

String cartItemModelsToJson(CartItemModels data) => json.encode(data.toJson());

class CartItemModels {
  CartItemModels({
    this.user,
    this.items,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  User? user;
  List<ItemElement>? items;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CartItemModels.fromJson(Map<String, dynamic> json) => CartItemModels(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        items: json["items"] == null
            ? []
            : List<ItemElement>.from(
                json["items"]!.map((x) => ItemElement.fromJson(x))),
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class ItemElement {
  ItemElement({
    this.item,
    this.modifiers,
    this.members,
    this.id,
    this.qty,
    this.notes,
    this.group,
    this.isMenuSet,
    this.createdAt,
    this.updatedAt,
    this.promoId,
  });

  ItemItem? item;
  List<Modifier>? modifiers;
  List<Member>? members;
  String? id;
  int? qty;
  String? notes;
  bool? group;
  dynamic isMenuSet;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic promoId;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        item: json["item"] == null ? null : ItemItem.fromJson(json["item"]),
        modifiers: json["modifiers"] == null
            ? []
            : List<Modifier>.from(
                json["modifiers"]!.map((x) => Modifier.fromJson(x))),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
        id: json["id"],
        qty: json["qty"],
        notes: json["notes"],
        group: json["group"],
        isMenuSet: json["is_menu_set"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        promoId: json["promo_id"],
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
        "modifiers": modifiers == null
            ? []
            : List<dynamic>.from(modifiers!.map((x) => x.toJson())),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "id": id,
        "qty": qty,
        "notes": notes,
        "group": group,
        "is_menu_set": isMenuSet,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promo_id": promoId,
      };
}

class ItemItem {
  ItemItem({
    this.images,
    this.modifiers,
    this.id,
    this.name,
    this.sku,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.fullName,
  });

  List<Image>? images;
  List<Modifier>? modifiers;
  String? id;
  String? name;
  String? sku;
  int? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullName;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        modifiers: json["modifiers"] == null
            ? []
            : List<Modifier>.from(
                json["modifiers"]!.map((x) => Modifier.fromJson(x))),
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        price: json["price"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "modifiers": modifiers == null
            ? []
            : List<dynamic>.from(modifiers!.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "sku": sku,
        "price": price,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "fullName": fullName,
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
  String? type;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        original: json["original"],
        thumb: json["thumb"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original": original,
        "thumb": thumb,
        "type": type,
      };
}

class Modifier {
  Modifier({
    this.master,
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Master? master;
  String? id;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
        master: json["master"] == null ? null : Master.fromJson(json["master"]),
        id: json["id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "master": master?.toJson(),
        "id": id,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Master {
  Master({
    this.id,
    this.name,
    this.price,
  });

  String? id;
  String? name;
  int? price;

  factory Master.fromJson(Map<String, dynamic> json) => Master(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
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
