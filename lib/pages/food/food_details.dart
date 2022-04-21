import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/home/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    size: Dimensions.ratio * 40,
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
                    text: "Silver App Bar",
                    size: Dimensions.ratio * 26,
                  )),
                ),
              ),
              pinned: true,
              backgroundColor: Colors.yellow,
              expandedHeight: Dimensions.ratio * 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/food.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.ratio * 20, right: Dimensions.ratio * 20,bottom: Dimensions.ratio * 20),
                child: SingleChildScrollView(
                  child: ExpandableText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur."),
                ),
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
                          offset:
                              Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
                    ],
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.ratio * 20)),
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
                BigText(text: " \$10.00   X   1"),
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
                          offset:
                              Offset(Dimensions.ratio * 5, Dimensions.ratio * 5)),
                    ],
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.ratio * 20)),
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
          ],
        ),
      ),
    );
  }
}
