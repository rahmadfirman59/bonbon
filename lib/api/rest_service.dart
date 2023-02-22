// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:bonbon_new/models/cart_item_mode.dart';
import 'package:bonbon_new/models/check_table_model.dart';
import 'package:bonbon_new/models/check_table_session_model.dart';
import 'package:bonbon_new/models/create_session_model.dart';
import 'package:bonbon_new/models/login_model.dart';
import 'package:bonbon_new/models/me_include_items_model.dart';
import 'package:bonbon_new/models/me_model.dart';
import 'package:bonbon_new/models/menu_lite_model.dart';
import 'package:bonbon_new/models/nearby_restaurant_model.dart';
import 'package:bonbon_new/models/popular_restaurant_model.dart';
import 'package:bonbon_new/models/session_summary_model.dart';
import 'package:bonbon_new/models/table_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestServices {
  static var client = Dio();
  static var baseUrl = "https://api-demo.bonbon.co.id/";
  static var pwa = "pwa/";

  static Future<bool> loginOtp(Map<String, dynamic> body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
    };
    var response = await client.post(
      baseUrl + pwa + 'auth/login-otp',
      data: body,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 204) {
      var str = json.encode(response.data);
      debugPrint('Request OTP : ${str.length}');
      return true;
    } else {
      debugPrint('Request OTP fail : ${response.data}');
      return false;
    }
  }

  static Future<LoginModel?> login(Map<String, dynamic> body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
    };
    var response = await client.post(
      baseUrl + pwa + 'auth/login',
      data: body,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Login Model : ${str.toString()}');
      return loginModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Login Model : ${str.toString()}');
      return loginModelFromJson(str);
    }
  }

  static Future<MeModel?> fetchMe(String? token) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl + pwa + 'auth/me',
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Me Model : ${str.toString()}');
      return meModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Md Model : ${str.toString()}');
      return meModelFromJson(str);
    }
  }

  static Future<MeIncludeItemModels?> fetchMeIncludeItem(String? token) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl + pwa + 'order/me?include=items',
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Me Model : ${str.toString()}');
      return meIncludeItemModelsFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Md Model : ${str.toString()}');
      return meIncludeItemModelsFromJson(str);
    }
  }

  static Future<PopularRestaurantModel?> fetchPopularRestaurant() async {
    var response = await client.get(
      baseUrl + "pwa/outlet?include=images",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('PopularRestaurantModel : ${str.length}');
      return popularRestaurantModelFromJson(str);
    } else {
      debugPrint('PopularRestaurantModel fail : ${response.data}');
      return null;
    }
  }

  static Future<NearbyRestaurantModel?> fetchNearbyRestaurant() async {
    var response = await client.get(
      "{$baseUrl}pwa/outlet/nearby?latitude=-7.895467&longitude=112.666009&include=province,city,categories.category",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('NearbyRestaurantModel : ${str.length}');
      return nearbyRestaurantModelFromJson(str);
    } else {
      debugPrint('NearbyRestaurantModel fail : ${response.data}');
      return null;
    }
  }

  static Future<CheckTableModel?> checkTable(
      String? token, String? tableId) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl + pwa + 'search/' + tableId! + "/check",
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Check Table Model : ${str.toString()}');
      return checkTableModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Check Table Model : ${str.toString()}');
      return checkTableModelFromJson(str);
    }
  }

  static Future<List<CheckTableSessionModel>> getTableSession(
      String? token, String? tableId) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl +
          pwa +
          'table/' +
          tableId! +
          "/session?include=members.user,orders.variant.images,leade",
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Table Session Status Model : ${str.toString()}');
      return checkTableSessionModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Table Session Status Model : ${str.toString()}');
      return checkTableSessionModelFromJson(str);
    }
  }

  static Future<TableModel?> getTable(String? token, String? tableId) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl + pwa + 'table/' + tableId! + "?include=group,outlet",
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Table Model : ${str.toString()}');
      return tableModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Table Model : ${str.toString()}');
      return tableModelFromJson(str);
    }
  }

  static Future<CreateSessionModel?> createSession(
      String? token, Map<String, dynamic> body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.post(
      baseUrl + pwa + 'session',
      data: body,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Create Session : ${str.toString()}');
      return createSessionModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Create Session Model : ${response.toString()}');
      return createSessionModelFromJson(str);
    }
  }

  static Future<MenuLiteModels?> fetchOutletMenuLite(
      String? token, String? outletId) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl + pwa + 'outlet/' + outletId! + "/menu-lite",
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Menu Lite Model : ${str.toString()}');
      return menuLiteModelsFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Menu Lite Model: ${str.toString()}');
      return menuLiteModelsFromJson(str);
    }
  }

  static Future<CartItemModels?> fetchCartItem(String? token) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl +
          pwa +
          'cart-items?include=items,items.item,user,items.modifiers,items.members',
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Cart Item Model : ${str.toString()}');
      return cartItemModelsFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Cart ItemModel: ${str.toString()}');
      return cartItemModelsFromJson(str);
    }
  }

  static Future<SessionSummaryModel?> fetchSessionSummary(String? token) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.get(
      baseUrl +
          pwa +
          'session/summary?include=members.user,orders.item,orders.members,table,outlet&type=active',
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      var str = json.encode(response.data);
      debugPrint('Session Summary Model : ${str.toString()}');
      return sessionSummaryModelFromJson(str);
    } else {
      var str = json.encode(response.data);
      debugPrint('Session Summary Model: ${str.toString()}');
      return sessionSummaryModelFromJson(str);
    }
  }

  static Future<bool?> addToCart(
      String? token, Map<String, dynamic> body) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      "Authorization": "Bearer " + token!
    };
    var response = await client.post(
      baseUrl + pwa + 'cart-items',
      data: body,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      // var str = json.encode(response.data);
      debugPrint('Add to cart success:');
      return true;
    } else {
      // var str = json.encode(response.data);
      debugPrint('Add to cart fail  ${response.toString()}');
      return false;
    }
  }
}
