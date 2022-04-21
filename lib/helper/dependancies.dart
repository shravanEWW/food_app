import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/data/repository/product_repo.dart';
import 'package:get/get.dart';
import '../utils/constants/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}
