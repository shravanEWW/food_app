import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/CartController.dart';
import 'package:food_app/pages/home/colors.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/utils/constants/app_constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.ratio * 60,
              left: Dimensions.ratio * 20,
              right: Dimensions.ratio * 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: Dimensions.ratio * 100,
                  ),
                  GestureDetector(
                   onTap: (){
                     Get.to(()=>MainFoodPage());
                   }, child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.ratio * 100,
              left: Dimensions.ratio * 20,
              right: Dimensions.ratio * 20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.ratio*15),
               // color: AppColors.iconColor,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 100 * Dimensions.ratio,
                            width: double.maxFinite,
                            //color: Colors.blue,
                            margin: EdgeInsets.all(Dimensions.ratio * 10),
                            child: Row(
                              children: [
                                Container(
                                    width: Dimensions.ratio * 100,
                                    height: Dimensions.ratio * 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.ratio * 20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                         AppConstants.BASE_URL+AppConstants.UPLOAD+cartController.getItems[index].img!,
                                        ),
                                      ),
                                    )),
                                SizedBox(width: Dimensions.ratio*10,),
                                Expanded(child: Container(
                                  height: Dimensions.ratio*100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!,color: Colors.black,),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: "\$ ${cartController.getItems[index].price.toString()}",color: Colors.redAccent,),
                                          Container(
                                            height: Dimensions.ratio * 40,
                                            width: Dimensions.ratio * 100,
                                            padding: EdgeInsets.all(Dimensions.ratio * 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black45,
                                                    blurRadius: Dimensions.ratio * 5.0,
                                                    offset:
                                                    Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
                                              ],
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(Dimensions.ratio * 10)),
                                            ),
                                            child:
                                            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // popularProduct.setQuantity(false);
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: AppColors.signColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimensions.ratio * 10,
                                              ),
                                              BigText(
                                                // text: "popularProduct.inCartItems.toString()",
                                                text: "0",
                                                color: AppColors.mainColor,
                                              ),
                                              SizedBox(
                                                width: Dimensions.ratio * 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  //popularProduct.setQuantity(true);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: AppColors.signColor,
                                                ),
                                              ),
                                            ]),
                                          ),

                                        ],
                                      )
                                    ],

                                  ),
                                ))
                              ],
                            ),
                          );
                        });
                  })
                ),
              ))
        ],
      ),
    );
  }
}
