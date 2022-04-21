import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/pages/food/food_details.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependancies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: FoodDetails(),
      //home: PopularShopDetails(),
      home: MainFoodPage(),
    );
  }
}
