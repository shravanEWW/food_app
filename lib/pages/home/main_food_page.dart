import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';

import 'colors.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    /*print("height: " + MediaQuery.of(context).size.height.toString());
    print("screenHeight: " + Dimensions.screenHeight.toString());*/

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.ratio * 10),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.ratio * 20, right: Dimensions.ratio * 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Ahmedabad",
                          color: AppColors.mainColor,
                          size: Dimensions.ratio * 20,
                        ),
                        Row(
                          children: [
                            SmallText(
                                text: "Sola",
                                color: Colors.black54,
                                size: Dimensions.ratio * 12),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        height: Dimensions.ratio * 45,
                        width: Dimensions.ratio * 45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.ratio * 15),
                          color: AppColors.mainColor,
                        ),
                        child: AppIcon(
                          icon: Icons.search,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        ),
      ),
    );
  }
}
