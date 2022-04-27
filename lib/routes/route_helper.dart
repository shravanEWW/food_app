import 'package:food_app/pages/food/recommended_food_details.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';
import '../pages/shop/popular_shop_details.dart';

class RoutHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => '$initial';

  static String getPopularFood(int pageId,String page) => '$popularFood?pageId=$pageId&page=$page';

  static String getCartPage() => '$cartPage';

  static String getRecommendedFood(int pageId,String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

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
          var page = Get.parameters['page'];

          return PopularShopDetails(pageId: int.parse(pageId!),page:page!);
        },
        transition: Transition.zoom
    ),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetails(pageId: int.parse(pageId!),page:page!);
        },
        transition: Transition.zoom
    ),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.zoom
    ),
  ];
}
