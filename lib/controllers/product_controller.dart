
import 'package:food_app/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/product_repo.dart';

class  ProductController extends GetxController {
  final ProductRepo productRepo;

  // ProductController({required this.productRepo});
  ProductController({required this.productRepo});
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList() ;
    print("Success launcher"+response.statusCode.toString());
    if(response.statusCode==200){
      _productList=[];
      _productList.addAll(Product.fromJson(response.body).products);
      update();
    }else{
      print("failed launcher"+response.statusCode.toString());
    }
  }
}
