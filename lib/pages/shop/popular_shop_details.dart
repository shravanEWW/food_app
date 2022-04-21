import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text.dart';

import '../../widgets/app_column.dart';
import '../home/colors.dart';

class PopularShopDetails extends StatelessWidget {
  const PopularShopDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //backGround Image

            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350 * Dimensions.ratio,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/food1.jpg"))),
                )),
            //icon widgets
            Positioned(
                top: Dimensions.ratio * 45,
                left: Dimensions.ratio * 20,
                right: Dimensions.ratio * 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                        icon: Icons.arrow_back_ios, size: Dimensions.ratio * 20),
                    AppIcon(icon: Icons.shopping_cart_outlined),
                  ],
                )),
            //introduction of food
            Positioned(
              top: Dimensions.ratio * 350 - Dimensions.ratio * 30,
              left: 0,
              right: 0,
              bottom: 0,
              // padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.ratio * 20,
                    right: Dimensions.ratio * 20,
                    top: Dimensions.ratio * 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: "Chinese Food",
                    ),
                    SizedBox(
                      height: Dimensions.ratio * 20,
                    ),
                    BigText(
                      text: "Introduce",
                      size: Dimensions.ratio * 20,
                    ),
                    SizedBox(
                      height: Dimensions.ratio * 15,
                    ),
                    //expandable text widget
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur"),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.ratio * 20),
                      topLeft: Radius.circular(Dimensions.ratio * 20),
                    ),
                    color: Colors.white),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              bottom: Dimensions.ratio * 5,
              right: Dimensions.ratio * 5,
              left: Dimensions.ratio * 1),
          height: Dimensions.ratio * 115,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Dimensions.ratio * 50,
                width: Dimensions.ratio * 100,
                margin: EdgeInsets.all(Dimensions.ratio * 20),
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
                      BorderRadius.all(Radius.circular(Dimensions.ratio * 20)),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                    size: Dimensions.ratio * 16,
                  ),
                  SizedBox(
                    width: Dimensions.ratio * 10,
                  ),
                  BigText(
                    text: "0",
                    size: Dimensions.ratio * 16,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.ratio * 10,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                    size: Dimensions.ratio * 16,
                  ),
                ]),
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
                        offset:
                            Offset(Dimensions.ratio * 0, Dimensions.ratio * 5)),
                  ],
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.ratio * 20)),
                ),
                child: Row(children: [
                  BigText(
                    text: "\$10.00 Add to cart",
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
                  offset: Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
            ],
            borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.ratio * 30)),
          ),
        ),
      ),
    );
  }
}
