import 'package:food_app/data/repository/cart_repo.dart';
import 'package:food_app/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    if (_items.containsKey(productModel.id!)) {
      _items.update(productModel.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          quantity: value.quantity! + quantity,
          price: value.price,
          isExist: true,
          img: value.img,
          time: DateTime.now().toString(),
        );
      });
    } else {
      _items.putIfAbsent(productModel.id!, () {
        return CartModel(
          id: productModel.id,
          name: productModel.name,
          quantity: quantity,
          price: productModel.price,
          isExist: true,
          img: productModel.img,
          time: DateTime.now().toString(),
        );
      });
    }
  }
}
