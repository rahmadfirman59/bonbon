// ignore_for_file: constant_identifier_names

abstract class ApiEndpoint {
  static const BASE_URL = 'https://api-demo.bonbon.co.id/pwa/';
  static const REQUEST_OTP = 'auth/login-otp';
  static const OTP_LOGIN = 'auth/login';
  static const AUTH_ME = 'auth/me';
  static const POPULAR_RESTAURANT = 'outlet?include=images';
  static const CHECK_TABLE = 'search/';
}
