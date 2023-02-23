// ignore_for_file: prefer_const_constructors

import 'package:bonbon_new/root.dart';
import 'package:bonbon_new/ui/auth/create_account.dart';
import 'package:bonbon_new/ui/auth/create_account_success.dart';
import 'package:bonbon_new/ui/auth/login.dart';
import 'package:bonbon_new/ui/auth/otp.dart';
import 'package:bonbon_new/ui/cart/cart.dart';
import 'package:bonbon_new/ui/home/home.dart';
import 'package:bonbon_new/ui/in_session/in_session.dart';
import 'package:bonbon_new/ui/in_session/session_pickfood.dart';
import 'package:bonbon_new/ui/in_session/session_share_qr.dart';
import 'package:bonbon_new/ui/inbox/inbox.dart';
import 'package:bonbon_new/ui/index.dart';
import 'package:bonbon_new/ui/restaurant/restaurant.dart';
import 'package:bonbon_new/ui/scan/scan.dart';
import 'package:bonbon_new/ui/session/choose_session.dart';
import 'package:bonbon_new/ui/session/create_session.dart';
import 'package:bonbon_new/ui/session/wating_page.dart';
import 'package:get/get.dart';

import 'routes_name.dart';

class AppRoute {
  static final page = [
    GetPage(
      name: RouteName.root,
      page: () => Root(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => Login(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => Home(),
    ),
    GetPage(
      name: RouteName.otp,
      page: () => Otp(),
    ),
    GetPage(
      name: RouteName.create_account,
      page: () => CreateAccount(),
    ),
    GetPage(
      name: RouteName.create_account_success,
      page: () => CreateAccounSuccess(),
    ),
    GetPage(
      name: RouteName.scan,
      page: () => Scan(),
    ),
    GetPage(
      name: RouteName.inbox,
      page: () => Inbox(),
    ),
    GetPage(
      name: RouteName.create_session,
      page: () => CreateSession(),
    ),
    GetPage(
      name: RouteName.choose_session,
      page: () => ChooseSession(),
    ),
    GetPage(
      name: RouteName.waiting_page,
      page: () => WaitingPage(),
    ),
    GetPage(
      name: RouteName.index,
      page: () => Index(),
    ),
    GetPage(
      name: RouteName.restaurant,
      page: () => Restaurant(),
    ),
    GetPage(
      name: RouteName.in_session,
      page: () => InSession(),
    ),
    GetPage(
      name: RouteName.session_share_qr,
      page: () => SessionShareQr(),
    ),
    GetPage(
      name: RouteName.session_pickfood,
      page: () => SessionPickFood(),
    ),
    GetPage(
      name: RouteName.cart_item,
      page: () => CartItem(),
    ),
  ];
}
