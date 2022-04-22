import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/home/colors.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/constants/app_constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  int pageId;
  RecommendedFoodDetails({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(

          slivers: [

            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                onTap: (){
                  Get.toNamed(RoutHelper.getInitial());
                }
                    ,child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      size: Dimensions.ratio * 40,
                    ),
                  ),
                  AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      size: Dimensions.ratio * 40),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.ratio * 20),
                child: Container(
                  padding: EdgeInsets.only(top: 10 * Dimensions.ratio),
                  color: Colors.white,
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimensions.ratio * 26,
                  )),
                ),
              ),
              pinned: true,
              backgroundColor: Colors.yellow,
              expandedHeight: Dimensions.ratio * 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL+AppConstants.UPLOAD+product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.ratio * 20,
                        top: Dimensions.ratio*20,
                        right: Dimensions.ratio * 20,
                        bottom: Dimensions.ratio * 20),
                    child: ExpandableText(
                            text:product
                                .description!,
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.ratio * 10),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: Dimensions.ratio * 5.0,
                          offset: Offset(
                              Dimensions.ratio * 5, Dimensions.ratio * 5)),
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.ratio * 20)),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: Dimensions.ratio * 20,
                  ),
                ),
                SizedBox(
                  width: Dimensions.ratio * 20,
                ),
                BigText(text: " \$ ${product.price!}  X   0"),
                SizedBox(
                  width: Dimensions.ratio * 20,
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.ratio * 10),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: Dimensions.ratio * 5.0,
                          offset: Offset(
                              Dimensions.ratio * 5, Dimensions.ratio * 5)),
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.ratio * 20)),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: Dimensions.ratio * 20,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.ratio * 5,
                  bottom: Dimensions.ratio * 5,
                  right: Dimensions.ratio * 5,
                  left: Dimensions.ratio * 1),
              height: Dimensions.ratio * 115,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(Dimensions.ratio * 20),
                    padding: EdgeInsets.all(Dimensions.ratio * 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: Dimensions.ratio * 5.0,
                            offset: Offset(
                                Dimensions.ratio * 5, Dimensions.ratio * 5)),
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.ratio * 20)),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.heart_broken_rounded,
                        color: AppColors.mainColor,
                        size: Dimensions.ratio * 20,
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.ratio * 50,
                    margin: EdgeInsets.all(Dimensions.ratio * 30),
                    padding: EdgeInsets.all(Dimensions.ratio * 15),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: Dimensions.ratio * 5.0,
                            offset: Offset(
                                Dimensions.ratio * 0, Dimensions.ratio * 5)),
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.ratio * 20)),
                    ),
                    child: Row(children: [
                      BigText(
                        text: "\$${product.price!} Add to cart",
                        size: Dimensions.ratio * 16,
                        color: Colors.white,
                      ),
                    ]),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: Dimensions.ratio * 5.0,
                      offset:
                          Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
                ],
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.ratio * 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
