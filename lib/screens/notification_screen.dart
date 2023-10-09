import 'package:ecommerce/screens/notification_activity_screen.dart';
import 'package:ecommerce/screens/notification_feed_screen.dart';
import 'package:ecommerce/screens/notification_offer_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:ecommerce/themes/flutter_font_icons.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 78),
        child: Padding(
          padding: const EdgeInsets.only(top: 15,left: 8,right: 8),
          child: AppBar(
            title: const Text('Notification'),
            titleSpacing: 0,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDarkColor,
              letterSpacing: 0.5,
              height: 1.5,
              fontFamily: 'poppins',
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ),

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              /// divider
              Container(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),

              /// offer
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotificationOfferScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.local_offer_outlined,
                                color: AppColors.primaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                'Offer',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryDarkColor,
                                  letterSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.lightRed,
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 32,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotificationFeedScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.list_alt_outlined,
                                color: AppColors.primaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                'Feed',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryDarkColor,
                                  letterSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.lightRed,
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 32,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotificationActivityScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FlutterFontIcons.notification,
                                color: AppColors.primaryColor,
                                size: 24,
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                'Acivity',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryDarkColor,
                                  letterSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.lightRed,
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
