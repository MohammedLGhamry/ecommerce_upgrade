import 'package:ecommerce/screens/account_screen.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/explore_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/notification_offer_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/themes/flutter_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0 ;

  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    NotificationOfferScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        selectedItemColor: AppColors.primaryColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: AppColors.grey,
        backgroundColor: Colors.white,
        currentIndex: screenIndex,
        onTap: (int index){
          setState(() {
            screenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.home_outlined,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.search,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -5),
                badgeContent: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.local_offer_outlined,
              ),
            ),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                FlutterFontIcons.user,
              ),
            ),
            label: 'Account',
          ),
        ],
      ),

      body: screens[screenIndex],

    );
  }
}
