import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/home/colors.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_and_text_widget.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;

  double _scaleFactor = 0.8;
  double _height = Dimensions.ratio * 220;
  double currScale = 1.0;
  double currTrans = 1.0;
  Matrix4 matrix = Matrix4.identity();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        //  print("Current page value :" + _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Slider Section
      Container(
        height: Dimensions.ratio * 320,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      // DotIndicator Section
      DotsIndicator(
        dotsCount: 5,
        position: _currentPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: Size.square(Dimensions.ratio * 9.0),
          activeSize: Size(Dimensions.ratio * 18.0, Dimensions.ratio * 9.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.ratio * 5.0)),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
            left: Dimensions.ratio * 30,
            top: Dimensions.ratio * 10,
            bottom: Dimensions.ratio * 10),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            BigText(text: "Popular",size: Dimensions.ratio*20),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.ratio * 10,
                  top: Dimensions.ratio * 10,
                  bottom: Dimensions.ratio * 5),
              child: SmallText(text: "Restaurants",size: Dimensions.ratio*12),
            ),
          ],
        ),
      ),
      // list of Shops Section
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.ratio * 20,
                  right: Dimensions.ratio * 20,
                  bottom: Dimensions.ratio * 20),
              child: Row(
                children:[
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.ratio * 110,
                                top: Dimensions.ratio * 15,
                                bottom: Dimensions.ratio * 15,
                                right: Dimensions.ratio * 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                    text: "World Famous Taj Hotel of Mumbai",size: Dimensions.ratio*20,),
                                SizedBox(
                                  height: Dimensions.ratio * 5,
                                ),
                                SmallText(text: "this is the dummy text",size: Dimensions.ratio*12),
                                SizedBox(
                                  height: Dimensions.ratio *10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        size: Dimensions.ratio * 15,
                                        iconColor: AppColors.iconColor),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        size: Dimensions.ratio * 15,
                                        iconColor: AppColors.mainColor),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "32min",
                                        size: Dimensions.ratio * 15,
                                        iconColor: AppColors.iconColor2)
                                  ],
                                )
                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(
                              top: Dimensions.ratio * 10,
                              bottom: Dimensions.ratio * 10,
                              left: Dimensions.ratio * 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFe8e8e8),
                                  blurRadius: Dimensions.ratio * 5.0,
                                  offset: Offset(Dimensions.ratio * -1,
                                      Dimensions.ratio * 5)),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(Dimensions.ratio * -5,
                                      Dimensions.ratio * 0))
                            ],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.ratio * 20),
                              bottomRight:
                                  Radius.circular(Dimensions.ratio * 20),
                            ),
                            color: Colors.white10,
                          ),
                        ),
                        Container(
                          height: Dimensions.ratio * 120,
                          width: Dimensions.ratio * 120,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.ratio * 20),
                              color: Colors.white30,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/food.jpg"))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })
    ]);
  }

  Widget _buildPageItem(int index) {
    // Current Page
    if (index == _currentPageValue.floor()) {
      currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // Next Page
    else if (index == _currentPageValue.floor() + 1) {
      currScale =
          _scaleFactor + (_currentPageValue - index) * (1 - _scaleFactor);
      currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // // Previous Page
    else if (index == _currentPageValue.floor() - 1) {
      currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.ratio * 220,
            margin: EdgeInsets.only(
                left: Dimensions.ratio * 10, right: Dimensions.ratio * 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.ratio * 30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food5.jpg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.ratio * 120,
              margin: EdgeInsets.only(
                  left: Dimensions.ratio * 30,
                  right: Dimensions.ratio * 30,
                  bottom: Dimensions.ratio * 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.ratio * 20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: Dimensions.ratio * 5.0,
                        offset: Offset(
                            Dimensions.ratio * -1, Dimensions.ratio * 5)),
                    BoxShadow(
                        color: Colors.white,
                        offset:
                            Offset(Dimensions.ratio * -5, Dimensions.ratio * 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.ratio * 15,
                      left: Dimensions.ratio * 15,
                      right: Dimensions.ratio * 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Chinese Veggie",
                        size: Dimensions.ratio * 20,
                      ),
                      SizedBox(height: Dimensions.ratio * 10),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: AppColors.mainColor,
                                      size: Dimensions.ratio * 15))),
                          SizedBox(width: Dimensions.ratio * 10),
                          SmallText(
                            text: "4.5",
                            size: Dimensions.ratio * 12,
                          ),
                          SizedBox(width: Dimensions.ratio * 10),
                          SmallText(
                            text: "1267",
                            size: Dimensions.ratio * 12,
                          ),
                          SizedBox(width: Dimensions.ratio * 10),
                          SmallText(
                              text: "comments", size: Dimensions.ratio * 12),
                        ],
                      ),
                      SizedBox(height: Dimensions.ratio * 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              size: Dimensions.ratio * 15,
                              iconColor: AppColors.iconColor),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.7km",
                              size: Dimensions.ratio * 15,
                              iconColor: AppColors.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "32min",
                              size: Dimensions.ratio * 15,
                              iconColor: AppColors.iconColor2)
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
