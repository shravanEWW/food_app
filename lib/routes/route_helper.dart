import 'package:food_app/pages/food/recommended_food_details.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../pages/shop/popular_shop_details.dart';

class RoutHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainFoodPage();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularShopDetails( pageId: int.parse(pageId!));
        },
        transition: Transition.zoom),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.zoom),
  ];
}
