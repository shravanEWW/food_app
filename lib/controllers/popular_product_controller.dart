import 'package:flutter/material.dart';
import 'package:food_app/controllers/CartController.dart';
import 'package:food_app/data/repository/popular_product_repo.dart';
import 'package:food_app/models/products_model.dart';
import 'package:food_app/pages/home/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _inCartItems = 0;

  int get onCartItems => _inCartItems + _quantity;

  int _quantity = 0;

  int get quantity => _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print("Success launcher" + response.statusCode.toString());
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print("failed launcher" + response.statusCode.toString());
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item Count", "you can not remove more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 100) {
      Get.snackbar("Item Count", "you can not add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 100;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        print("The id is " +
            value.id.toString() +
            " The quantity is " +
            value.quantity.toString());
      });
    } else {
      Get.snackbar("Item Count", "you should at least add an item in cart !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
  }
}
