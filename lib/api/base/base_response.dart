// ignore_for_file: prefer_interpolation_to_compose_strings, body_might_complete_normally_nullable

import 'dart:convert';

import 'package:bonbon_new/api/const/api_endpoint.dart';
import 'package:bonbon_new/api/netowrk_manager.dart';
import 'package:dio/dio.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class BaseResponse<T> {
  static BaseResponse myBase = BaseResponse();

  Future<dynamic> postData({
    required String path,
    String param = '',
    Map<String, dynamic>? data,
    Function(String)? fromJson,
    String token = '',
  }) async {
    try {
      if (token == "") {
        NetworkManager.response = await NetworkManager.dio.post(
          ApiEndpoint.BASE_URL + path + param,
          data: data,
        );
      } else {
        Map<String, dynamic> headers = {
          'Accept': 'application/json',
          "Authorization": "Bearer " + token
        };
        NetworkManager.response = await NetworkManager.dio.post(
          ApiEndpoint.BASE_URL + path + param,
          data: data,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );
      }

      if (NetworkManager.response.statusCode == 200) {
        var jsonString = json.encode(NetworkManager.response.data);
        if (fromJson != null) {
          return fromJson(jsonString);
        } else {
          return true;
        }
      } else if (NetworkManager.response.statusCode == 204) {
        return true;
      } else if (NetworkManager.response.statusCode == 400) {
        return false;
      } else if (NetworkManager.response.statusCode == 422) {
        return false;
      } else if (NetworkManager.response.statusCode == 500) {
        return false;
      } else {
        EasyLoading.showInfo(NetworkManager.response.data);
        return null;
      }
    } catch (e) {
      EasyLoading.showError("Something wrong");
      return e.toString();
    }
  }

  Future<T?> getData({
    required String path,
    String param = '',
    required Function(String) fromJson,
    String token = '',
  }) async {
    try {
      if (token == "") {
        NetworkManager.response = await NetworkManager.dio.get(
          ApiEndpoint.BASE_URL + path + param,
        );
      } else {
        Map<String, dynamic> headers = {
          'Accept': 'application/json',
          "Authorization": "Bearer " + token
        };
        NetworkManager.response = await NetworkManager.dio.get(
          ApiEndpoint.BASE_URL + path + param,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );
      }

      if (NetworkManager.response.statusCode == 200) {
        var jsonString = json.encode(NetworkManager.response.data);
        return fromJson(jsonString);
      } else {
        EasyLoading.showInfo(NetworkManager.response.data);
        return null;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<dynamic> postImg({
    required String path,
    String param = '',
    FormData? data,
    Function(String)? fromJson,
  }) async {
    try {
      NetworkManager.response = await NetworkManager.dio.post(
        ApiEndpoint.BASE_URL + path + param,
        data: data,
      );

      if (NetworkManager.response.statusCode == 200) {
        var jsonString = json.encode(NetworkManager.response.data);
        if (fromJson != null) {
          return fromJson(jsonString);
        } else {
          return true;
        }
      } else {
        EasyLoading.showInfo(NetworkManager.response.data);
        return null;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
