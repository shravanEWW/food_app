import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/cart/cart_page.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  int _selectedIndex = 0;
  late PersistentTabController _controller;

  /*List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page"))),
    Container(child: Center(child: Text("Next Next Page"))),
    Container(child: Center(child: Text("Next Next Next Page"))),
  ];*/
/*
  void onTapNav(int index) {
    setState(() {
      _selectedIndex=index;
    });
  }*/
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child: Text("History Page"))),
      CartPage(),
      Container(child: Center(child: Text("Profile Page"))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(

        icon: Icon(
          CupertinoIcons.home,),
        title: ("home"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor4,
        inactiveColorPrimary: AppColors.iconColor4,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.archivebox_fill
        ),
        title: ("history"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor5,
        inactiveColorPrimary: AppColors.iconColor5,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.cart
        ),
        title: ("cart"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor6,
        inactiveColorPrimary: AppColors.iconColor6,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.person,
        ),
        title: ("me"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.iconColor7,
        inactiveColorPrimary: AppColors.iconColor7,
      ),
    ];
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.iconColor5,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap:onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
              label: "history"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,),
              label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: "me"),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    );
  }
}
