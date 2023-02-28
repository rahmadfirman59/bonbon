import 'dart:io';

import 'package:bonbon_new/api/dio/interceptors_wrap.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static late Response response;
  static var dio = appDio();

  static Dio appDio() {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorWrap());
    dio.options = BaseOptions(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    return dio;
  }
}
