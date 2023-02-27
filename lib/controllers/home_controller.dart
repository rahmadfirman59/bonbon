// ignore_for_file: avoid_returning_null_for_void

import 'package:bonbon_new/api/base/base_response.dart';
import 'package:bonbon_new/api/const/api_endpoint.dart';
import 'package:bonbon_new/api/const/sim_error.dart';
import 'package:bonbon_new/api/rest_service.dart';
import 'package:bonbon_new/models/nearby_restaurant_model.dart';
import 'package:bonbon_new/models/popular_restaurant_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var popularRestaurantModel = PopularRestaurantModel().obs;
  var nearByRestaurantModel = NearbyRestaurantModel().obs;

  var currentIndex = 0.obs;
  var activeIndex = 0.obs;
  final imageUrl = [
    "https://media.istockphoto.com/id/1347663254/id/foto/happy-halloween-holiday-greeting-card-desain-teks-kaligrafi-tulisan-tangan-dengan-fall.webp?s=612x612&w=is&k=20&c=Mjx-ql-eZxAvi1bGNqyt89_nIYGEX9cN-ObiB_EaA5M=",
    "https://media.istockphoto.com/id/1179767112/id/foto/berbagai-labu-labu-dan-labu-berwarna-cerah.webp?s=612x612&w=is&k=20&c=mKB8GjoeknTSHTVJHQ38aRhCzHnbJjLbFjiRk7ToKQc=",
    "https://media.istockphoto.com/id/1251684125/id/foto/pengusaha-dan-tim-pengusaha-menunjuk-pada-pertemuan-grafik-untuk-merencanakan-strategi-untuk.webp?s=612x612&w=is&k=20&c=hwWl1I-G_7TtcjkDiXqFJDd6MSO-r7e1YkmVCD4ihec=",
    "https://media.istockphoto.com/id/1346684222/id/foto/selamat-ulang-tahun-render-3d-tipografi-berwarna-warni.webp?s=612x612&w=is&k=20&c=cc2TuD1YWRGatp9mveNOc8I3Sy6s1YkhD7ttD3-skO0="
  ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularRestaurant();
  }

  Future<void> fetchPopularRestaurant() async {
    var response = await RestServices.fetchPopularRestaurant();

    // if (response != null) {
    //   popularRestaurantModel.value = response;
    // } else {
    //   return null;
    // }
    await BaseResponse<PopularRestaurantModel>()
        .getData(
          path: ApiEndpoint.POPULAR_RESTAURANT,
          fromJson: popularRestaurantModelFromJson,
        )
        .then(
          (response) => response != null
              ? popularRestaurantModel.value = response
              : EasyLoading.showInfo('${SimError.APIERROR}'),
        );
    update();
  }

  Future<void> fetchNearbyRestaurantModel() async {
    var response = await RestServices.fetchNearbyRestaurant();

    if (response != null) {
      nearByRestaurantModel.value = response;
    } else {
      return null;
    }
  }
}
