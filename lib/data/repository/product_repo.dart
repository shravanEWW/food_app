import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/utils/constants/app_constants.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxService{
  final ApiClient apiClient;
  ProductRepo({
    required this.apiClient
});
  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URL);
  }

}