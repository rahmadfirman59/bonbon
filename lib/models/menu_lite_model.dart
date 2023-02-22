// To parse this JSON data, do
//
//     final menuLiteModels = menuLiteModelsFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

MenuLiteModels menuLiteModelsFromJson(String str) =>
    MenuLiteModels.fromJson(json.decode(str));

String menuLiteModelsToJson(MenuLiteModels data) => json.encode(data.toJson());

class MenuLiteModels {
  MenuLiteModels({
    this.categories,
    this.menus,
    this.id,
    this.name,
    this.outletOffset,
    this.description,
    this.contactlessPayment,
    this.cashPayment,
    this.hours,
  });

  List<MenuLiteModelsCategory>? categories;
  List<Menu>? menus;
  String? id;
  String? name;
  int? outletOffset;
  String? description;
  bool? contactlessPayment;
  bool? cashPayment;
  List<dynamic>? hours;

  factory MenuLiteModels.fromJson(Map<String, dynamic> json) => MenuLiteModels(
        categories: json["categories"] == null
            ? []
            : List<MenuLiteModelsCategory>.from(json["categories"]!
                .map((x) => MenuLiteModelsCategory.fromJson(x))),
        menus: json["menus"] == null
            ? []
            : List<Menu>.from(json["menus"]!.map((x) => Menu.fromJson(x))),
        id: json["id"],
        name: json["name"],
        outletOffset: json["outlet_offset"],
        description: json["description"],
        contactlessPayment: json["contactless_payment"],
        cashPayment: json["cash_payment"],
        hours: json["hours"] == null
            ? []
            : List<dynamic>.from(json["hours"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "menus": menus == null
            ? []
            : List<dynamic>.from(menus!.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "outlet_offset": outletOffset,
        "description": description,
        "contactless_payment": contactlessPayment,
        "cash_payment": cashPayment,
        "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x)),
      };
}

class MenuLiteModelsCategory {
  MenuLiteModelsCategory({
    this.id,
    this.master,
  });

  String? id;
  PurpleMaster? master;

  factory MenuLiteModelsCategory.fromJson(Map<String, dynamic> json) =>
      MenuLiteModelsCategory(
        id: json["id"],
        master: json["master"] == null
            ? null
            : PurpleMaster.fromJson(json["master"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "master": master?.toJson(),
      };
}

class PurpleMaster {
  PurpleMaster({
    this.id,
    this.name,
    this.order,
  });

  String? id;
  String? name;
  int? order;

  factory PurpleMaster.fromJson(Map<String, dynamic> json) => PurpleMaster(
        id: json["id"],
        name: json["name"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order": order,
      };
}

class Menu {
  Menu({
    this.categories,
    this.images,
    this.modifiers,
    this.master,
    this.id,
    this.price,
    this.status,
    this.fullName,
  });

  List<MenuCategory>? categories;
  List<Image>? images;
  List<Modifier>? modifiers;
  MenuMaster? master;
  String? id;
  int? price;
  Status? status;
  String? fullName;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        categories: json["categories"] == null
            ? []
            : List<MenuCategory>.from(
                json["categories"]!.map((x) => MenuCategory.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        modifiers: json["modifiers"] == null
            ? []
            : List<Modifier>.from(
                json["modifiers"]!.map((x) => Modifier.fromJson(x))),
        master:
            json["master"] == null ? null : MenuMaster.fromJson(json["master"]),
        id: json["id"],
        price: json["price"],
        status: statusValues.map[json["status"]]!,
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "modifiers": modifiers == null
            ? []
            : List<dynamic>.from(modifiers!.map((x) => x.toJson())),
        "master": master?.toJson(),
        "id": id,
        "price": price,
        "status": statusValues.reverse[status],
        "fullName": fullName,
      };
}

class MenuCategory {
  MenuCategory({
    this.master,
    this.id,
  });

  FluffyMaster? master;
  String? id;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
        master: json["master"] == null
            ? null
            : FluffyMaster.fromJson(json["master"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "master": master?.toJson(),
        "id": id,
      };
}

class FluffyMaster {
  FluffyMaster({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory FluffyMaster.fromJson(Map<String, dynamic> json) => FluffyMaster(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
        id: json["id"],
        original: json["original"],
        thumb: json["thumb"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original": original,
        "thumb": thumb,
        "type": typeValues.reverse[type],
      };
}

enum Type { IMAGE }

final typeValues = EnumValues({"image": Type.IMAGE});

class MenuMaster {
  MenuMaster({
    this.id,
    this.description,
  });

  String? id;
  String? description;

  factory MenuMaster.fromJson(Map<String, dynamic> json) => MenuMaster(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}

class Modifier {
  Modifier({
    this.master,
    this.id,
    this.status,
  });

  ModifierMaster? master;
  String? id;
  Status? status;

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
        master: json["master"] == null
            ? null
            : ModifierMaster.fromJson(json["master"]),
        id: json["id"],
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toJson() => {
        "master": master?.toJson(),
        "id": id,
        "status": statusValues.reverse[status],
      };
}

class ModifierMaster {
  ModifierMaster({
    this.id,
    this.name,
    this.price,
  });

  String? id;
  String? name;
  int? price;

  factory ModifierMaster.fromJson(Map<String, dynamic> json) => ModifierMaster(
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

enum Status { AVAILABLE, SOLD_OUT }

final statusValues =
    EnumValues({"available": Status.AVAILABLE, "sold_out": Status.SOLD_OUT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
